--if exists(select 0 from master..sysdatabases where name='CommonBookings')
--begin
--	set noexec on
--	print 'Installation aborted as CommonBookings database already exists'
--end
USE [CommonBookings]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'allow_duration_multiples'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'allow_duration_multiples'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'transaction_capacity'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'transaction_capacity'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'total_capacity'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'total_capacity'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'max_notice_mins'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'max_notice_mins'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'min_notice_mins'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'min_notice_mins'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'close_at'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'close_at'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'weekdays'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'weekdays'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'last_date'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'last_date'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'schedule', N'COLUMN',N'first_date'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'first_date'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'resource', N'COLUMN',N'directions'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'directions'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'resource', N'COLUMN',N'location'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'location'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'resource', N'COLUMN',N'email_description'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'email_description'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'resource', N'COLUMN',N'customer_description'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'customer_description'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'resource', N'COLUMN',N'admin_description'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'admin_description'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'price_level_text'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'price_level_text'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'capita_vat_code'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'capita_vat_code'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'capita_fund_code'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'capita_fund_code'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'manager_fullcal_json'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'manager_fullcal_json'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'manager_intro_html'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'manager_intro_html'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'mybooking_intro_html'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'mybooking_intro_html'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'booking_terms_html'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_terms_html'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'booking_label_4'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_4'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'booking_label_3'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_3'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'booking_label_2'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_2'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'booking_label_1'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_1'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'ticket_css'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'ticket_css'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'view_ad_groups'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'view_ad_groups'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'booking_ad_groups'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_ad_groups'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'schedule_ad_groups'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'schedule_ad_groups'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'resource_ad_groups'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'resource_ad_groups'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'update_booking_process'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'update_booking_process'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'class', N'COLUMN',N'new_booking_process'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'new_booking_process'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'availability_cache', N'COLUMN',N'dirty'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'dirty'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'availability_cache', N'COLUMN',N'booked_tickets'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'booked_tickets'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'availability_cache', N'COLUMN',N'booked_slots'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'booked_slots'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'availability_cache', N'COLUMN',N'max_party_size'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'max_party_size'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'availability_cache', N'COLUMN',N'total_tickets'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'total_tickets'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'availability_cache', N'COLUMN',N'total_slots'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'total_slots'
GO
/****** Object:  Trigger [tg_schedule_cache]    Script Date: 15/03/2021 16:17:14 ******/
DROP TRIGGER IF EXISTS [dbo].[tg_schedule_cache]
GO
/****** Object:  StoredProcedure [dbo].[suggest_slots]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[suggest_slots]
GO
/****** Object:  StoredProcedure [dbo].[suggest_resources]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[suggest_resources]
GO
/****** Object:  StoredProcedure [dbo].[suggest_dates]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[suggest_dates]
GO
/****** Object:  StoredProcedure [dbo].[set_ticket_multiple]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[set_ticket_multiple]
GO
/****** Object:  StoredProcedure [dbo].[set_ticket]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[set_ticket]
GO
/****** Object:  StoredProcedure [dbo].[reserve_key]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[reserve_key]
GO
/****** Object:  StoredProcedure [dbo].[reserve]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[reserve]
GO
/****** Object:  StoredProcedure [dbo].[rebuild_numbers]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[rebuild_numbers]
GO
/****** Object:  StoredProcedure [dbo].[extend_multiple]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[extend_multiple]
GO
/****** Object:  StoredProcedure [dbo].[extend]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[extend]
GO
/****** Object:  StoredProcedure [dbo].[confirm]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[confirm]
GO
/****** Object:  StoredProcedure [dbo].[cache_clean]    Script Date: 15/03/2021 16:17:14 ******/
DROP PROCEDURE IF EXISTS [dbo].[cache_clean]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ticket]') AND type in (N'U'))
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT IF EXISTS [FK_ticket_booking]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[schedule]') AND type in (N'U'))
ALTER TABLE [dbo].[schedule] DROP CONSTRAINT IF EXISTS [FK_schedule_resource]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[resource]') AND type in (N'U'))
ALTER TABLE [dbo].[resource] DROP CONSTRAINT IF EXISTS [FK_resource_class1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[class]') AND type in (N'U'))
ALTER TABLE [dbo].[class] DROP CONSTRAINT IF EXISTS [FK_class_schedule1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[class]') AND type in (N'U'))
ALTER TABLE [dbo].[class] DROP CONSTRAINT IF EXISTS [FK_class_resource1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[booking]') AND type in (N'U'))
ALTER TABLE [dbo].[booking] DROP CONSTRAINT IF EXISTS [FK_booking_resource]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[availability_cache]') AND type in (N'U'))
ALTER TABLE [dbo].[availability_cache] DROP CONSTRAINT IF EXISTS [FK_availablity_cache_resource]
GO
/****** Object:  Table [dbo].[upgrade_log]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[upgrade_log]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[ticket]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[schedule]
GO
/****** Object:  Table [dbo].[resource]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[resource]
GO
/****** Object:  Index [CIX_Number]    Script Date: 15/03/2021 16:17:14 ******/
DROP INDEX IF EXISTS [CIX_Number] ON [dbo].[numbers] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[numbers]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[numbers]
GO
/****** Object:  Table [dbo].[class]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[class]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[booking]
GO
/****** Object:  Table [dbo].[availability_cache]    Script Date: 15/03/2021 16:17:14 ******/
DROP TABLE IF EXISTS [dbo].[availability_cache]
GO
/****** Object:  UserDefinedFunction [dbo].[process_slot_display_template]    Script Date: 15/03/2021 16:17:14 ******/
DROP FUNCTION IF EXISTS [dbo].[process_slot_display_template]
GO
/****** Object:  UserDefinedFunction [dbo].[check_capacity]    Script Date: 15/03/2021 16:17:14 ******/
DROP FUNCTION IF EXISTS [dbo].[check_capacity]
GO
USE [master]
GO
/****** Object:  Database [CommonBookings]    Script Date: 15/03/2021 16:17:14 ******/
DROP DATABASE IF EXISTS [CommonBookings]
GO
/****** Object:  Database [CommonBookings]    Script Date: 15/03/2021 16:17:14 ******/
CREATE DATABASE [CommonBookings]
 
GO
ALTER DATABASE [CommonBookings] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommonBookings].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommonBookings] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommonBookings] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommonBookings] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommonBookings] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommonBookings] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommonBookings] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommonBookings] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommonBookings] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommonBookings] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommonBookings] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommonBookings] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommonBookings] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommonBookings] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommonBookings] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommonBookings] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommonBookings] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommonBookings] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommonBookings] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommonBookings] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommonBookings] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommonBookings] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommonBookings] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommonBookings] SET RECOVERY FULL 
GO
ALTER DATABASE [CommonBookings] SET  MULTI_USER 
GO
ALTER DATABASE [CommonBookings] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommonBookings] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommonBookings] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommonBookings] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CommonBookings] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CommonBookings] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CommonBookings', N'ON'
GO
ALTER DATABASE [CommonBookings] SET QUERY_STORE = OFF
GO
USE [CommonBookings]
GO
/****** Object:  UserDefinedFunction [dbo].[check_capacity]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[check_capacity](@resource int, @start_at datetime, @duration_mins int, @case_ref nvarchar(100)) returns int as
begin
	-- common code shared between suggest_slots and reserve
	-- returns the maximum party size for a booking with the passed in details
	declare @max int=0, @tran int=0
	select @max=total_capacity, @tran=transaction_capacity from schedule 
		where resource_id=@resource
		and (convert(date, @start_at) between first_date and last_date)
		and (convert(time, @start_at) >= open_at) and (convert(time, dateadd(minute,@duration_mins,@start_at)) <=close_at)
		and (weekdays like concat('%',datename(weekday,@start_at),'%'))
		and (transaction_capacity>=0)
		and ((@duration_mins = duration_mins) or (allow_duration_multiples=1 and (@duration_mins % duration_mins =0))) -- requested duration mins must be a multiple of schedule duration mins, or must exactly match schedule duration if multiples not allowed
		and (datediff(minute,getdate(),@start_at) between min_notice_mins and max_notice_mins)
		order by total_capacity desc --there shouldn't be more than one schedule valid at any single moment
	if @max >0
	begin
	select @max = coalesce(@max-sum(ticket_count),@max,0) from booking  -- count the overlapping bookings for this resource but not this case ref	
		where resource_id=@resource 
		and (case_ref <>@case_ref)
		and (expiry_date is null or expiry_date > getdate())
		and (start_at <  dateadd(minute,@duration_mins,@start_at)) and (end_at > @start_at)
		-- this bit has a bug that will be exposed if a double-length slot is trying to be booked.
		-- the count of overlapping bookings could exceed the total capacity and the booking should still be allowed. 
		-- E.g. total capacity=10, first slot has 5 bookings and second slot has 7 - there is still space for 3 with the requested details

	end
	if @max>@tran 
	begin
		set @max = @tran
	end
	return @max
end
GO
/****** Object:  UserDefinedFunction [dbo].[process_slot_display_template]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[process_slot_display_template](@template nvarchar(500), @resource int, @start_at datetime, @duration_mins int, @max_party_size int,@price_level nvarchar(100) ) returns nvarchar(500) as
begin
	select @template=replace(@template,'{resource}',name) from resource where id=@resource
	set @template=replace(@template,'{price_level}',@price_level)
	set @template=replace(@template,'{resource_id}',@resource)
	set @template=replace(@template,'{start_date}',format(@start_at,'dd/MM/yyyy'))
	set @template=replace(@template,'{end_date}',format(dateadd(minute,@duration_mins,@start_at),'dd/MM/yyyy')) 
	set @template=replace(@template,'{start_time}',format(@start_at,'hh:mm')) 
	set @template=replace(@template,'{end_time}',format(dateadd(minute,@duration_mins,@start_at),'hh:mm')) 
	set @template=replace(@template,'{duration}',convert(nvarchar,@duration_mins) )	
	set @template=replace(@template,'{max_party_size}',convert(nvarchar,@max_party_size) )	
	return @template
end
GO
/****** Object:  Table [dbo].[availability_cache]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[availability_cache](
	[resource_id] [int] NOT NULL,
	[cache_date] [date] NOT NULL,
	[total_slots] [int] NULL,
	[total_tickets] [int] NULL,
	[max_party_size] [int] NULL,
	[booked_slots] [int] NULL,
	[booked_tickets] [int] NULL,
	[dirty] [bit] NULL,
	[cached_at] [datetime] NULL,
 CONSTRAINT [PK_availablity_cache] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC,
	[cache_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resource_id] [int] NOT NULL,
	[case_ref] [nvarchar](50) NOT NULL,
	[expiry_date] [datetime] NULL,
	[start_at] [datetime] NOT NULL,
	[end_at] [datetime] NOT NULL,
	[ticket_count] [int] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[date_last_confirmed] [datetime] NULL,
	[created_by] [nvarchar](100) NOT NULL,
	[booker_email] [nvarchar](500) NULL,
	[booker_name] [nvarchar](500) NULL,
	[booker_phone] [nvarchar](100) NULL,
	[booker_address] [nvarchar](500) NULL,
	[payment_amount] [money] NULL,
	[payment_ref] [nvarchar](50) NULL,
	[response] [nvarchar](max) NULL,
	[text1] [nvarchar](500) NULL,
	[text2] [nvarchar](500) NULL,
	[text3] [nvarchar](500) NULL,
	[text4] [nvarchar](500) NULL,
 CONSTRAINT [PK_booking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[new_booking_process] [nvarchar](500) NOT NULL,
	[update_booking_process] [nvarchar](500) NOT NULL,
	[default_resource] [int] NULL,
	[default_schedule] [int] NULL,
	[resource_ad_groups] [nvarchar](max) NOT NULL,
	[schedule_ad_groups] [nvarchar](max) NOT NULL,
	[booking_ad_groups] [nvarchar](max) NOT NULL,
	[view_ad_groups] [nvarchar](max) NOT NULL,
	[ticket_background_url] [nvarchar](max) NULL,
	[ticket_css] [nvarchar](max) NULL,
	[ticket_label_1] [nvarchar](500) NULL,
	[ticket_label_2] [nvarchar](500) NULL,
	[ticket_label_3] [nvarchar](500) NULL,
	[ticket_label_4] [nvarchar](500) NULL,
	[booking_label_1] [nvarchar](500) NULL,
	[booking_label_2] [nvarchar](500) NULL,
	[booking_label_3] [nvarchar](500) NULL,
	[booking_label_4] [nvarchar](500) NULL,
	[booking_terms_html] [nvarchar](max) NULL,
	[mybooking_intro_html] [nvarchar](max) NULL,
	[manager_intro_html] [nvarchar](max) NULL,
	[manager_fullcal_json] [nvarchar](max) NULL,
	[capita_payment_ref] [nvarchar](50) NULL,
	[capita_fund_code] [nvarchar](50) NULL,
	[capita_vat_code] [nvarchar](50) NULL,
	[price_level_text] [nvarchar](50) NULL,
 CONSTRAINT [PK_class_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[numbers]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[numbers](
	[number] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [CIX_Number]    Script Date: 15/03/2021 16:17:14 ******/
CREATE UNIQUE CLUSTERED INDEX [CIX_Number] ON [dbo].[numbers]
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resource]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[admin_description] [nvarchar](max) NULL,
	[customer_description] [nvarchar](max) NULL,
	[email_description] [nvarchar](max) NULL,
	[lat] [decimal](18, 8) NULL,
	[lng] [decimal](18, 8) NULL,
	[location] [nvarchar](500) NULL,
	[directions] [nvarchar](500) NULL,
	[price_level_text] [nvarchar](100) NULL,
 CONSTRAINT [PK_resource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resource_id] [int] NOT NULL,
	[first_date] [date] NOT NULL,
	[last_date] [date] NOT NULL,
	[weekdays] [nvarchar](100) NOT NULL,
	[open_at] [time](7) NOT NULL,
	[close_at] [time](7) NOT NULL,
	[duration_mins] [int] NOT NULL,
	[min_notice_mins] [int] NOT NULL,
	[max_notice_mins] [int] NOT NULL,
	[total_capacity] [int] NOT NULL,
	[transaction_capacity] [int] NOT NULL,
	[price_level_text] [nvarchar](100) NULL,
	[allow_duration_multiples] [bit] NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NOT NULL,
	[ticket_number] [int] NOT NULL,
	[ticket_name] [nvarchar](500) NULL,
	[ticket_notes] [nvarchar](500) NULL,
	[ticket_text1] [nvarchar](500) NULL,
	[ticket_text2] [nvarchar](500) NULL,
	[ticket_text3] [nvarchar](500) NULL,
	[ticket_text4] [nvarchar](500) NULL,
 CONSTRAINT [PK_ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[upgrade_log]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[upgrade_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[version] [nvarchar](50) NULL,
	[applied] [datetime] NULL,
	[features] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[class] ON 

INSERT [dbo].[class] ([id], [name], [new_booking_process], [update_booking_process], [default_resource], [default_schedule], [resource_ad_groups], [schedule_ad_groups], [booking_ad_groups], [view_ad_groups], [ticket_background_url], [ticket_css], [ticket_label_1], [ticket_label_2], [ticket_label_3], [ticket_label_4], [booking_label_1], [booking_label_2], [booking_label_3], [booking_label_4], [booking_terms_html], [mybooking_intro_html], [manager_intro_html], [manager_fullcal_json], [capita_payment_ref], [capita_fund_code], [capita_vat_code], [price_level_text]) VALUES (18, N'Dementia Conference', N'/service/Event_booking?event=3', N'', NULL, NULL, N'', N'', N'', N'', N'https://fs-filestore-eu.s3.amazonaws.com/crawley/Images/Process_Images/Santa/ticket.png', NULL, N'Any additional needs (e.g. disability related) or special dietary requirements?', N'', N'', N'', N'Name of organisation (write "none" if not relevant).', N'How did you hear about this event?', N'', N'', N'Please arrive 10 minutes before the advertised start time.', N'This content appears at the top of the "My Bookings" page, and can be customised for each class of events', N'This content appears at the top of the "Manage Bookings" page, and can be customised for each class of events', N'', N'A201261000E00027', N'MI', N'S', N'Dementia Conference booking')
INSERT [dbo].[class] ([id], [name], [new_booking_process], [update_booking_process], [default_resource], [default_schedule], [resource_ad_groups], [schedule_ad_groups], [booking_ad_groups], [view_ad_groups], [ticket_background_url], [ticket_css], [ticket_label_1], [ticket_label_2], [ticket_label_3], [ticket_label_4], [booking_label_1], [booking_label_2], [booking_label_3], [booking_label_4], [booking_terms_html], [mybooking_intro_html], [manager_intro_html], [manager_fullcal_json], [capita_payment_ref], [capita_fund_code], [capita_vat_code], [price_level_text]) VALUES (19, N'Meet Santa', N'/service/Santa_booking', N'', NULL, NULL, N'', N'', N'', N'', N'https://fs-filestore-eu.s3.amazonaws.com/crawley/Images/Process_Images/Santa/ticket.png', NULL, N'Any additional needs (e.g. disability related) or special dietary requirements?', N'', N'', N'', N'', N'', N'', N'', N'Please arrive 10 minutes before the advertised start time.', N'This content appears at the top of the "My Bookings" page, and can be customised for each class of events', N'This content appears at the top of the "Manage Bookings" page, and can be customised for each class of events', N'', N'A201261000E00027', N'MI', N'S', N'Meet Santa booking')
INSERT [dbo].[class] ([id], [name], [new_booking_process], [update_booking_process], [default_resource], [default_schedule], [resource_ad_groups], [schedule_ad_groups], [booking_ad_groups], [view_ad_groups], [ticket_background_url], [ticket_css], [ticket_label_1], [ticket_label_2], [ticket_label_3], [ticket_label_4], [booking_label_1], [booking_label_2], [booking_label_3], [booking_label_4], [booking_terms_html], [mybooking_intro_html], [manager_intro_html], [manager_fullcal_json], [capita_payment_ref], [capita_fund_code], [capita_vat_code], [price_level_text]) VALUES (20, N'Hound Ground', N'/service/Hound_Ground_booking', N'', NULL, NULL, N'', N'', N'', N'', N'', NULL, N'', N'', N'', N'', N'Name of organisation (write "none" if not relevant).', N'How did you hear about this event?', N'', N'', N'Please do not arrive before the advertised start time.', N'This content appears at the top of the "My Bookings" page, and can be customised for each class of events', N'This content appears at the top of the "Manage Bookings" page, and can be customised for each class of events', N'', N'A201261000E00027', N'MI', N'S', N'Hound Ground booking')
INSERT [dbo].[class] ([id], [name], [new_booking_process], [update_booking_process], [default_resource], [default_schedule], [resource_ad_groups], [schedule_ad_groups], [booking_ad_groups], [view_ad_groups], [ticket_background_url], [ticket_css], [ticket_label_1], [ticket_label_2], [ticket_label_3], [ticket_label_4], [booking_label_1], [booking_label_2], [booking_label_3], [booking_label_4], [booking_terms_html], [mybooking_intro_html], [manager_intro_html], [manager_fullcal_json], [capita_payment_ref], [capita_fund_code], [capita_vat_code], [price_level_text]) VALUES (24, N'Adventure Playground', N'/service/Adventure_Playground_booking', N'', NULL, NULL, N'', N'', N'', N'', NULL, NULL, N'', N'', N'', N'', NULL, NULL, N'', N'', NULL, NULL, NULL, N'', NULL, N'MI', N'S', N'Playground')
SET IDENTITY_INSERT [dbo].[class] OFF
GO
INSERT [dbo].[numbers] ([number]) VALUES (0)
INSERT [dbo].[numbers] ([number]) VALUES (1)
INSERT [dbo].[numbers] ([number]) VALUES (2)
INSERT [dbo].[numbers] ([number]) VALUES (3)
INSERT [dbo].[numbers] ([number]) VALUES (4)
INSERT [dbo].[numbers] ([number]) VALUES (5)
INSERT [dbo].[numbers] ([number]) VALUES (6)
INSERT [dbo].[numbers] ([number]) VALUES (7)
INSERT [dbo].[numbers] ([number]) VALUES (8)
INSERT [dbo].[numbers] ([number]) VALUES (9)
INSERT [dbo].[numbers] ([number]) VALUES (10)
INSERT [dbo].[numbers] ([number]) VALUES (11)
INSERT [dbo].[numbers] ([number]) VALUES (12)
INSERT [dbo].[numbers] ([number]) VALUES (13)
INSERT [dbo].[numbers] ([number]) VALUES (14)
INSERT [dbo].[numbers] ([number]) VALUES (15)
INSERT [dbo].[numbers] ([number]) VALUES (16)
INSERT [dbo].[numbers] ([number]) VALUES (17)
INSERT [dbo].[numbers] ([number]) VALUES (18)
INSERT [dbo].[numbers] ([number]) VALUES (19)
INSERT [dbo].[numbers] ([number]) VALUES (20)
INSERT [dbo].[numbers] ([number]) VALUES (21)
INSERT [dbo].[numbers] ([number]) VALUES (22)
INSERT [dbo].[numbers] ([number]) VALUES (23)
INSERT [dbo].[numbers] ([number]) VALUES (24)
INSERT [dbo].[numbers] ([number]) VALUES (25)
INSERT [dbo].[numbers] ([number]) VALUES (26)
INSERT [dbo].[numbers] ([number]) VALUES (27)
INSERT [dbo].[numbers] ([number]) VALUES (28)
INSERT [dbo].[numbers] ([number]) VALUES (29)
INSERT [dbo].[numbers] ([number]) VALUES (30)
INSERT [dbo].[numbers] ([number]) VALUES (31)
INSERT [dbo].[numbers] ([number]) VALUES (32)
INSERT [dbo].[numbers] ([number]) VALUES (33)
INSERT [dbo].[numbers] ([number]) VALUES (34)
INSERT [dbo].[numbers] ([number]) VALUES (35)
INSERT [dbo].[numbers] ([number]) VALUES (36)
INSERT [dbo].[numbers] ([number]) VALUES (37)
INSERT [dbo].[numbers] ([number]) VALUES (38)
INSERT [dbo].[numbers] ([number]) VALUES (39)
INSERT [dbo].[numbers] ([number]) VALUES (40)
INSERT [dbo].[numbers] ([number]) VALUES (41)
INSERT [dbo].[numbers] ([number]) VALUES (42)
INSERT [dbo].[numbers] ([number]) VALUES (43)
INSERT [dbo].[numbers] ([number]) VALUES (44)
INSERT [dbo].[numbers] ([number]) VALUES (45)
INSERT [dbo].[numbers] ([number]) VALUES (46)
INSERT [dbo].[numbers] ([number]) VALUES (47)
INSERT [dbo].[numbers] ([number]) VALUES (48)
INSERT [dbo].[numbers] ([number]) VALUES (49)
INSERT [dbo].[numbers] ([number]) VALUES (50)
INSERT [dbo].[numbers] ([number]) VALUES (51)
INSERT [dbo].[numbers] ([number]) VALUES (52)
INSERT [dbo].[numbers] ([number]) VALUES (53)
INSERT [dbo].[numbers] ([number]) VALUES (54)
INSERT [dbo].[numbers] ([number]) VALUES (55)
INSERT [dbo].[numbers] ([number]) VALUES (56)
INSERT [dbo].[numbers] ([number]) VALUES (57)
INSERT [dbo].[numbers] ([number]) VALUES (58)
INSERT [dbo].[numbers] ([number]) VALUES (59)
INSERT [dbo].[numbers] ([number]) VALUES (60)
INSERT [dbo].[numbers] ([number]) VALUES (61)
INSERT [dbo].[numbers] ([number]) VALUES (62)
INSERT [dbo].[numbers] ([number]) VALUES (63)
INSERT [dbo].[numbers] ([number]) VALUES (64)
INSERT [dbo].[numbers] ([number]) VALUES (65)
INSERT [dbo].[numbers] ([number]) VALUES (66)
INSERT [dbo].[numbers] ([number]) VALUES (67)
INSERT [dbo].[numbers] ([number]) VALUES (68)
INSERT [dbo].[numbers] ([number]) VALUES (69)
INSERT [dbo].[numbers] ([number]) VALUES (70)
INSERT [dbo].[numbers] ([number]) VALUES (71)
INSERT [dbo].[numbers] ([number]) VALUES (72)
INSERT [dbo].[numbers] ([number]) VALUES (73)
INSERT [dbo].[numbers] ([number]) VALUES (74)
INSERT [dbo].[numbers] ([number]) VALUES (75)
INSERT [dbo].[numbers] ([number]) VALUES (76)
INSERT [dbo].[numbers] ([number]) VALUES (77)
INSERT [dbo].[numbers] ([number]) VALUES (78)
INSERT [dbo].[numbers] ([number]) VALUES (79)
INSERT [dbo].[numbers] ([number]) VALUES (80)
INSERT [dbo].[numbers] ([number]) VALUES (81)
INSERT [dbo].[numbers] ([number]) VALUES (82)
INSERT [dbo].[numbers] ([number]) VALUES (83)
INSERT [dbo].[numbers] ([number]) VALUES (84)
INSERT [dbo].[numbers] ([number]) VALUES (85)
INSERT [dbo].[numbers] ([number]) VALUES (86)
INSERT [dbo].[numbers] ([number]) VALUES (87)
INSERT [dbo].[numbers] ([number]) VALUES (88)
INSERT [dbo].[numbers] ([number]) VALUES (89)
INSERT [dbo].[numbers] ([number]) VALUES (90)
INSERT [dbo].[numbers] ([number]) VALUES (91)
INSERT [dbo].[numbers] ([number]) VALUES (92)
INSERT [dbo].[numbers] ([number]) VALUES (93)
INSERT [dbo].[numbers] ([number]) VALUES (94)
INSERT [dbo].[numbers] ([number]) VALUES (95)
INSERT [dbo].[numbers] ([number]) VALUES (96)
INSERT [dbo].[numbers] ([number]) VALUES (97)
INSERT [dbo].[numbers] ([number]) VALUES (98)
INSERT [dbo].[numbers] ([number]) VALUES (99)
GO
INSERT [dbo].[numbers] ([number]) VALUES (100)
INSERT [dbo].[numbers] ([number]) VALUES (101)
INSERT [dbo].[numbers] ([number]) VALUES (102)
INSERT [dbo].[numbers] ([number]) VALUES (103)
INSERT [dbo].[numbers] ([number]) VALUES (104)
INSERT [dbo].[numbers] ([number]) VALUES (105)
INSERT [dbo].[numbers] ([number]) VALUES (106)
INSERT [dbo].[numbers] ([number]) VALUES (107)
INSERT [dbo].[numbers] ([number]) VALUES (108)
INSERT [dbo].[numbers] ([number]) VALUES (109)
INSERT [dbo].[numbers] ([number]) VALUES (110)
INSERT [dbo].[numbers] ([number]) VALUES (111)
INSERT [dbo].[numbers] ([number]) VALUES (112)
INSERT [dbo].[numbers] ([number]) VALUES (113)
INSERT [dbo].[numbers] ([number]) VALUES (114)
INSERT [dbo].[numbers] ([number]) VALUES (115)
INSERT [dbo].[numbers] ([number]) VALUES (116)
INSERT [dbo].[numbers] ([number]) VALUES (117)
INSERT [dbo].[numbers] ([number]) VALUES (118)
INSERT [dbo].[numbers] ([number]) VALUES (119)
INSERT [dbo].[numbers] ([number]) VALUES (120)
INSERT [dbo].[numbers] ([number]) VALUES (121)
INSERT [dbo].[numbers] ([number]) VALUES (122)
INSERT [dbo].[numbers] ([number]) VALUES (123)
INSERT [dbo].[numbers] ([number]) VALUES (124)
INSERT [dbo].[numbers] ([number]) VALUES (125)
INSERT [dbo].[numbers] ([number]) VALUES (126)
INSERT [dbo].[numbers] ([number]) VALUES (127)
INSERT [dbo].[numbers] ([number]) VALUES (128)
INSERT [dbo].[numbers] ([number]) VALUES (129)
INSERT [dbo].[numbers] ([number]) VALUES (130)
INSERT [dbo].[numbers] ([number]) VALUES (131)
INSERT [dbo].[numbers] ([number]) VALUES (132)
INSERT [dbo].[numbers] ([number]) VALUES (133)
INSERT [dbo].[numbers] ([number]) VALUES (134)
INSERT [dbo].[numbers] ([number]) VALUES (135)
INSERT [dbo].[numbers] ([number]) VALUES (136)
INSERT [dbo].[numbers] ([number]) VALUES (137)
INSERT [dbo].[numbers] ([number]) VALUES (138)
INSERT [dbo].[numbers] ([number]) VALUES (139)
INSERT [dbo].[numbers] ([number]) VALUES (140)
INSERT [dbo].[numbers] ([number]) VALUES (141)
INSERT [dbo].[numbers] ([number]) VALUES (142)
INSERT [dbo].[numbers] ([number]) VALUES (143)
INSERT [dbo].[numbers] ([number]) VALUES (144)
INSERT [dbo].[numbers] ([number]) VALUES (145)
INSERT [dbo].[numbers] ([number]) VALUES (146)
INSERT [dbo].[numbers] ([number]) VALUES (147)
INSERT [dbo].[numbers] ([number]) VALUES (148)
INSERT [dbo].[numbers] ([number]) VALUES (149)
INSERT [dbo].[numbers] ([number]) VALUES (150)
INSERT [dbo].[numbers] ([number]) VALUES (151)
INSERT [dbo].[numbers] ([number]) VALUES (152)
INSERT [dbo].[numbers] ([number]) VALUES (153)
INSERT [dbo].[numbers] ([number]) VALUES (154)
INSERT [dbo].[numbers] ([number]) VALUES (155)
INSERT [dbo].[numbers] ([number]) VALUES (156)
INSERT [dbo].[numbers] ([number]) VALUES (157)
INSERT [dbo].[numbers] ([number]) VALUES (158)
INSERT [dbo].[numbers] ([number]) VALUES (159)
INSERT [dbo].[numbers] ([number]) VALUES (160)
INSERT [dbo].[numbers] ([number]) VALUES (161)
INSERT [dbo].[numbers] ([number]) VALUES (162)
INSERT [dbo].[numbers] ([number]) VALUES (163)
INSERT [dbo].[numbers] ([number]) VALUES (164)
INSERT [dbo].[numbers] ([number]) VALUES (165)
INSERT [dbo].[numbers] ([number]) VALUES (166)
INSERT [dbo].[numbers] ([number]) VALUES (167)
INSERT [dbo].[numbers] ([number]) VALUES (168)
INSERT [dbo].[numbers] ([number]) VALUES (169)
INSERT [dbo].[numbers] ([number]) VALUES (170)
INSERT [dbo].[numbers] ([number]) VALUES (171)
INSERT [dbo].[numbers] ([number]) VALUES (172)
INSERT [dbo].[numbers] ([number]) VALUES (173)
INSERT [dbo].[numbers] ([number]) VALUES (174)
INSERT [dbo].[numbers] ([number]) VALUES (175)
INSERT [dbo].[numbers] ([number]) VALUES (176)
INSERT [dbo].[numbers] ([number]) VALUES (177)
INSERT [dbo].[numbers] ([number]) VALUES (178)
INSERT [dbo].[numbers] ([number]) VALUES (179)
INSERT [dbo].[numbers] ([number]) VALUES (180)
GO
SET IDENTITY_INSERT [dbo].[resource] ON 

INSERT [dbo].[resource] ([id], [class_id], [name], [admin_description], [customer_description], [email_description], [lat], [lng], [location], [directions], [price_level_text]) VALUES (20, 18, N'Hawth Studio, Crawley', N'This content is notes for the resource/schedule admin, to describe how schedules are normally managed, etc', N'This content is intended to appear on the booking form, and provides additional information about the resource.', N'This content is intended to appear on the customer''s confirmation email, and provides additional information about the resource.', CAST(51.11151628 AS Decimal(18, 8)), CAST(-0.17473876 AS Decimal(18, 8)), N'The event will be held at the Hawth Studio, Hawth Avenue, Crawley RH10 6YZ', N'', N'Hawth')
INSERT [dbo].[resource] ([id], [class_id], [name], [admin_description], [customer_description], [email_description], [lat], [lng], [location], [directions], [price_level_text]) VALUES (21, 19, N'Tilgate Park, Crawley', N'This content is notes for the resource/schedule admin, to describe how schedules are normally managed, etc', N'<ul>
<li>Use this form to book and pay for ONE group entry to Santa''s Grotto and Elf Workshop.</li>
<li>Each group booking admits up to 4 children. The first child is £12.00, each subsequent child is £9.00.</li>
<li>Two adults can accompany the children free of charge.</li>
<li>We can accommodate up to 2 wheelchairs in a group.</li>
</ul>
<p></p>
<div>Read the <a href="https://tilgateparkchristmas.co.uk/grid/santas-grotto/terms-and-conditions/" target="_blank" rel="noopener" title="terms">terms and conditions</a> for Santa''s Grotto.</div>', N'This content is intended to appear on the customer''s confirmation email, and provides additional information about the resource.', CAST(51.09637233 AS Decimal(18, 8)), CAST(-0.17873304 AS Decimal(18, 8)), N'The event will be held at the Tilgate Park', N'', N'Tilgate')
INSERT [dbo].[resource] ([id], [class_id], [name], [admin_description], [customer_description], [email_description], [lat], [lng], [location], [directions], [price_level_text]) VALUES (22, 20, N'Tilgate Hound Ground', N'This content is notes for the resource/schedule admin, to describe how schedules are normally managed, etc', N'This content is intended to appear on the booking form, and provides additional information about the resource.', N'This content is intended to appear on the customer''s confirmation email, and provides additional information about the resource.', CAST(51.11151628 AS Decimal(18, 8)), CAST(-0.17473876 AS Decimal(18, 8)), N'The event will be held at the Tilgate Hound Ground', N'', N'Hawth')
INSERT [dbo].[resource] ([id], [class_id], [name], [admin_description], [customer_description], [email_description], [lat], [lng], [location], [directions], [price_level_text]) VALUES (23, 24, N'Tilgate Adventure Playground', N' ', N' ', N' ', CAST(51.11151628 AS Decimal(18, 8)), CAST(-0.17473876 AS Decimal(18, 8)), N' ', NULL, N'Tilgate')
SET IDENTITY_INSERT [dbo].[resource] OFF
GO
SET IDENTITY_INSERT [dbo].[schedule] ON 

INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (38, 20, CAST(N'2021-04-01' AS Date), CAST(N'2021-04-01' AS Date), N'Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday', CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time), 420, 0, 129600, 5, 5, N'Off peak', 0)
INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (39, 20, CAST(N'2021-04-15' AS Date), CAST(N'2021-04-15' AS Date), N'Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday', CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time), 420, 0, 129600, 5, 5, N'Off peak', 0)
INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (40, 21, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-23' AS Date), N'Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday', CAST(N'10:35:00' AS Time), CAST(N'11:41:00' AS Time), 6, 1440, 129600, 1, 1, N'Shift 1', 0)
INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (41, 21, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-23' AS Date), N'Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday', CAST(N'11:50:00' AS Time), CAST(N'13:01:00' AS Time), 6, 1440, 129600, 1, 1, N'Shift 2', 0)
INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (42, 21, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-23' AS Date), N'Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday', CAST(N'13:55:00' AS Time), CAST(N'16:01:00' AS Time), 6, 1440, 129600, 1, 1, N'Shift 3', 0)
INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (43, 21, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-23' AS Date), N'Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday', CAST(N'16:15:00' AS Time), CAST(N'18:03:00' AS Time), 6, 1440, 129600, 1, 1, N'Shift 4', 0)
INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (44, 22, CAST(N'2021-04-01' AS Date), CAST(N'2021-06-01' AS Date), N'Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday', CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 60, 0, 129600, 1, 5, N'Hound Ground Spring', 0)
INSERT [dbo].[schedule] ([id], [resource_id], [first_date], [last_date], [weekdays], [open_at], [close_at], [duration_mins], [min_notice_mins], [max_notice_mins], [total_capacity], [transaction_capacity], [price_level_text], [allow_duration_multiples]) VALUES (45, 23, CAST(N'2021-03-15' AS Date), CAST(N'2021-09-30' AS Date), N'Saturday, Sunday', CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time), 60, 1440, 129600, 20, 5, N'Summer', 0)
SET IDENTITY_INSERT [dbo].[schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[upgrade_log] ON 

INSERT [dbo].[upgrade_log] ([id], [version], [applied], [features]) VALUES (1, N'01.00.00', getdate(), N'create initial database objects and sample data')
SET IDENTITY_INSERT [dbo].[upgrade_log] OFF
GO
ALTER TABLE [dbo].[availability_cache]  WITH CHECK ADD  CONSTRAINT [FK_availablity_cache_resource] FOREIGN KEY([resource_id])
REFERENCES [dbo].[resource] ([id])
GO
ALTER TABLE [dbo].[availability_cache] CHECK CONSTRAINT [FK_availablity_cache_resource]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_booking_resource] FOREIGN KEY([resource_id])
REFERENCES [dbo].[resource] ([id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_booking_resource]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_resource1] FOREIGN KEY([default_resource])
REFERENCES [dbo].[resource] ([id])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_resource1]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_schedule1] FOREIGN KEY([default_schedule])
REFERENCES [dbo].[schedule] ([id])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_schedule1]
GO
ALTER TABLE [dbo].[resource]  WITH CHECK ADD  CONSTRAINT [FK_resource_class1] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[resource] CHECK CONSTRAINT [FK_resource_class1]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule_resource] FOREIGN KEY([resource_id])
REFERENCES [dbo].[resource] ([id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_schedule_resource]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[booking] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_booking]
GO
/****** Object:  StoredProcedure [dbo].[cache_clean]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cache_clean] as
begin
	set nocount on
	-- first, identify missing cache records and create dirty entries for them
	-- this uses the numbers table to ensure we have cache data for today+number for every record in numbers - initially 0-180.
	delete from availability_cache where cache_date < convert(date,getdate())
	insert into availability_cache(resource_id,cache_date,dirty)
	select distinct r.id, dateadd(day,n.number,convert(date,getdate())) as cache_date, 1 as dirty
		from numbers n 
		cross join resource r
		left join availability_cache c on r.id=c.resource_id and c.cache_date=dateadd(day,n.number,convert(date,getdate())) 
		where c.resource_id is null
	
	 -- interesting one this - the cache has to reflect the min/max notice mins, so we need to dirty it as time elapses. 
	 --		We could carefully figure out which records were cached so long ago that the min/max notice period has elapsed over them
	 --		Or we could take the easy, less performant way out and rebuild everything older than a day....
	 update availability_cache set dirty=1 where dateadd(day,1,cached_at)<=getdate()
	

	--then open a cursor for the dirty records and clean each one
	declare @r int, @d date, @total_slots int, @total_tickets int, @max_party_size int,@booked_slots int, @booked_tickets int, @class nvarchar(100), @resource nvarchar(100)
	declare cc cursor forward_only for 
		select resource_id, cache_date from availability_cache where dirty=1 for update
	open cc
	create table #slots(name nvarchar(100), slot_key nvarchar(100), resource_id int, start_at datetime, duration_mins int, max_party_size int, display nvarchar(500))
	fetch next from cc into @r,@d
	while @@FETCH_STATUS=0
	begin
		--calculate the total slots and total tickets from the schedules, note the max party size if there were no bookings
		set @total_slots=0
		set @total_tickets=0
		set @max_party_size=0
		select 
			@total_slots=coalesce(sum(DATEDIFF(minute, s.open_at, s.close_at)/s.duration_mins) ,0)
			,@total_tickets=coalesce(sum((DATEDIFF(minute, s.open_at, s.close_at)/s.duration_mins)*s.total_capacity),0)
			,@class=c.name
			,@resource=r.name
			from schedule s inner join resource r on s.resource_id=r.id inner join class c on r.class_id=c.id
			where resource_id=@r
			and (@d between first_date and last_date)
			and (weekdays like concat('%',datename(weekday,@d),'%'))
		    and (datediff(minute,getdate(),@d) between min_notice_mins and max_notice_mins)
			group by c.name, r.name

		-- max party size needs to check the slots
		if @total_slots>0
		begin
			delete from #slots
			print concat('Checking max capacity for ',@class,',',@d,',',@resource)
			insert into #slots(name,slot_key, start_at, duration_mins, resource_id, max_party_size, display) exec suggest_slots '',@class,@d,@resource
			select @max_party_size=max(max_party_size) from #slots
		end
		--calculate the booked slots and booked tickets from the bookings
		select @booked_slots=count(*), @booked_tickets=coalesce(sum(b.ticket_count),0) from booking b where resource_id=@r and CONVERT(date, b.start_at)=@d and expiry_date is null
		
		update availability_cache set dirty=0, total_slots=@total_slots, total_tickets=@total_tickets, max_party_size=@max_party_size, booked_slots=@booked_slots, booked_tickets=@booked_tickets, cached_at = getdate() where current of cc
		fetch next from cc into @r,@d
	end
	close cc
	deallocate cc
	drop table #slots
end
GO
/****** Object:  StoredProcedure [dbo].[confirm]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[confirm](
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
		update booking set expiry_date=null, date_last_confirmed=getdate(),
			booker_email=@booker_email, booker_name=@booker_name, booker_phone=@booker_phone, booker_address=@booker_address, 
			payment_amount=@payment_amount, payment_ref=@payment_ref, response=@response,
			text1=@text1,text2=@text2,text3=@text3,text4=@text4
		where id=@reservation and case_ref=@case_ref
		select 'ok' as confirmresult, getdate() as date_last_confirmed 
	end
	else
	begin
		select 'fail' as confirmresult, null as date_last_confirmed
	end
end
GO
/****** Object:  StoredProcedure [dbo].[extend]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[extend](
	@reservation int,
	@case_ref nvarchar(100),
	@timeout int)
as
begin
	--extend a booking that matches the supplied
	declare @expiry datetime
	set @expiry=dateadd(minute,@timeout,getdate())
	update booking set expiry_date=@expiry where id=@reservation and case_ref=@case_ref and expiry_date>getdate()
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
/****** Object:  StoredProcedure [dbo].[extend_multiple]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[extend_multiple](@case_ref_prefix nvarchar(100), @timeout int)
as
begin
	-- extend 1 or more temporary bookings. Used when a booking workflow allows several bookings to be made in a single transaction.
	-- pass in a prefix for the case ref, assuming the full reference is of the format "prefix.suffix"
	-- following the principle of not repeating logic, this proc calls extend rather than duplicating its functionality
	-- returns a count of the successfully extended bookings, which should be compared with the number of rows in the booking subform
	set nocount on
	create table #extendresults(timeoutresult nvarchar(50), expiry datetime)
	declare @r int, @case_ref nvarchar(50), @ok int, @fail int
	declare c cursor for select id, case_ref from booking where case_ref like concat(@case_ref_prefix,'.%') and expiry_date>getdate()
	open c
	fetch next from c into @r, @case_ref
	while @@FETCH_STATUS=0
	begin
		insert into #extendresults exec extend @r, @case_ref, @timeout
		fetch next from c into @r, @case_ref
	end
	close c
	deallocate c
	select @ok=count(*) from #extendresults where timeoutresult='ok'
	select @fail=count(*) from #extendresults where timeoutresult='fail'
	select @ok as extend_multiple_ok, @fail as extend_multiple_fail
	drop table #extendresults
end
GO
/****** Object:  StoredProcedure [dbo].[rebuild_numbers]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[rebuild_numbers](@UpperBound int=180)
as
begin
	drop table numbers
	
	;WITH cteN(Number) AS
	(
	  SELECT ROW_NUMBER() OVER (ORDER BY s1.[object_id]) - 1
	  FROM sys.all_columns AS s1
	  CROSS JOIN sys.all_columns AS s2
	)
	SELECT [number] INTO dbo.numbers
	FROM cteN WHERE [Number] <= @UpperBound;

	CREATE UNIQUE CLUSTERED INDEX CIX_Number ON dbo.Numbers([Number])
	WITH 
	(
	  FILLFACTOR = 100,      -- in the event server default has been changed
	  DATA_COMPRESSION = ROW -- if Enterprise & table large enough to matter
	);
end
GO
/****** Object:  StoredProcedure [dbo].[reserve]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[reserve](
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
					)
				VALUES
					(@resource
					,@case_ref
					,@expiry_date
					,@start_at
					,dateadd(minute,@duration_mins,@start_at)
					,@tickets
					,getdate()
					,@createdby)
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
/****** Object:  StoredProcedure [dbo].[reserve_key]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[reserve_key] (@key nvarchar(100),	@case_ref nvarchar(100),
	@timeout int, --pass in null to immediately create a permanent booking
	@tickets int=1,
	@createdby nvarchar(100))
as
begin
	declare @start_at datetime, @resource_id int, @duration_mins int
	set @start_at=convert(datetime, left(@key,23))
	set @key=SUBSTRING(@key,25,99)
	set @resource_id = convert(int,left(@key,CHARINDEX('.','20.420')-1))
	set @duration_mins=convert(int,substring(@key,CHARINDEX('.','20.420')+1,99))
	exec reserve @start_at, @resource_id, @duration_mins, @case_ref, @timeout, @tickets, @createdby

end

GO
/****** Object:  StoredProcedure [dbo].[set_ticket]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[set_ticket](
	@booking int, @case_ref nvarchar(50), 
	@ticket_number int=null, 
	@ticket_name nvarchar(500),
	@ticket_notes nvarchar(500),
	@text1 nvarchar(500)='',
	@text2 nvarchar(500)='',
	@text3 nvarchar(500)='',
	@text4 nvarchar(500)='')
as
begin
	--create or update a ticket for the specified booking. 
	--will error if booking does not exist 
	--if ticket_number is blank it will assign the next number, unless there are already tickets set that match the booking.ticket_count
	--only works for confirmed bookings

	--calculate next ticket number if not passed in
	if @ticket_number is null
	begin
		select @ticket_number=count(*)+1 from ticket inner join booking on ticket.booking_id=booking.id where booking.id=@booking and case_ref=@case_ref
	end

	--check booking exists and has suitable ticket count
	declare @maxt int
	select @maxt=ticket_count from booking where id=@booking and case_ref=@case_ref and expiry_date is null
	if @maxt is not null and @maxt>=@ticket_number
	begin
		-- insert/update the ticket
		if not exists(select 0 from ticket where id=@booking and ticket_number=@ticket_number)
		begin
			insert into ticket(booking_id, ticket_number) values (@booking, @ticket_number)
		end
		update ticket set 
			ticket_name=@ticket_name, ticket_notes=@ticket_notes, 
			ticket_text1=@text1, ticket_text2=@text2, ticket_text3=@text3, ticket_text4=@text4
			where booking_id=@booking and ticket_number=@ticket_number	
		select 'ok' as ticketresult
	end
	else
	begin
		select 'fail' as setticketresult
	end

end
GO
/****** Object:  StoredProcedure [dbo].[set_ticket_multiple]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[set_ticket_multiple](
	@case_ref_prefix nvarchar(50),
	@ticket_number int=null, 
	@ticket_name nvarchar(500),
	@ticket_notes nvarchar(500),
	@text1 nvarchar(500)='',
	@text2 nvarchar(500)='',
	@text3 nvarchar(500)='',
	@text4 nvarchar(500)='')
	as
begin
	--create or update a ticket for multiple bookings. 
	--used when a single workflow creates one or more bookings with common ticket details
	--e.g. booking an adventure playground session for the same 5 kids on 8 different dates.
	set nocount on
	create table #ticketresults(result nvarchar(50))
	declare @r int, @case_ref nvarchar(50), @ok int, @fail int
	declare c cursor for select id, case_ref from booking where case_ref like concat(@case_ref_prefix,'.%') and expiry_date is null
	open c
	fetch next from c into @r, @case_ref
	while @@FETCH_STATUS=0
	begin
		insert into #ticketresults exec set_ticket @r, @case_ref, @ticket_number, @ticket_name, @ticket_notes, @text1, @text2, @text3, @text4
		fetch next from c into @r, @case_ref
	end
	close c
	deallocate c
	select @ok=count(*) from #ticketresults where result='ok'
	select @fail=count(*) from #ticketresults where result='fail'
	select @ok as ticket_multiple_ok, @fail as ticket_multiple_fail
	drop table #ticketresults
end
GO
/****** Object:  StoredProcedure [dbo].[suggest_dates]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[suggest_dates](@class nvarchar(100), @party_size int=1, @from date='1 Jan 1900', @to date=null, @resource_search nvarchar(100)='%', @display_template nvarchar(500)='{date_available} - {name}', @results int=10) as
begin
	set nocount on
	if @to is null select @to=max(cache_date) from availability_cache
	select top (@results)
		convert(varchar,r.id)+'.'+format(a.cache_date,'dd MMM yyyy') as name, 
		r.location,
		r.customer_description,
		r.lat,
		r.lng,
		r.price_level_text as resource_price_level,
		c.price_level_text as class_price_level,
		a.cache_date as date_available,
		a.max_party_size,
		replace(replace(replace(replace(replace(replace(replace(@display_template,'{max_party_size}',convert(varchar,a.max_party_size)),'{date_available}',format(a.cache_date,'dd MMM yyyy')),'{resource_price_level}',c.price_level_text),'{class_price_level}',c.price_level_text),'{customer_description}',r.customer_description),'{location}',r.location),'{name}',r.name) as display
	from resource r 
		inner join class c on r.class_id=c.id
		inner join availability_cache a on r.id=a.resource_id and a.total_slots>a.booked_slots and a.max_party_size>=@party_size and a.cache_date between @from and @to
	where c.name=@class and r.name like @resource_search
	order by a.cache_date, r.name
end
GO
/****** Object:  StoredProcedure [dbo].[suggest_resources]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[suggest_resources](@class nvarchar(100), @party_size int=1, @from date='1 Jan 1900', @to date=null, @resource_search nvarchar(100)='%', @display_template nvarchar(500)='{name} available between {available_from} and {available_to}') as
begin
	set nocount on
	if @to is null select @to=max(cache_date) from availability_cache
	select 
		r.id as name, 
		r.location,
		r.customer_description,
		r.lat,
		r.lng,
		r.price_level_text as resource_price_level,
		c.price_level_text as class_price_level,
		min(a.cache_date) as available_from,
		max(a.cache_date) as available_to,
		max(a.max_party_size) as max_party_size,
		replace(replace(replace(replace(replace(replace(replace(replace(@display_template,'{max_party_size}',convert(varchar,max(a.max_party_size))),'{available_to}',format(max(a.cache_date),'dd MMM yyyy')),'{available_from}',format(min(a.cache_date),'dd MMM yyyy')),'{resource_price_level}',r.price_level_text),'{class_price_level}',c.price_level_text),'{customer_description}',r.customer_description),'{location}',r.location),'{name}',r.name) as display
	from resource r 
		inner join class c on r.class_id=c.id
		inner join availability_cache a on r.id=a.resource_id and a.total_slots>a.booked_slots and a.max_party_size>=@party_size and a.cache_date between @from and @to
	where c.name=@class and r.name like @resource_search
	group by r.id, r.name, r.location, r.customer_description, r.lat, r.lng, r.price_level_text, c.price_level_text
		
		
end
GO
/****** Object:  StoredProcedure [dbo].[suggest_slots]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[suggest_slots](
	@case_ref nvarchar(100), --needed so that we can exclude any reservations for the current user when testing availability
	@class nvarchar(100),
	@pref_date date,
	@resource_name nvarchar(100)='%', --wildcard-enabled resource name filter
	@display_template nvarchar(500)='{resource} available from {start_date} {start_time} until {end_date} {end_time} ({duration} mins) for up to {max_party_size}',
	@min_time time='00:00',
	@max_time time='23:59',
	@party_size int=1,
	@minduration int=1 --the slot we offer will be based on the schedule duration, and at least this long
	)
as
begin
	set nocount on
	-- return a list of viable slot timings that match the input requirements:
		-- of the same resource class
		-- with a name that matches the supplied pattern
		-- with a schedule that is:
			-- valid on the date
			-- applicable to the weekday
			-- open within the mintime and maxtime for at least minduration
			-- has at least minduration duration, or allows duration multiples
		-- with enough remaining availability when considering existing bookings
		
		-- each choice is returned with a 'key' made up of start_at, resource id, duration_mins; together with a display that matches the format passed in.
		
	declare @classid int, @count int=0, @stop bit=0, @max int
	select @classid=c.id from class c inner join resource r on c.id=r.class_id where c.name=@class and r.name like @resource_name group by c.id
	if @classid is null
	begin
		print concat('No resources of class ',@class,' that have a name that matches "',@resource_name,'" exist. Remember to user % rather than * for wildcard matches')
	end
	else
	begin
		print concat('Testing resources of class ',@class,'(',@classid,') that have a name that matches "',@resource_name,'".')
		create table #viables(resource_id int, start_at datetime not null, duration_mins int not null, max_party_size int, price_level nvarchar(100))
		
		declare @test_time time, @test_duration int, @test_dt datetime
		declare @resource int, @duration_mins int,@open_at time, @close_at time, @schedule int, @price_level nvarchar(100)
		
		declare c cursor for 
			select r.id, s.duration_mins, s.open_at, s.close_at, s.id, s.price_level_text
				from schedule s inner join resource r on s.resource_id=r.id
				where r.class_id=@classid and r.name like @resource_name
					and (@pref_date between first_date and last_date) --schedule must be applicable to pref_date
					and (weekdays like concat('%',datename(weekday,@pref_date),'%')) --weekday of prefdate must match schedule
					and s.open_at< @max_time		--openat/closeat must overlap maxtime/mintime
					and s.close_at>@min_time
					and ((@minduration<= duration_mins) or (allow_duration_multiples=1)) -- requested duration mins must be a multiple of schedule duration mins, or must exactly match schedule duration if multiples not allowed
					and (transaction_capacity>=@party_size)
		open c
		-- loop through each applicable schedule/resource
		fetch next from c into @resource, @duration_mins, @open_at, @close_at, @schedule, @price_level
		while @@FETCH_STATUS=0
		begin
			print concat('processing schedule ',@schedule)
			-- figure out the first slot start time that's after the mintime 
			set @test_time=@open_at 
			while @test_time< @min_time
			begin
				set @test_time=DATEADD(minute,@duration_mins,@test_time)
			end
			print concat('starting at ',@test_time)
			-- figure out the test duration - the lowest multiple of the schedule duration that is >= @minduration
			set @test_duration=@duration_mins
			while @test_duration<@minduration
			begin
				set @test_duration=@test_duration+@duration_mins
			end
			print concat('slot duration is ',@test_duration)
			-- loop until test_time+duration>closeat
			while dateadd(minute,@test_duration, @test_time)<=@close_at
			begin
				set @test_dt=CAST(@pref_date AS DATETIME) + CAST(@test_time AS DATETIME)
				print concat('checking resource ',@resource,' at ',@test_dt, ' for ',@test_duration, ' mins under ref ',@case_ref)
				set @max=dbo.check_capacity(@resource,@test_dt,@test_duration,@case_ref) --this is the authoratative check on availability, which also checks the min/max notice minutes
				if @max>=@party_size
				begin
					--success, insert the viable
					insert into #viables(resource_id,start_at,duration_mins,max_party_size,price_level) values (@resource, @test_dt, @test_duration, @max, @price_level)
					print concat(@max,' capacity found')
				end
				set @test_time=dateadd(minute,@duration_mins,@test_time)

			end --of close_at while loop. get the next schedule
			fetch next from c into @resource, @duration_mins, @open_at, @close_at, @schedule, @price_level
		end
		close c
		deallocate c
		select 
			concat(convert(nvarchar,start_at,25),'.',convert(nvarchar,resource_id),'.',convert(nvarchar,duration_mins)) as name,
			concat(convert(nvarchar,start_at,25),'.',convert(nvarchar,resource_id),'.',convert(nvarchar,duration_mins)) as slot_key,
			start_at, 
			duration_mins, 
			resource_id, 
			max_party_size, 
			dbo.process_slot_display_template(@display_template, resource_id, start_at, duration_mins, max_party_size, price_level) as display  
			from #viables 
			order by start_at
		drop table #viables

	end


end	
GO
/****** Object:  Trigger [dbo].[tg_schedule_cache]    Script Date: 15/03/2021 16:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[tg_schedule_cache] on [dbo].[schedule]
after insert, update, delete
as
begin
	update availability_cache set dirty=1 where resource_id in (select resource_id from inserted)
	update availability_cache set dirty=1 where resource_id in (select resource_id from deleted)
	exec cache_clean
end
GO
ALTER TABLE [dbo].[schedule] ENABLE TRIGGER [tg_schedule_cache]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the total number of slots according to the schedule' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'total_slots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the total number of tickets according to the schedule' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'total_tickets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the maximum party size that could be booked for this resource/date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'max_party_size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the total number of confirmed bookings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'booked_slots'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the total number of confirmed booking tickets' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'booked_tickets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'set to true when a booking is confirmed or a schedule is updated' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'availability_cache', @level2type=N'COLUMN',@level2name=N'dirty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL to create a new booking, relative to Dash. Used in ManageBookings.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'new_booking_process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL to update/cancel a booking, relative to Dash. Used in ManageBookings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'update_booking_process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CSV list of AD groups that can edit resources' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'resource_ad_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CSV list of AD groups that can edit schedules' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'schedule_ad_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CSV list of AD groups that can edit bookings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_ad_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CSV list of AD groups that can view bookings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'view_ad_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CSS for the ticket - can be used to position and style fields' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'ticket_css'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Field caption for booking text 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Field caption for booking text 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Field caption for booking text 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Field caption for booking text 4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_label_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Content for the booking process t+cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'booking_terms_html'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Content for the top of MyBookings page' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'mybooking_intro_html'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Content for the top of ManageBookings page' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'manager_intro_html'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Calendar appearance config for ManageBookings page' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'manager_fullcal_json'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Normally MI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'capita_fund_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Normally S or X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'capita_vat_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Text indended for use in part of a price level lookup' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'class', @level2type=N'COLUMN',@level2name=N'price_level_text'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Notes shown only on the admin screen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'admin_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shown on the MyBookings screen, can be used by the process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'customer_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can be used in emails by the process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'email_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of venue / description of location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can be used in emails by the process' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resource', @level2type=N'COLUMN',@level2name=N'directions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The first date on which the resource is available' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'first_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The last date on which the resource is available' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'last_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comma-separated list of weekday names' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'weekdays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the difference in mins between open_at and close_at must be >0 and must also be a whole multiple of duration_mins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'close_at'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'>=0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'min_notice_mins'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'> min_notice_mins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'max_notice_mins'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'>=1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'total_capacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1<= transaction_capacity >= total capacity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'transaction_capacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if true, a booking can span >1 contiguous slot' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'schedule', @level2type=N'COLUMN',@level2name=N'allow_duration_multiples'
GO
exec cache_clean
go
USE [master]
GO
ALTER DATABASE [CommonBookings] SET  READ_WRITE 
GO
