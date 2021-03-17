USE [CommonBookings]
GO
/* Common bookings upgrade script */
/* checks the upgrade_log table. if we've already run this script, it will set noexec on which means it does nothing meaningful at all */
if exists(select 0 from upgrade_log where version = '1.0.1')
begin
	set noexec on
end
go
/* put statements here */

GO
/* record successful upgrade here */
insert into upgrade_log(version, features, applied) values ('1.0.1','Change_booking proc',getdate())
go

set noexec off