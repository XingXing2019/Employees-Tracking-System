USE [master]
GO
/****** Object:  Database [EmployeeWorkingHours]    Script Date: 15/11/2019 8:38:06 PM ******/
CREATE DATABASE [EmployeeWorkingHours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeWorkingHours', FILENAME = N'C:\Users\xxing\EmployeeWorkingHours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeWorkingHours_log', FILENAME = N'C:\Users\xxing\EmployeeWorkingHours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EmployeeWorkingHours] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeWorkingHours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeWorkingHours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeWorkingHours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeWorkingHours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeWorkingHours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeWorkingHours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeWorkingHours] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeWorkingHours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeWorkingHours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeWorkingHours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeWorkingHours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeWorkingHours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeWorkingHours] SET QUERY_STORE = OFF
GO
USE [EmployeeWorkingHours]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [EmployeeWorkingHours]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpWorkHours]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpWorkHours](
	[EmpHoursID] [int] IDENTITY(101,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[WorkDate] [date] NOT NULL,
	[Hours] [float] NOT NULL,
 CONSTRAINT [PK_EmpWorkHours] PRIMARY KEY CLUSTERED 
(
	[EmpHoursID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (1, N'Timothy', N'Xing', N'x.xing@unsw.edu.au', CAST(N'1986-02-20' AS Date), N'0425143935')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (2, N'John', N'Sharp', N'j.sharp@unsw.edu.au', CAST(N'1948-10-20' AS Date), N'0423596541')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (3, N'Peggy', N'Zhang', N'p.zhang@unsw.edu.au', CAST(N'1984-04-25' AS Date), N'0425368551')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (4, N'Oleg', N'Ostrovski', N'o.ostrovski@unsw.edu.au', CAST(N'1948-02-15' AS Date), N'0425368562')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (5, N'Danny', N'Kim', N'd.kim@unsw.edu.au', CAST(N'1965-04-12' AS Date), N'0413652145')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (6, N'Jane', N'Gao', N'j.gao@unsw.edu.au', CAST(N'1970-04-16' AS Date), N'0423652144')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (7, N'Guangqing', N'Zhang', N'g.zhang@unsw.edu.au', CAST(N'1959-08-05' AS Date), N'0425896745')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (8, N'Tom', N'Wu', N't.wu@unsw.edu.au', CAST(N'1965-04-23' AS Date), N'0452357689')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (9, N'Lucy', N'Zhang', N'l.zhang@unsw.edu.au', CAST(N'1975-09-21' AS Date), N'0485124596')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (10, N'Kevin', N'Law', N'k.law@unsw.edu.au', CAST(N'1980-09-30' AS Date), N'0412745635')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (11, N'David', N'Young', N'd.young@unsw.edu.au', CAST(N'1948-09-14' AS Date), N'0436584255')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (12, N'Anne', N'Rich', N'a.rich@unsw.edu.au', CAST(N'1975-03-15' AS Date), N'0412574555')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (13, N'John', N'Smith', N'j.smith@unsw.edu.au', CAST(N'1980-01-15' AS Date), N'0458974525')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (14, N'George', N'Yang', N'g.yang@unsw.edu.au', CAST(N'1975-05-28' AS Date), N'0415239685')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (15, N'Dewei', N'Chu', N'd.chu@unsw.edu.au', CAST(N'1981-05-14' AS Date), N'0423157458')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (16, N'Danyang', N'Wang', N'd.wang@unsw.edu.au', CAST(N'1975-04-26' AS Date), N'0417356965')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (17, N'Anthony', N'Zhang', N'a.zhang@unsw.edu.au', CAST(N'1980-06-18' AS Date), N'0425368452')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (18, N'Jianqiang', N'Zhang', N'j.zhang@unsw.edu.au', CAST(N'1960-12-08' AS Date), N'0436851245')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (20, N'Pramod ', N'Koshy', N'p.koshy@unsw.edu.au', CAST(N'1975-03-15' AS Date), N'0436585745')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (21, N'Rahmat', N'Kartono', N'r.kartono@unsw.edu.au', CAST(N'1980-12-11' AS Date), N'0425145638')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (22, N'Bill', N'Joe', N'b.joe@unsw.edu.au', CAST(N'1975-12-11' AS Date), N'0425745632')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (23, N'Yu', N'Wang', N'y.wang@unsw.edu.au', CAST(N'1964-08-14' AS Date), N'0432568545')
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [Email], [DOB], [Phone]) VALUES (24, N'Ruoming', N'Tian', N'r.tian@unsw.edu.au', CAST(N'1985-07-11' AS Date), N'0423514524')
SET IDENTITY_INSERT [dbo].[EmpWorkHours] ON 

INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (101, 1, CAST(N'2019-10-30' AS Date), 7)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (102, 8, CAST(N'2019-10-21' AS Date), 6)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (104, 4, CAST(N'2019-10-29' AS Date), 3)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (105, 14, CAST(N'2019-10-29' AS Date), 7)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (106, 10, CAST(N'2019-10-29' AS Date), 7)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (107, 11, CAST(N'2019-10-28' AS Date), 4)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (1102, 4, CAST(N'2019-10-29' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (2102, 9, CAST(N'2019-10-30' AS Date), 7)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (2103, 5, CAST(N'2019-10-29' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (4103, 2, CAST(N'2019-11-28' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (5102, 3, CAST(N'2019-11-21' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (6102, 21, CAST(N'2019-11-15' AS Date), 7)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (7102, 2, CAST(N'2019-11-22' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (7103, 11, CAST(N'2019-11-20' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (8102, 2, CAST(N'2019-10-23' AS Date), 2.5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (8103, 1, CAST(N'2019-11-04' AS Date), 7.5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (8104, 2, CAST(N'2019-10-30' AS Date), 2.5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (9103, 5, CAST(N'2019-10-30' AS Date), 2.5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (10103, 2, CAST(N'2019-11-08' AS Date), 0)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (11103, 2, CAST(N'2019-11-08' AS Date), 0.5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (12103, 2, CAST(N'2019-11-07' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (12104, 1, CAST(N'2019-11-08' AS Date), 2)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (12105, 1, CAST(N'2019-10-18' AS Date), 5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (13103, 5, CAST(N'2019-11-12' AS Date), 2.5)
INSERT [dbo].[EmpWorkHours] ([EmpHoursID], [EmpID], [WorkDate], [Hours]) VALUES (14104, 21, CAST(N'2019-11-08' AS Date), 4.5)
SET IDENTITY_INSERT [dbo].[EmpWorkHours] OFF
ALTER TABLE [dbo].[EmpWorkHours]  WITH CHECK ADD  CONSTRAINT [FK_EmpWorkHours_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
ALTER TABLE [dbo].[EmpWorkHours] CHECK CONSTRAINT [FK_EmpWorkHours_Employees]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmp]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_InsertEmp]
	@empID int,
	@firstName varchar(50),
	@lastName varchar(50),
	@email varchar(50),
	@dob date,
	@phone varchar(50)
As
Begin
	Insert Into Employees(EmpID, FirstName, LastName, Email, DOB, Phone)
	Values(@empID, @firstName, @lastName, @email, @dob, @phone)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmpHours]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertEmpHours]
	@empHoursID int,
	@empID int,
	@workDate date,
	@hours int
As
Begin
	insert Into EmpWorkHours(EmpHoursID, EmpID, WorkDate, Hours)
	Values(@empHoursID, @empID, @workDate, @hours)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectAllEmp]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_SelectAllEmp]

As
Begin
	Select * from Employees
End
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectEmpByEmail]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_SelectEmpByEmail]
	@email varchar(50)

As
Begin
	Select * from Employees
	Where Email = @email
End
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectEmpByID]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_SelectEmpByID]
	@empID int

As
Begin
	Select * from Employees
	Where EmpID = @empID
End
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectWorkDateHourByID]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_SelectWorkDateHourByID]
	@empID int

As
Begin
	Select WorkDate, Hours from EmpHours  
	Where EmpID = @empID
End
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmp]    Script Date: 15/11/2019 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_UpdateEmp]
	@empID int,
	@firstName varchar(50),
	@lastName varchar(50),
	@emial varchar(50),
	@dob date,
	@phone varchar(50)
As
Begin
	Update Employees
	set FirstName = @firstName,
	LastName = @lastName,
	Email = @emial,
	DOB = @dob,
	Phone = @phone
	Where EmpID = @empID
End
GO
USE [master]
GO
ALTER DATABASE [EmployeeWorkingHours] SET  READ_WRITE 
GO
