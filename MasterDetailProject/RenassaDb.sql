USE [master]
GO
/****** Object:  Database [RenassaDb]    Script Date: 8/28/2023 2:32:08 PM ******/
CREATE DATABASE [RenassaDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RenassaDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RenassaDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RenassaDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\RenassaDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RenassaDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RenassaDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RenassaDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RenassaDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RenassaDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RenassaDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RenassaDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RenassaDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RenassaDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RenassaDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RenassaDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RenassaDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RenassaDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RenassaDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RenassaDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RenassaDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RenassaDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RenassaDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RenassaDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RenassaDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RenassaDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RenassaDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RenassaDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RenassaDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RenassaDb] SET RECOVERY FULL 
GO
ALTER DATABASE [RenassaDb] SET  MULTI_USER 
GO
ALTER DATABASE [RenassaDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RenassaDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RenassaDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RenassaDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RenassaDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RenassaDb', N'ON'
GO
USE [RenassaDb]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/28/2023 2:32:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Order_Detail_No] [int] IDENTITY(1,1) NOT NULL,
	[Order_No] [int] NOT NULL,
	[Item_Name] [varchar](20) NOT NULL,
	[Notes] [varchar](200) NOT NULL,
	[QTY] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK__OrderDet__15811C9061A5587C] PRIMARY KEY CLUSTERED 
(
	[Order_Detail_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderMasters]    Script Date: 8/28/2023 2:32:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderMasters](
	[Order_No] [int] IDENTITY(1,1) NOT NULL,
	[Table_ID] [varchar](20) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Order_DATE] [datetime] NOT NULL,
	[Waiter_Name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/28/2023 2:32:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 8/28/2023 2:32:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[RoleId] [smallint] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)),
	[Password] [nvarchar](50) NOT NULL,
	[LastLoggedInDateTime] [datetime] NULL,
	[AllowedNoOfLogins] [smallint] NOT NULL CONSTRAINT [DF_User_AllowedNoOfLogins]  DEFAULT ((0)),
	[LoginCount] [smallint] NOT NULL CONSTRAINT [DF_User_LoginCount]  DEFAULT ((0)),
	[AllowedLoginHours] [smallint] NOT NULL CONSTRAINT [DF_User_AllowedLoginHours]  DEFAULT ((0)),
	[AllowedLoginMinutes] [smallint] NOT NULL CONSTRAINT [DF_User_AllowedLoginMinutes]  DEFAULT ((0)),
	[ActiveBranchId] [int] NOT NULL CONSTRAINT [DF_User_ActiveBranchId]  DEFAULT ((1)),
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (1, 1009, N'Oranges', N'Breakfast testt', 24, 15)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (2, 1009, N'Ice Cream', N'children demand', 10, 150)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (3, 1010, N'Rice', N'Rich Dish', 50, 100)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (4, 1010, N'Chicken Cari', N'Spicy Item', 2, 500)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (5, 1010, N'Sweets', N'Desert Items', 200, 1500)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (6, 1010, N'Gift Box', N'Every Person', 160, 300)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (7, 1011, N'bb', N'ggg', 1, 50)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (8, 1012, N'aaa', N'sd', 1, 100)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (9, 1012, N'bbb', N'ssa', 2, 50)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (10, 1013, N'aaa', N'sd', 1, 100)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (11, 1013, N'bbb', N'ssa', 2, 50)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (12, 1014, N'aaa', N'sd', 1, 100)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (13, 1014, N'bbb', N'ssa', 2, 50)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (14, 1015, N'aaa', N'sd', 1, 100)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (15, 1015, N'bbb', N'ssa', 2, 50)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (16, 1016, N'aaa', N'sd', 1, 100)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (17, 1016, N'bbb', N'ssa', 3, 50)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (18, 1016, N'ccc', N'test', 5, 25)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[OrderMasters] ON 

INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1009, N'Table-01', N'Test Description', CAST(N'2019-10-23 00:00:00.000' AS DateTime), N'Amran')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1010, N'Table-02', N'Lunch table', CAST(N'2020-08-20 00:00:00.000' AS DateTime), N'Mr. Jaman Khann')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1011, N'Table-05', N'Lunch Food serve', CAST(N'2023-08-28 00:00:00.000' AS DateTime), N'xxxx')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1012, N'Table-06', N'Lunch Food serve2', CAST(N'2023-08-28 00:00:00.000' AS DateTime), N'xxxxyy')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1013, N'Table-06', N'Lunch Food serve2', CAST(N'2023-08-28 00:00:00.000' AS DateTime), N'xxxxyy')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1014, N'Table-06', N'Lunch Food serve2', CAST(N'2023-08-28 00:00:00.000' AS DateTime), N'xxxxyy')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1015, N'Table-06', N'Lunch Food serve2', CAST(N'2023-08-28 00:00:00.000' AS DateTime), N'xxxxyy')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1016, N'Table-06', N'Lunch Food serve2', CAST(N'2023-08-28 00:00:00.000' AS DateTime), N'xxxxyy')
SET IDENTITY_INSERT [dbo].[OrderMasters] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Member')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Team Leader')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (1, N'admin@gmail.com', N'Admin', 1, 1, N'123456', NULL, 100, 0, 24, 0, 1)
INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (2, N'fahim@gmail.com', N'Fahim', 2, 1, N'123456', CAST(N'2017-12-03 09:20:28.140' AS DateTime), 100, 22, 24, 0, 1)
INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (3, N'mahato.bindeshwar@gmail.com', N'Bindeshwar Mahato', 3, 1, N'123456', CAST(N'2017-10-08 10:11:34.613' AS DateTime), 100, 2, 24, 0, 1)
INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (4, N'admin@yahoo.com', N'admin', 1, 1, N'admin', CAST(N'2019-04-02 00:00:00.000' AS DateTime), 100, 0, 24, 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderMasters] FOREIGN KEY([Order_No])
REFERENCES [dbo].[OrderMasters] ([Order_No])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderMasters]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [RenassaDb] SET  READ_WRITE 
GO
