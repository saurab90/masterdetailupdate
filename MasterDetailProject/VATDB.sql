USE [master]
GO
/****** Object:  Database [VatDb]    Script Date: 06/16/2022 12:42:52 PM ******/
CREATE DATABASE [VatDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VatDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VatDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VatDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VatDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VatDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VatDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VatDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VatDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VatDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VatDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VatDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [VatDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VatDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VatDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VatDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VatDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VatDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VatDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VatDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VatDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VatDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VatDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VatDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VatDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VatDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VatDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VatDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VatDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VatDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VatDb] SET  MULTI_USER 
GO
ALTER DATABASE [VatDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VatDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VatDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VatDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VatDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VatDb] SET QUERY_STORE = OFF
GO
USE [VatDb]
GO
/****** Object:  Table [dbo].[AkjProduct]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AkjProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [varchar](250) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[Vat] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_AkjProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[OrderMasters]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[ProdPurchaseCustomer]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdPurchaseCustomer](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProdPurchaseCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdPurchaseOrder]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdPurchaseOrder](
	[OrderID] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Amount] [decimal](18, 0) NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProdPurchaseOrder_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/16/2022 12:42:52 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 06/16/2022 12:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[RoleId] [smallint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastLoggedInDateTime] [datetime] NULL,
	[AllowedNoOfLogins] [smallint] NOT NULL,
	[LoginCount] [smallint] NOT NULL,
	[AllowedLoginHours] [smallint] NOT NULL,
	[AllowedLoginMinutes] [smallint] NOT NULL,
	[ActiveBranchId] [int] NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AkjProduct] ON 

INSERT [dbo].[AkjProduct] ([Id], [ProductId], [ProductName], [Quantity], [UnitPrice], [Vat], [CreatedDate]) VALUES (1, 101, N'Speed 250 ml pet', 500, CAST(21.50 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(N'2019-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AkjProduct] ([Id], [ProductId], [ProductName], [Quantity], [UnitPrice], [Vat], [CreatedDate]) VALUES (2, 201, N'Mojo 250 ml Pet', 500, CAST(13.50 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(N'2019-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[AkjProduct] ([Id], [ProductId], [ProductName], [Quantity], [UnitPrice], [Vat], [CreatedDate]) VALUES (3, 301, N'Cheese Puff', 500, CAST(8.55 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(N'2019-02-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[AkjProduct] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Drinks')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Minaral Water')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Biscuites')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Chips')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (1, 1009, N'Oranges', N'Breakfast testt', 24, 15)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (2, 1009, N'Ice Cream', N'children demand', 10, 150)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (3, 1010, N'Rice', N'Rich Dish', 50, 100)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (4, 1010, N'Chicken Cari', N'Spicy Item', 2, 500)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (5, 1010, N'Sweets', N'Desert Items', 200, 1500)
INSERT [dbo].[OrderDetails] ([Order_Detail_No], [Order_No], [Item_Name], [Notes], [QTY], [Price]) VALUES (6, 1010, N'Gift Box', N'Every Person', 160, 300)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[OrderMasters] ON 

INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1009, N'Table-01', N'Test Description', CAST(N'2019-10-23T00:00:00.000' AS DateTime), N'Amran')
INSERT [dbo].[OrderMasters] ([Order_No], [Table_ID], [Description], [Order_DATE], [Waiter_Name]) VALUES (1010, N'Table-02', N'Lunch table', CAST(N'2020-08-20T00:00:00.000' AS DateTime), N'Mr. Jaman Khann')
SET IDENTITY_INSERT [dbo].[OrderMasters] OFF
INSERT [dbo].[ProdPurchaseCustomer] ([CustomerID], [Name], [Address], [OrderDate]) VALUES (N'641eeec4-9216-4dc4-a74d-6442f6dde2b7', N'AMRAN ALI SAURAB', N'Dhaka', CAST(N'2019-04-01T14:44:43.490' AS DateTime))
INSERT [dbo].[ProdPurchaseOrder] ([OrderID], [ProductName], [Quantity], [Price], [Amount], [CustomerID]) VALUES (N'08065368-5874-4612-9fdb-7646fc724416', N'cocacola', 25, CAST(18 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), N'641eeec4-9216-4dc4-a74d-6442f6dde2b7')
INSERT [dbo].[ProdPurchaseOrder] ([OrderID], [ProductName], [Quantity], [Price], [Amount], [CustomerID]) VALUES (N'94e0e7be-ada4-42ac-a582-b507f4c27ca6', N'7up', 14, CAST(30 AS Decimal(18, 0)), CAST(420 AS Decimal(18, 0)), N'641eeec4-9216-4dc4-a74d-6442f6dde2b7')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId]) VALUES (1, N'Speed 250ml', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId]) VALUES (2, N'Mojo', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId]) VALUES (3, N'Chees Puff', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId]) VALUES (4, N'Spa', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId]) VALUES (5, N'Choko Fun', 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Member')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Team Leader')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (1, N'admin@gmail.com', N'Admin', 1, 1, N'123456', NULL, 100, 0, 24, 0, 1)
INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (2, N'fahim@gmail.com', N'Fahim', 2, 1, N'123456', CAST(N'2017-12-03T09:20:28.140' AS DateTime), 100, 22, 24, 0, 1)
INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (3, N'mahato.bindeshwar@gmail.com', N'Bindeshwar Mahato', 3, 1, N'123456', CAST(N'2017-10-08T10:11:34.613' AS DateTime), 100, 2, 24, 0, 1)
INSERT [dbo].[User] ([Id], [Email], [Name], [RoleId], [IsActive], [Password], [LastLoggedInDateTime], [AllowedNoOfLogins], [LoginCount], [AllowedLoginHours], [AllowedLoginMinutes], [ActiveBranchId]) VALUES (4, N'admin@yahoo.com', N'admin', 1, 1, N'admin', CAST(N'2019-04-02T00:00:00.000' AS DateTime), 100, 0, 24, 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_AllowedNoOfLogins]  DEFAULT ((0)) FOR [AllowedNoOfLogins]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_LoginCount]  DEFAULT ((0)) FOR [LoginCount]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_AllowedLoginHours]  DEFAULT ((0)) FOR [AllowedLoginHours]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_AllowedLoginMinutes]  DEFAULT ((0)) FOR [AllowedLoginMinutes]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_ActiveBranchId]  DEFAULT ((1)) FOR [ActiveBranchId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderMasters] FOREIGN KEY([Order_No])
REFERENCES [dbo].[OrderMasters] ([Order_No])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderMasters]
GO
ALTER TABLE [dbo].[ProdPurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProdPurchaseOrder_ProdPurchaseCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[ProdPurchaseCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[ProdPurchaseOrder] CHECK CONSTRAINT [FK_ProdPurchaseOrder_ProdPurchaseCustomer]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [VatDb] SET  READ_WRITE 
GO
