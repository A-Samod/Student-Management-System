USE [master]
GO
/****** Object:  Database [sigma_hec]    Script Date: 6/19/2021 4:18:11 PM ******/
CREATE DATABASE [sigma_hec]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sigma_hec', FILENAME = N'D:\ProGRm+\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sigma_hec.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sigma_hec_log', FILENAME = N'D:\ProGRm+\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sigma_hec_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sigma_hec] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sigma_hec].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sigma_hec] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sigma_hec] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sigma_hec] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sigma_hec] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sigma_hec] SET ARITHABORT OFF 
GO
ALTER DATABASE [sigma_hec] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sigma_hec] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sigma_hec] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sigma_hec] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sigma_hec] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sigma_hec] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sigma_hec] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sigma_hec] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sigma_hec] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sigma_hec] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sigma_hec] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sigma_hec] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sigma_hec] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sigma_hec] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sigma_hec] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sigma_hec] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sigma_hec] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sigma_hec] SET RECOVERY FULL 
GO
ALTER DATABASE [sigma_hec] SET  MULTI_USER 
GO
ALTER DATABASE [sigma_hec] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sigma_hec] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sigma_hec] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sigma_hec] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sigma_hec] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sigma_hec] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sigma_hec', N'ON'
GO
ALTER DATABASE [sigma_hec] SET QUERY_STORE = OFF
GO
USE [sigma_hec]
GO
/****** Object:  Table [dbo].[student_details]    Script Date: 6/19/2021 4:18:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_details](
	[stid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[nic] [int] NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[contact_no] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[al_stream] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_STUDENT]    Script Date: 6/19/2021 4:18:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_STUDENT](@stid as int)
AS
BEGIN
DELETE FROM dbo.student_details WHERE dbo.student_details.stid = @stid
END
GO
/****** Object:  StoredProcedure [dbo].[DISPLAY_Sdetails]    Script Date: 6/19/2021 4:18:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DISPLAY_Sdetails]
AS
BEGIN
  Select * from dbo.student_details;
END
GO
/****** Object:  StoredProcedure [dbo].[INSERT_STUDENT]    Script Date: 6/19/2021 4:18:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_STUDENT](@stid as int,@name as varchar(50),@nic as int,@gender as varchar(50),@contact_no as int,@email as varchar(50),@al_stream as varchar(50))
AS
BEGIN

INSERT INTO student_details VALUES (@stid,@name,@nic,@gender,@contact_no,@email,@al_stream)

END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_STUDENT]    Script Date: 6/19/2021 4:18:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_STUDENT](@stid as int,@name as varchar(50),@nic as int,@gender as varchar(50),@contact_no as int,@email as varchar(50),@al_stream as varchar(50))
AS
BEGIN
UPDATE dbo.student_details SET dbo.student_details.name = @name,dbo.student_details.nic = @nic,dbo.student_details.gender = @gender,dbo.student_details.contact_no = @contact_no,dbo.student_details.email = @email,dbo.student_details.al_stream = @al_stream
WHERE dbo.student_details.stid = @stid
END
GO
USE [master]
GO
ALTER DATABASE [sigma_hec] SET  READ_WRITE 
GO
