/* Test the sqlBookings database
- create a temporary table to hold the results
- clean up any prior tests by deleting a class called 'TEST' and all associated data if it exists
- create a new class called 'TEST' with a couple of resources and associated schedules
- resources are called R1 and R2
- schedules are initially setup for mon-tue next week, one slot 09:00-12:00, 2 capacity

- perform tests 
-	Each test has a unique sequence number. Tests may be inserted into the sequence at any time, so a multi-part identifier is used. E.g. to add a test between 1.0.0 and 2.0.0 use reference 1.5.0
-	Each tests starts by inserting a failed result, and updates this to a pass only when a successful result is detected. 
-	A comment about each test briefly describes what it does and also what state changes are made - sequences of tests may rely on the system being in a particular state
-   Each block of tests will first setup the tests by clearing out temporary tables, then perform the test actions which populate temporary tables with the results, then analyse the output to determine test results

- present the results of the tests
- clean up
*/


-- cleanup from any prior executions
delete from ticket where booking_id in (select id from booking where resource_id in (select id from resource where class_id in (select id from class where name='TEST')))
delete from booking where resource_id in (select id from resource where class_id in (select id from class where name='TEST'))
delete from schedule where resource_id in (select id from resource where class_id in (select id from class where name='TEST'))
delete from availability_cache where resource_id in (select id from resource where class_id in (select id from class where name='TEST'))
delete from resource where class_id in (select id from class where name='TEST')
delete from class where name='TEST'
drop table if exists #results
drop table if exists #suggest_resources_output
drop table if exists #suggest_dates_output
drop table if exists #suggest_slots_output
drop table if exists #reserve_output
drop table if exists #action_output

-- setup global variables - they should not be changed by the tests
declare @testdate date, @testdatetime datetime, @class int, @res1 int, @res2 int, @sched1 int, @sched2 int
-- setup local variables - they can be changed by tests. Each test must initialise any variable it uses.
declare @test int
declare @myint int, @mydatetime datetime, @mydate date, @mytime time, @mystr nvarchar(500)
declare @myint2 int, @mydatetime2 datetime, @mydate2 date, @mytime2 time, @mystr2 nvarchar(500)

-- set @testdate to be a week after next monday, @testdatetime is 09:00
DECLARE @NextDayID INT  = 0 -- 0=Mon, 1=Tue, 2 = Wed, ..., 5=Sat, 6=Sun
SELECT @testdate=DATEADD(DAY, (DATEDIFF(DAY, @NextDayID, GETDATE()) / 7) * 7 + 7, @NextDayID)
SELECT @testdate=DATEADD(DAY, 7, @testdate)
select @testdatetime=dateadd(hour,9,convert(datetime,@testdate))
print concat('Testing date is ',@testdate)

-- setup test class/resource/schedule
insert into class(name, new_booking_process, update_booking_process, resource_ad_groups, schedule_ad_groups, booking_ad_groups, view_ad_groups) values ('TEST','','','','','','')
set @class=@@IDENTITY

insert into resource(class_id, name,admin_description, customer_description, email_description, location, directions, price_level_text) 
	values(@class,'R1','R1_admin_description','R1_customer_description','R1_email_description','R1_location','R1_directions','R1_price_level_text') 
set @res1=@@IDENTITY

insert into resource(class_id, name,admin_description, customer_description, email_description, location, directions, price_level_text) 
	values(@class,'R2','R2_admin_description','R2_customer_description','R2_email_description','R2_location','R2_directions','R2_price_level_text') 
set @res2=@@IDENTITY

insert into schedule(resource_id, first_date, last_date, weekdays, open_at, close_at, duration_mins, min_notice_mins, max_notice_mins, total_capacity, transaction_capacity, price_level_text, allow_duration_multiples)
	values(@res1,@testdate, dateadd(day,14,@testdate),'Monday, Tuesday','09:00','12:00',90,0,28800,2,2,'Sched1',0)
set @sched1=@@IDENTITY

insert into schedule(resource_id, first_date, last_date, weekdays, open_at, close_at, duration_mins, min_notice_mins, max_notice_mins, total_capacity, transaction_capacity, price_level_text, allow_duration_multiples)
	values(@res2,@testdate, dateadd(day,14,@testdate),'Monday, Tuesday','09:00','12:00',90,0,28800,2,2,'Sched1',0)
set @sched2=@@IDENTITY

-- create temporary tables for results, and for the output from the various stored procs
-- the output tables have a 'call' value - this is so that the same function can be called multiple times in a test scenario and the results compared. e.g.

create table #results(id int identity(1,1),ref nvarchar(30), test nvarchar(500), pass bit, result nvarchar(500))
create table #suggest_resources_output(id int identity(1,1), call nvarchar(100), name nvarchar(100), location nvarchar(100), customer_description nvarchar(500), lat decimal, lng decimal, resource_price_level nvarchar(100), class_price_level nvarchar(100), available_from date, available_to date, max_party_size int, display nvarchar(500))
create table #suggest_dates_output(id int identity(1,1), call nvarchar(100), name nvarchar(100), location nvarchar(100), customer_description nvarchar(500), lat decimal, lng decimal, resource_price_level nvarchar(100), class_price_level nvarchar(100), date_available date, max_party_size int, display nvarchar(500))
create table #suggest_slots_output(id int identity(1,1), call nvarchar(100), name nvarchar(100), slot_key nvarchar(100), start_at datetime, duration_mins int, resource_id int, max_party_size int, display nvarchar(500))
create table #reserve_output(id int identity(1,1), call nvarchar(100),reservation_id int, expiry_key nvarchar(500), expiry_date datetime)
create table #action_output(id int identity(1,1), call nvarchar(100), msg nvarchar(500), msg2 nvarchar(500))


--create table #suggest_slots_output()
--create table #suggest_slots_output()
--create table #reserve_output()
--create table #confirm_output()
/*
*****************************
BEGIN TESTS
*****************************
*/

/* TEST 1.0.0 
	SCENARIO UNDER TEST: Suggest_resources
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.0.0','Default call to suggest resources should return 2 records',0)
	set @test=@@IDENTITY
	delete from #suggest_resources_output
end
begin -- test
	insert into #suggest_resources_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, available_from, available_to, max_party_size, display)
		exec suggest_resources 'TEST'
end
begin -- analysis
	update #results set pass=case when @@ROWCOUNT =2 then 1 else 0 end, result=@@ROWCOUNT from #suggest_resources_output where #results.id=@test

	select @myint=count(*) from #suggest_resources_output where display is null
	insert into #results(ref,test, pass,result) values ('1.0.1','Suggest resources should not return null displays',case when @myint=0 then 1 else 0 end, @myint)

	select @mydate=min(available_from), @mydate2=max(available_to) from #suggest_resources_output
	insert into #results(ref,test, pass,result) values ('1.0.2','Suggest resources should return correct date range',case when @mydate=@testdate and @mydate2=dateadd(day,8,@testdate) then 1 else 0 end, @myint)
end

/* TEST 1.1.0 
	SCENARIO UNDER TEST: Suggest_resources
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.1.0','Call to suggest resources should return 0 records if party size too big',0)
	set @test=@@IDENTITY
	delete from #suggest_resources_output
end
begin -- test
	insert into #suggest_resources_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, available_from, available_to, max_party_size, display)
		exec suggest_resources 'TEST',3
end
begin -- analysis
	select @myint=count(*) from #suggest_resources_output
	update #results set pass=case when @myint =0 then 1 else 0 end, result=@myint where id=@test
end

/* TEST 1.2.0 
	SCENARIO UNDER TEST: Suggest_resources
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.2.0','Call to suggest resources should return 0 records if date range too early',0)
	set @test=@@IDENTITY
	delete from #suggest_resources_output
end
begin -- test
	set @mydate=convert(date,getdate())
	set @mydate2=convert(date,dateadd(day,1,getdate()))
	insert into #suggest_resources_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, available_from, available_to, max_party_size, display)
		exec suggest_resources 'TEST',1,@mydate, @mydate2
end
begin -- analysis
	select @myint=count(*) from #suggest_resources_output
	update #results set pass=case when @myint =0 then 1 else 0 end, result=@myint where id=@test
end

/* TEST 1.3.0 
	SCENARIO UNDER TEST: Suggest_resources
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.3.0','Call to suggest resources with name filter should return 1 record',0)
	set @test=@@IDENTITY
	delete from #suggest_resources_output
end
begin -- test
	insert into #suggest_resources_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, available_from, available_to, max_party_size, display)
		exec suggest_resources @class= 'TEST',@party_size=1,@resource_search='R1'
end
begin -- analysis
	select @myint=count(*) from #suggest_resources_output
	update #results set pass=case when @myint =1 then 1 else 0 end, result=@myint where id=@test
	
end

/* TEST 1.5.0 
	SCENARIO UNDER TEST: Suggest_dates
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.5.0','Default call to suggest dates should return 8 records',0)
	set @test=@@IDENTITY
	delete from #suggest_dates_output
end
begin -- test
	insert into #suggest_dates_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, date_available, max_party_size, display)
		exec suggest_dates 'TEST'
end
begin -- analysis
	update #results set pass=case when @@ROWCOUNT =8 then 1 else 0 end, result=@@ROWCOUNT from #suggest_dates_output where #results.id=@test

	select @myint=count(*) from #suggest_dates_output where display is null
	insert into #results(ref,test, pass,result) values ('1.5.1','Suggest dates should not return null displays',case when @myint=0 then 1 else 0 end, @myint)

	select @mydate=min(date_available), @mydate2=max(date_available) from #suggest_dates_output
	insert into #results(ref,test, pass,result) values ('1.5.2','Suggest dates should return correct date range',case when @mydate=@testdate and @mydate2=dateadd(day,8,@testdate) then 1 else 0 end, @myint)
end



/* TEST 1.6.0 
	SCENARIO UNDER TEST: Suggest_resources
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.6.0','Call to suggest dates should return 0 records if party size too big',0)
	set @test=@@IDENTITY
	delete from #suggest_dates_output
end
begin -- test
	insert into #suggest_dates_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, date_available, max_party_size, display)
		exec suggest_dates 'TEST',3
end
begin -- analysis
	select @myint=count(*) from #suggest_dates_output
	update #results set pass=case when @myint =0 then 1 else 0 end, result=@myint where id=@test
end

/* TEST 1.7.0 
	SCENARIO UNDER TEST: Suggest_resources
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.7.0','Call to suggest dates should return 0 records if date range too early',0)
	set @test=@@IDENTITY
	delete from #suggest_dates_output
end
begin -- test
	set @mydate=convert(date,getdate())
	set @mydate2=convert(date,dateadd(day,1,getdate()))
	insert into #suggest_dates_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, date_available, max_party_size, display)
		exec suggest_dates 'TEST',1,@mydate, @mydate2
end
begin -- analysis
	select @myint=count(*) from #suggest_dates_output
	update #results set pass=case when @myint =0 then 1 else 0 end, result=@myint where id=@test
end
/* TEST 1.8.0 
	SCENARIO UNDER TEST: Suggest_dates
	STATE CHANGES: None
*/
begin -- setup
	insert into #results(ref,test, pass) values ('1.8.0','Call to suggest dates for test class with name filter should return 4 records',0)
	set @test=@@IDENTITY
	delete from #suggest_dates_output
end
begin -- test
	insert into #suggest_dates_output(name, location, customer_description, lat, lng, resource_price_level, class_price_level, date_available, max_party_size, display)
		exec suggest_dates @class= 'TEST',@party_size=1,@resource_search='R1'
end
begin -- analysis
	select @myint=count(*) from #suggest_dates_output
	update #results set pass=case when @myint =4 then 1 else 0 end, result=@myint where id=@test
	
end

/* TEST 2.0.0 
	SCENARIO UNDER TEST: suggest slots / reserve / extend
	STATE CHANGES: Leaves an elapsed temporary booking for the first available slot
*/

begin -- setup
	insert into #results(ref,test, pass) values ('2.0.0','Suggest slots returns 4 results on a valid day',0)
	set @test=@@IDENTITY
	delete from #suggest_slots_output
	delete from #reserve_output
	delete from #action_output
end
begin -- test
	-- suggest some slots
	-- test filtering inputs for suggest slots
	-- reserve a slot
	-- call suggest_slots with a different reference - should be fewer slots
	set @mydate=dateadd(day,3,@testdate)
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST01','TEST',@testdate
	update #suggest_slots_output set call='01' where call is null
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST01','TEST',@testdate,'R1'
	update #suggest_slots_output set call='02' where call is null
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST01','TEST',@mydate
	update #suggest_slots_output set call='03' where call is null

	--reserve the first slot for R1
	select @mystr= min(slot_key) from #suggest_slots_output where call = '02'
	print @mystr
	insert into #reserve_output(reservation_id,expiry_key, expiry_date)	exec reserve_key @mystr, 'TEST 02.00.00',60,1,'Test user'
	update #reserve_output set call='01' where call is null

	--reserve it again. This should return identical reservation_id and reservation_key, and not cause further availability issues.
	insert into #reserve_output(reservation_id,expiry_key, expiry_date)	exec reserve_key @mystr, 'TEST 02.00.00',60,1,'Test user'
	update #reserve_output set call='02' where call is null
	
	--re-running suggest_slots should return a max_party_size of 1
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST01','TEST',@testdate,'R1'
	update #suggest_slots_output set call='04' where call is null
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST01','TEST',@testdate,'R1',@party_size=2
	update #suggest_slots_output set call='05' where call is null

	--pass in the same reference we used for the reservation and it should return the same key
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST 02.00.00','TEST',@testdate,'R1',@party_size=2
	update #suggest_slots_output set call='06' where call is null

	-- A few extend tests. First try the wrong case reference, which should fail
	select @myint=reservation_id from #reserve_output where call='02'
	insert into #action_output(msg,msg2) exec extend @myint, 'BAD',0
	update #action_output set call='01' where call is null
	-- This one should succeed and extend the reservation by 15 min
	insert into #action_output(msg,msg2) exec extend @myint, 'TEST 02.00.00',15
	-- quickly record the difference between the current date and time and the expiry date returned by the extend call if it worked
	update #action_output set call='02', msg=datediff(minute,getdate(),convert(datetime,msg2)) where call is null and msg ='ok'
	-- if it didn't work, we still need to set the call to avoid confusion
	update #action_output set call='02' where call is null 

	insert into #action_output(msg,msg2) exec extend @myint, 'TEST 02.00.00',0
	update #action_output set call='03' where call is null

	-- wait a sec
	WAITFOR DELAY '00:00:01';

	-- suggest slots again - should be back to normal
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST01','TEST',@testdate,'R1'
	update #suggest_slots_output set call='07' where call is null

end
begin -- analysis
	
	select @myint=count(*) from #suggest_slots_output where call='01'
	update #results set pass=case when @myint =4 then 1 else 0 end, result=@myint where id=@test
	select @myint=count(*) from #suggest_slots_output where call='02'
	insert into #results(ref,test, pass,result) values ('2.0.1','Call to suggest slots with name filter should return 2 records',case when @myint =2 then 1 else 0 end, @myint)
	select @myint=count(*) from #suggest_slots_output where call='03'
	insert into #results(ref,test, pass,result) values ('2.0.2','Call to suggest slots with bad date should return 0 records',case when @myint =0 then 1 else 0 end, @myint)
	select @myint=count(*) from #reserve_output where call='01' and reservation_id>0
	insert into #results(ref,test, pass,result) values ('2.0.3','Valid call to reserve R1 returns a reservation ID',case when @myint =1 then 1 else 0 end, @myint)

	select @myint=min(max_party_size) from #suggest_slots_output where call='04'
	insert into #results(ref,test, pass,result) values ('2.0.4','Max party size reduces when temporary booking exists with different case ref',case when @myint =1 then 1 else 0 end, @myint)
	select @myint=count(*) from #suggest_slots_output where call='05'
	insert into #results(ref,test, pass,result) values ('2.0.4','Slot suggestion removed when temporary booking exists with different case ref',case when @myint =1 then 1 else 0 end, @myint)
	select @myint=count(*) from #suggest_slots_output where call='06'
	insert into #results(ref,test, pass,result) values ('2.0.4','Slot suggestion remains present when temporary booking exists with same case ref',case when @myint =2 then 1 else 0 end, @myint)
	select @myint= count(*) from (select reservation_id, expiry_key from #reserve_output where call in ('01','02') group by reservation_id, expiry_key) as subq
	insert into #results(ref,test, pass,result) values ('2.0.5','Duplicate calls to Reserve have no adverse effect',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=count(*) from #action_output where call='01' and msg='fail'
	insert into #results(ref,test, pass,result) values ('2.0.6','Extend will fail if case ref is invalid',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=count(*) from #action_output where call='02' and msg='15'
	insert into #results(ref,test, pass,result) values ('2.0.7','Extend works if case ref and reservation id are valid',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=count(*) from #action_output where call='03' and msg='ok' and getdate()>convert(datetime,msg2)
	insert into #results(ref,test, pass,result) values ('2.0.8','Extending by 0 mins cancels a reservation',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=min(max_party_size) from #suggest_slots_output where call='07'
	insert into #results(ref,test, pass,result) values ('2.0.9','Elapsed reservation does not affect max_party_size',case when @myint =2 then 1 else 0 end, @myint)

	select @myint=count(*) from booking where case_ref='TEST 02.00.00' and debug_log like 'Reserved at%Extended at%Extended at%' and debug_log not like 'Reserved at%Extended at%Extended at%Extended at%' and expiry_date< getdate()
	insert into #results(ref,test, pass,result) values ('2.0.10','Elapsed reservation remains present in system with useful debug log',case when @myint =1 then 1 else 0 end, @myint)
	
	-- expose the detailed results if anything didn't pass		
	if exists(select 0 from #results where pass=0 and ref like '2.%')
	begin
		select * from #suggest_slots_output
		select * from #reserve_output
		select * from #action_output
		select * from booking where case_ref='TEST 02.00.00'
	end
end

/* TEST 3.0.0 
	SCENARIO UNDER TEST: reserve/confirm/set tickets
	STATE CHANGES: Creates a permenant booking with ref 'TEST 03.00.00' with party size of 2
*/

begin -- setup
	insert into #results(ref,test, pass) values ('3.0.0','Confirm will error when given an expired booking',0)
	set @test=@@IDENTITY
	delete from #suggest_slots_output
	delete from #reserve_output
	delete from #action_output
end
begin -- test
	--try to confirm the expired booking created in test 2
	select @myint=id from booking where case_ref='TEST 02.00.00'
	insert into #action_output(msg, msg2) exec confirm @myint, 'TEST 02.00.00','testuser@awesomeconsulting.co.uk','test user','07811 000000', '1 Test St, Test town',0,'PAYREF001','','test1','test2','test3','test4'
	update #action_output set call='01' where call is null

	-- suggest some slots
	set @mydate=dateadd(day,3,@testdate)
	insert into #suggest_slots_output(name, slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots 'TEST01','TEST',@testdate, @party_size=2
	update #suggest_slots_output set call='01' where call is null
	
	--reserve the first slot for R1
	select @mystr= min(slot_key) from #suggest_slots_output where call = '01'
	print @mystr
	insert into #reserve_output(reservation_id,expiry_key, expiry_date)	exec reserve_key @mystr, 'TEST 03.00.00',60,2,'Test user'
	update #reserve_output set call='01' where call is null

	--try to confirm the new reservation 
	select @myint=reservation_id from #reserve_output where call='01'
	insert into #action_output(msg, msg2) exec confirm @myint, 'TEST 03.00.00','testuser@awesomeconsulting.co.uk','test user','07811 000000', '1 Test St, Test town',0,'PAYREF001','','test1','test2','test3','test4'
	update #action_output set call='02' where call is null

	-- set the tickets without a ticket number
	insert into #action_output(msg) exec set_ticket @myint, 'TEST 03.00.00', @ticket_name='ticket one', @ticket_notes='notes one'
	update #action_output set call='ticket01' where call is null
	insert into #action_output(msg) exec set_ticket @myint, 'TEST 03.00.00', @ticket_name='ticket 2', @ticket_notes='notes 2'
	update #action_output set call='ticket02' where call is null
	-- party size is 2, so this third attempt should fail
	insert into #action_output(msg) exec set_ticket @myint, 'TEST 03.00.00', @ticket_name='ticket 3', @ticket_notes='notes 3'
	update #action_output set call='ticket03' where call is null
	
	-- pass in ticket_number=1, so will overwrite the first ticket's details
	insert into #action_output(msg) exec set_ticket @myint, 'TEST 03.00.00', 1, @ticket_name='ticket 3', @ticket_notes='notes 3'
	update #action_output set call='ticket04' where call is null

end
begin
	-- check confirm results
	select @myint=count(*) from #action_output where call='01' and msg='fail'
	update #results set pass=case when @myint =1 then 1 else 0 end, result=@myint where id=@test
	select @myint=count(*) from #action_output where call='02' and msg='ok'
	insert into #results(ref,test, pass,result) values ('3.0.1','Confirm reports that it works if case ref and reservation id are valid',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=count(*) from booking where case_ref='TEST 03.00.00' and expiry_date is null 
		and booker_email='testuser@awesomeconsulting.co.uk' and booker_name='test user' and booker_phone= '07811 000000' and booker_address= '1 Test St, Test town'
		and payment_amount= 0 and payment_ref = 'PAYREF001' and response='' and text1='test1' and text2='test2' and text3='test3' and text4='test4'
	insert into #results(ref,test, pass,result) values ('3.0.2','Confirm updates the booking properly when it reports success',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=count(*) from booking where case_ref='TEST 02.00.00' and expiry_date is null 
	insert into #results(ref,test, pass,result) values ('3.0.3','Confirm definitely doesn''t clear the expiry date of a booking when it reports failure',case when @myint=0 then 1 else 0 end, @myint)
	
	--check ticket results
	select @myint=count(*) from #action_output where call='ticket01' and msg='ok'
	insert into #results(ref,test, pass,result) values ('3.0.4','Set ticket works if there are no tickets and no ticket number passed in',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=count(*) from #action_output where call='ticket03' and msg='fail'
	insert into #results(ref,test, pass,result) values ('3.0.5','Set ticket stops working when max tickets set and no ticket number passed in',case when @myint=1 then 1 else 0 end, @myint)
	select @myint=count(*) from #action_output where call='ticket04' and msg='ok'
	insert into #results(ref,test, pass,result) values ('3.0.6','Set ticket works if acceptable ticket number passed in and ticket exists',case when @myint=1 then 1 else 0 end, @myint)
	
	-- expose the detailed results if anything didn't pass		
	if exists(select 0 from #results where pass=0 and ref like '3.%')
	begin
		select * from #suggest_slots_output
		select * from #reserve_output
		select * from #action_output
		select * from booking where case_ref='TEST 03.00.00'
		select * from ticket where booking_id in (select id from booking where case_ref='TEST 03.00.00')
	end

end



/* TEST 4.0.0 
	SCENARIO UNDER TEST: set tickets
	STATE CHANGES: 
*/

/* TEST 5.0.0 
	SCENARIO UNDER TEST: change/cancel
	STATE CHANGES: 
*/


/* TEST 6.0.0 
	SCENARIO UNDER TEST: suggest_slots for complex schedules, multi-slot durations, overlapping bookings
	STATE CHANGES: 
*/

/* TEST 7.0.0 
	SCENARIO UNDER TEST: display_template formatting
	STATE CHANGES: 
*/


/*
*****************************
END TESTS
*****************************
*/
select concat( count(*),' tests ', case when pass=1 then 'passed' else 'failed' end) results_summary from #results group by pass
select * from #results
drop table if exists #results
drop table if exists #suggest_resources_output
drop table if exists #suggest_dates_output
drop table if exists #suggest_slots_output
drop table if exists #reserve_output
drop table if exists #action_output

-- select * from booking