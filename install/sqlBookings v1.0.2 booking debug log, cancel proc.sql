USE [CommonBookings]
GO
/* Common bookings upgrade script */
/* checks the upgrade_log table. if we've already run this script, it will set noexec on which means it does nothing meaningful at all */
if exists(select 0 from upgrade_log where version = '1.0.2')
begin
	set noexec on
end
go
alter table booking add debug_log nvarchar(max) default ''
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Records reserve, confirm, change and cancel operations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'booking', @level2type=N'COLUMN',@level2name=N'debug_log'
go
USE [CommonBookings]
GO

/****** Object:  StoredProcedure [dbo].[reserve]    Script Date: 17/03/2021 09:17:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[reserve](
	@start_at datetime,
	@resource int,
	@duration_mins int,
	@case_ref nvarchar(100),
	@timeout int, --pass in null to immediately create a permanent booking, but be careful about 
	@tickets int=1,
	@createdby nvarchar(100))
as
begin
	-- garbage collect reservations that expired 5 days ago
	delete from dbo.booking where expiry_date < dateadd(day,-5,getdate()) 


	-- expiry key is used to confirm the thing we've reserved hasn't changed
	declare @expiry_key varchar(100), @expiry_date datetime, @reservation int
	set @expiry_key=concat(concat(datename(weekday,@start_at),' ',convert(nvarchar(17),@start_at,113)) ,' ',convert(varchar,@duration_mins),' ',convert(varchar,@tickets),' ',convert(varchar,@resource))
	set @expiry_date=case when @timeout is null then null else dateadd(minute,@timeout,getdate()) end
	
	-- if this reservation already exists, update it and quit
	select @reservation=id from booking where resource_id=@resource and start_at= @start_at and end_at=dateadd(minute,@duration_mins,start_at) and case_ref=@case_ref and ticket_count=@tickets and expiry_date>getdate()
	if @reservation is not null
	begin
		update booking set expiry_date=@expiry_date where id=@reservation
		select @reservation as reservation_id, @expiry_key as expiry_key, @expiry_date as expiry_date
		return
	end
	-- clear out any other reservations that match our case ref - they didn't match the code above so our requirements have changed.
	update booking set expiry_date=getdate() where case_ref = @case_ref and expiry_date is not null

	set transaction isolation level SERIALIZABLE --other processes cannot change data we've read
	begin tran
	-- check that a schedule exists for the date, time, weekday, transaction capacity, duration, notice period
	declare @max int
	set @max=dbo.check_capacity(@resource,@start_at,@duration_mins,@case_ref)

	if @max>=@tickets --there is sufficient capacity
	begin
		
		INSERT INTO [dbo].[booking]
					([resource_id]
					,[case_ref]
					,[expiry_date]
					,[start_at]
					,[end_at]
					,[ticket_count]
					,[date_created]
					,[created_by]
					,[debug_log]
					)
				VALUES
					(@resource
					,@case_ref
					,@expiry_date
					,@start_at
					,dateadd(minute,@duration_mins,@start_at)
					,@tickets
					,getdate()
					,@createdby
					,concat('Reserved at ',convert(varchar,getdate(),113),char(13)))
		set @reservation=@@IDENTITY
		update availability_cache set dirty=1 where resource_id=@resource and cache_date=CONVERT(date,@start_at)
		select @reservation as reservation_id, @expiry_key as expiry_key, @expiry_date as expiry_date
	end
	else
	begin
		--If unsuccessful, return historic date as the timeout to force the user to retry
		set @expiry_date=dateadd(hour,-5,getdate())
		select 0 as reservation_id, @expiry_key as expiry_key, @expiry_date as expiry_date
	end
	commit
end
GO

/****** Object:  StoredProcedure [dbo].[extend]    Script Date: 17/03/2021 09:19:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[extend](
	@reservation int,
	@case_ref nvarchar(100),
	@timeout int)
as
begin
	--extend a booking that matches the supplied
	declare @expiry datetime
	set @expiry=dateadd(minute,@timeout,getdate())
	update booking set expiry_date=@expiry, debug_log=concat(debug_log, 'Extended at ',convert(varchar,getdate(),113),char(13)) where id=@reservation and case_ref=@case_ref and expiry_date>getdate()
	if @@ROWCOUNT=1
	begin
		select 'ok' as timeoutresult, @expiry as expiry_date 
	end
	else
	begin
		select 'fail' as timeoutresult, dateadd(hour,-5,getdate()) as expiry_date
	end
end
GO


ALTER proc [dbo].[confirm](
	@reservation int, 
	@case_ref nvarchar(50), 
	@booker_email nvarchar(500),
	@booker_name nvarchar(500),
	@booker_phone nvarchar(500)='',
	@booker_address nvarchar(500)='',
	@payment_amount money=0,
	@payment_ref nvarchar(50)='',
	@response nvarchar(max)='',
	@text1 nvarchar(500)='',
	@text2 nvarchar(500)='',
	@text3 nvarchar(500)='',
	@text4 nvarchar(500)='')
	as
begin
	if exists(select 0 from booking where id=@reservation and case_ref=@case_ref and coalesce(expiry_date,getdate())>=getdate())
	begin
		update booking set expiry_date=null, date_last_confirmed=getdate(),  debug_log=concat(debug_log, 'Confirmed at ',convert(varchar,getdate(),113),char(13)),
			booker_email=@booker_email, booker_name=@booker_name, booker_phone=@booker_phone, booker_address=@booker_address, 
			payment_amount=@payment_amount, payment_ref=@payment_ref, response=@response,
			text1=@text1,text2=@text2,text3=@text3,text4=@text4
		where id=@reservation and case_ref=@case_ref

		--update the availability cache
		declare @r int, @d date
		select @r=resource_id, @d=convert(date,start_at) from booking where id=@reservation and case_ref=@case_ref and expiry_date is null
		update availability_cache set dirty=1 where resource_id=@r and availability_cache.cache_date=@d
	

		select 'ok' as confirmresult, getdate() as date_last_confirmed 
	end
	else
	begin
		select 'fail' as confirmresult, null as date_last_confirmed
	end
end
GO
USE [CommonBookings]
GO

/****** Object:  StoredProcedure [dbo].[change_booking]    Script Date: 17/03/2021 09:21:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[change_booking] (@booking int, @case_ref nvarchar(50), @new_duration_mins int=null, @new_start datetime=null)
as
begin
	-- changes the start date and/or duration of a booking, subject to availability.
	-- if new_duration_mins is left null, the original duration will be used
	-- if new_start is left null, the original start will be used
	declare @max int, @resource int, @party int, @olddate date, @newdate date
	-- locate the booking and load its details.
	select 
		@resource = resource_id, 
		@party=ticket_count, 
		@new_duration_mins=coalesce(@new_duration_mins, datediff(minute,start_at, end_at)),
		@new_start=coalesce(@new_start,start_at),
		@olddate=convert(date,start_at),
		@newdate=convert(date,coalesce(@new_start,start_at))
		from booking where id=@booking and case_ref=@case_ref

	if @resource is not null
	begin
		set transaction isolation level serializable
		begin tran
		--update the booking to be temporary with far future expiry date. This will mean the capacity check will ignore it as we're providing the same case ref
		update booking set expiry_date=dateadd(year,1,getdate()) where id=@booking and case_ref=@case_ref
		--check availability with the new details
		set @max=dbo.check_capacity(@resource,@new_start,@new_duration_mins,@case_ref)
		if @max>=@party
		begin
			-- there is availability, clear the expiry date and make the changes
			update booking set date_last_confirmed=getdate(), expiry_date=null, start_at=@new_start, end_at=dateadd(minute, @new_duration_mins, @new_start),debug_log=concat(debug_log, 'Changed at ',convert(varchar,getdate(),113),char(13)) where id=@booking and case_ref=@case_ref
			commit tran
			update availability_cache set dirty=1 where resource_id=@resource and availability_cache.cache_date in (@olddate, @newdate)
			select 'ok' as changeresult
		end
		else
		begin
			--can't do it so rollback the transaction. This will clear out the expiry date again because it undoes everything we've done in the transaction.
			rollback tran
			select 'fail' as changeresult
		end

	end
end
GO
CREATE OR ALTER proc [dbo].[cancel] (@booking int, @case_ref nvarchar(50))
as
begin
	-- cancels the specified booking by setting the expiry date to now
	declare @r int, @d date
	select @r=resource_id, @d=convert(date,start_at) from booking where id=@booking and case_ref=@case_ref and expiry_date is null
	if @r is not null
	begin
		update booking set expiry_date=getdate(), debug_log=concat(debug_log, 'Cancelled at ',convert(varchar,getdate(),113),char(13)) where id=@booking and case_ref=@case_ref
		update availability_cache set dirty=1 where resource_id=@r and availability_cache.cache_date=@d
		select 'ok' as cancelresult
	end
	else
	begin
		select 'fail' as cancelresult
	end
end
GO

GO
/* record successful upgrade here */
insert into upgrade_log(version, features, applied) values ('1.0.2','Booking debug log, cancel proc',getdate())
go

set noexec off

select convert(varchar,getdate(),113)