USE [master]
GO
/****** Object:  Database [EmpDB]    Script Date: 27-09-2022 14:24:44 ******/
CREATE DATABASE [EmpDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmpDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmpDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmpDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmpDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmpDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmpDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmpDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmpDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmpDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmpDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmpDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmpDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmpDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmpDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmpDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmpDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmpDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmpDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmpDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmpDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmpDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmpDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmpDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmpDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmpDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmpDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmpDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmpDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmpDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmpDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmpDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmpDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmpDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmpDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmpDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmpDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EmpDB] SET QUERY_STORE = OFF
GO
USE [EmpDB]
GO
/****** Object:  Table [dbo].[EmpDetail]    Script Date: 27-09-2022 14:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Mob] [nvarchar](200) NOT NULL,
	[DOB] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[Salary] [decimal](10, 2) NULL,
	[DOJ] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmpDetail] ON 
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (1, N'Vishal', N'Kumar', N'kumar.vishal@thinksys.com', N'8294628952', CAST(N'2001-03-15' AS Date), 21, CAST(N'2022-09-23T17:12:24.970' AS DateTime), NULL, 1, 0, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2022-09-23' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (2, N'vikash', N'kumar', N'kumar.vikash@thinksys.com', N'6299686563', CAST(N'1999-09-15' AS Date), 23, CAST(N'2022-09-26T16:31:54.270' AS DateTime), NULL, 1, 1, CAST(39999.00 AS Decimal(10, 2)), CAST(N'2020-05-15' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (3, N'Manash', N'Kumar', N'asd@jwgd.com', N'8294628953', CAST(N'1994-05-15' AS Date), 28, CAST(N'2022-09-26T18:36:44.563' AS DateTime), CAST(N'2022-09-27T12:56:27.733' AS DateTime), 1, 0, CAST(87424.00 AS Decimal(10, 2)), CAST(N'2003-05-15' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (4, N'Golden', N'Singh', N'kumar.visha@thinksys.com', N'2323322323', CAST(N'1998-09-20' AS Date), 24, CAST(N'2022-09-27T13:02:04.510' AS DateTime), CAST(N'2022-09-27T13:17:42.820' AS DateTime), 0, 0, CAST(250000.00 AS Decimal(10, 2)), CAST(N'2021-05-23' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (5, N'Ram', N'Kumar', N'Ram@gmail.com', N'5656565656', CAST(N'1996-02-15' AS Date), 26, CAST(N'2022-09-27T14:14:04.230' AS DateTime), CAST(N'2022-09-27T14:18:25.497' AS DateTime), 1, 0, CAST(6566.00 AS Decimal(10, 2)), CAST(N'2020-08-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[EmpDetail] OFF
GO
ALTER TABLE [dbo].[EmpDetail] ADD  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[EmpDetail] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmpDetail] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_ADD]    Script Date: 27-09-2022 14:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_EmpDetail_ADD]
	@FirstName nvarchar(200),
	@LastName nvarchar(200),
	@Email nvarchar(200),
	@Mob nvarchar(200),
	@DOB Date,
	@Salary decimal(10,2),
	@DOJ Date	
As
Begin
	if not Exists(Select * from EmpDetail where (Mob=@Mob or Email=@Email) and IsDelete=0 )
	Begin
		Insert into EmpDetail(FirstName,LastName,Email,Mob,DOB,Age,DOJ,Salary)
		Values(@FirstName,@LastName,@Email,@Mob,@DOB,DATEDIFF(MM,@DOB, getdate())/12,@DOJ,@Salary)

	Select 'Employee detail added successfully.' as StatusMessage
	End
	Else
	Begin
		Select 'Mobile No. or Email Id already exist in the database!' as StatusMessage
	End
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_Delete]    Script Date: 27-09-2022 14:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_EmpDetail_Delete]
	@EmpID int	
As
Begin
	Update EmpDetail
		set IsDelete=1
		Where ID=@EmpID and IsDelete=0
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_Update]    Script Date: 27-09-2022 14:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EmpDetail_Update]
	@EmpID int,
	@FirstName nvarchar(200),
	@LastName nvarchar(200),
	@Email nvarchar(200),
	@Mob nvarchar(200),
	@DOB Date,
	@Salary decimal(10,2),
	@DOJ Date,
	@IsActive bit
As
Begin
	if not Exists(Select * from EmpDetail where ID<>@EmpID and IsDelete=0 and  (Mob=@Mob or Email=@Email) )
	Begin
	Update EmpDetail
		set FirstName=@FirstName,
			LastName=@LastName,
			Email=@Email,
			Mob=@Mob,
			DOB=@DOB,
			Age=DATEDIFF(MM,@DOB, getdate())/12,
			Salary =@Salary,
			DOJ=@DOJ,
			UpdatedOn=GETDATE(),
			IsActive=@IsActive
		Where ID=@EmpID and IsDelete=0

		Select 'Employee detail updated successfully.' as StatusMessage
	End
	Else
	Begin
		Select 'Mobile No. or Email Id already exist in the database!' as StatusMessage
	End
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_View]    Script Date: 27-09-2022 14:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_EmpDetail_View]
@EmpID int=null
As
Begin
	if(ISNULL(@EmpID,0)=0)
	Begin
		Select ID,FirstName,LastName,Email,Mob,DOB,Age,DOJ,Salary,IsActive from EmpDetail where IsDelete=0
	End
	else
	Begin
		Select ID,FirstName,LastName,Email,Mob,DOB,Age,DOJ,Salary,IsActive from EmpDetail where IsDelete=0 and ID=@EmpID
	End
End
GO
USE [master]
GO
ALTER DATABASE [EmpDB] SET  READ_WRITE 
GO
