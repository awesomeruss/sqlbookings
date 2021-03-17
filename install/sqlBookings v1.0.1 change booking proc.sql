USE [CommonBookings]
GO
if exists(select 0 from upgrade_log where version = '1.0.1')
begin
	set noexec on
end

/****** Object:  StoredProcedure [dbo].[change_booking]    Script Date: 15/03/2021 17:53:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[change_booking]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[change_booking] AS' 
END
GO


ALTER proc [dbo].[change_booking] (@booking int, @case_ref nvarchar(50), @new_duration_mins int=null, @new_start datetime=null)
as
begin
	-- changes the start date and/or duration of a booking, subject to availability.
	-- if new_duration_mins is left null, the original duration will be used
	-- if new_start is left null, the original start will be used
	declare @max int, @resource int, @party int
	-- locate the booking and load its details.
	select 
		@resource = resource_id, 
		@party=ticket_count, 
		@new_duration_mins=coalesce(@new_duration_mins, datediff(minute,start_at, end_at)),
		@new_start=coalesce(@new_start,start_at)  
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
			update booking set date_last_confirmed=getdate(), expiry_date=null, start_at=@new_start, end_at=dateadd(minute, @new_duration_mins, @new_start) where id=@booking and case_ref=@case_ref
			commit tran
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
insert into upgrade_log(version, features, applied) values ('1.0.1','Change_booking proc',getdate())
go

set noexec off