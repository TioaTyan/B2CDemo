USE [master]
GO
/****** Object:  Database [B2C_Demo]    Script Date: 2019/5/30 9:14:46 ******/
CREATE DATABASE [B2C_Demo] ON  PRIMARY 
( NAME = N'B2C_Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\B2C_Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'B2C_Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\B2C_Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [B2C_Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [B2C_Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [B2C_Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [B2C_Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [B2C_Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [B2C_Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [B2C_Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [B2C_Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [B2C_Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [B2C_Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [B2C_Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [B2C_Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [B2C_Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [B2C_Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [B2C_Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [B2C_Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [B2C_Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [B2C_Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [B2C_Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [B2C_Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [B2C_Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [B2C_Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [B2C_Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [B2C_Demo] SET RECOVERY FULL 
GO
ALTER DATABASE [B2C_Demo] SET  MULTI_USER 
GO
ALTER DATABASE [B2C_Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [B2C_Demo] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'B2C_Demo', N'ON'
GO
USE [B2C_Demo]
GO
/****** Object:  User [debug]    Script Date: 2019/5/30 9:14:46 ******/
CREATE USER [debug] FOR LOGIN [debug] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'debug'
GO
/****** Object:  Table [dbo].[Cart_Goods]    Script Date: 2019/5/30 9:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Goods](
	[order_id] [varchar](50) NOT NULL,
	[order_bookid] [int] NOT NULL,
	[order_booknum] [int] NOT NULL,
	[uid] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Info]    Script Date: 2019/5/30 9:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Info](
	[order_id] [varchar](50) NOT NULL,
	[UID] [varchar](50) NOT NULL,
	[receiver_address] [varchar](50) NOT NULL,
	[receiver_name] [varchar](50) NOT NULL,
	[receiver_phone] [varchar](50) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[isSend] [bit] NOT NULL,
	[isPay] [bit] NOT NULL,
	[order_price] [float] NOT NULL,
 CONSTRAINT [PK_Cart_Info-order_id] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods_Class]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods_Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Goods_Class-ClassID] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods_Info]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods_Info](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[BookName] [varchar](50) NOT NULL,
	[BookIntroduce] [ntext] NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Company] [varchar](50) NOT NULL,
	[MarketPrice] [float] NOT NULL,
	[HotPrice] [float] NOT NULL,
	[Isrefinement] [bit] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsDiscount] [bit] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[picUrl] [varchar](100) NOT NULL,
	[lastOperateDate] [timestamp] NOT NULL,
 CONSTRAINT [PK_Goods_Info-BookID] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Account]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Account](
	[UID] [varchar](20) NOT NULL,
	[Password] [varchar](30) NOT NULL,
 CONSTRAINT [PK_User_Account-UID] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Address]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](20) NOT NULL,
	[RealName] [varchar](50) NULL,
	[PostCode] [char](10) NULL,
	[Address] [varchar](200) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[AddTime] [timestamp] NOT NULL,
 CONSTRAINT [PK_User_Address-id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Info]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Info](
	[UID] [varchar](20) NOT NULL,
	[NickName] [varchar](20) NULL,
	[Money] [decimal](18, 2) NOT NULL,
	[UserType] [int] NOT NULL,
	[userImgUrl] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User_Info-UID] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608002153181867ncwu', 1, 1, N'ncwu')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608012925283907ncwu', 5, 1, N'ncwu')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608016294888680admin', 1, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608029430002989ncwu', 1, 1, N'ncwu')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608031313676771ncwu', 1, 1, N'ncwu')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608032463306647ncwu', 1, 1, N'ncwu')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608061564159638admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608063236625174admin', 1019, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608066054035593admin', 5, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608082018303883ncwu', 1, 1, N'ncwu')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131611496085363164admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131611649227993650admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131611725123469336admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131998890967070060admin', 8, 3, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131999871353887598admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131999872964512231admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131999873852512208admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132000261357358925admin', 8, 3, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132000261860929463admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132000267308272925admin', 8, 99, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132000271166578091418reg', 8, 6, N'reg')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132000271696485569418reg', 8, 1, N'reg')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132025262166849524admin', 53, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010084979832322admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010086851802563admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010171642901483admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010171642901483admin', 14, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010210153326367user1', 8, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010223570455012user1', 34, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010223570455012user1', 32, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132028047886698353admin', 53, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010223570455012user1', 8, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 34, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 33, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 23, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 14, 1, N'admin')
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608002153181867ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T09:50:15.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608012925283907ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:08:12.000' AS DateTime), 0, 0, 3)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608016294888680admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:13:49.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608029430002989ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:35:43.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608031313676771ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:38:51.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608032463306647ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:40:46.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608061564159638admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T11:29:16.000' AS DateTime), 0, 0, 55)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608063236625174admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T11:32:03.000' AS DateTime), 0, 0, 9)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608066054035593admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T11:36:45.000' AS DateTime), 0, 1, 3)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608082018303883ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T12:03:21.000' AS DateTime), 0, 1, 233.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131611496085363164admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-23T10:53:28.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131611649227993650admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-23T15:08:42.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131611725123469336admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-23T17:15:12.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131998890967070060admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-16T19:51:36.000' AS DateTime), 0, 1, 89.97)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131999871353887598admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-17T23:05:35.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131999872964512231admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-17T23:08:16.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131999873852512208admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-17T23:09:45.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000261357358925admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T09:55:35.000' AS DateTime), 0, 1, 89.97)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000261860929463admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T09:56:26.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000267308272925admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T10:05:30.000' AS DateTime), 0, 1, 2969.01)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000271166578091418reg', N'418reg', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T10:11:56.000' AS DateTime), 0, 1, 179.94)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000271696485569418reg', N'418reg', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T10:12:49.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010084979832322admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-29T18:48:17.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010086851802563admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-29T18:51:25.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010171642901483admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-29T21:12:44.000' AS DateTime), 0, 1, 31.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010210153326367user1', N'user1', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-29T22:16:55.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010223570455012user1', N'user1', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-29T22:39:17.000' AS DateTime), 0, 1, 33.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010930416599341admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-30T18:17:21.000' AS DateTime), 0, 1, 37.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132025262166849524admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-05-17T08:23:36.000' AS DateTime), 0, 1, 2)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132028047886698353admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-05-20T13:46:28.000' AS DateTime), 0, 1, 2)
SET IDENTITY_INSERT [dbo].[Goods_Class] ON 

INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1, N'小说1')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (2, N'文艺')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (3, N'生活')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (4, N'励志')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (5, N'测试')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1002, N'测试1')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1003, N'测试2')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1004, N'测试3')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1005, N'测试4')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1006, N'测试5')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1007, N'测试6')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1008, N'测试7')
INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1009, N'测试8')
SET IDENTITY_INSERT [dbo].[Goods_Class] OFF
SET IDENTITY_INSERT [dbo].[Goods_Info] ON 

INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (8, 1, N'人间失格', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 1, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (9, 1, N'人海生海', N'111111111', N'麦家', N'测试', 22, 22, 0, 1, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (10, 1, N'测试2', N'asdfa', N'asdf', N'adf', 2, 23.33, 0, 1, 1, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (14, 1, N'测试3', N'afd', N'afa', N'adf', 22, 50, 1, 0, 0, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (19, 1, N'测试4', N'asdf', N'asd', N'adf', 2, 30, 0, 1, 0, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (20, 1, N'测试5', N'adsf', N'adfasf', N'dasdf', 1, 10, 0, 0, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (23, 1, N'测试6', N'asdf', N'asdf', N'asdf', 2, 25, 1, 0, 0, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/07.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (24, 1, N'测试6', N'asdf', N'asdf', N'asdf', 2, 13, 0, 1, 0, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/08.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (30, 2, N'人间失格2', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 0, 1, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (31, 2, N'测试11', N'111111111', N'测试', N'测试', 22, 22, 0, 0, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (32, 2, N'测试22', N'asdfa', N'asdf', N'adf', 2, 12.3, 0, 0, 0, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (33, 2, N'测试33', N'afd', N'afa', N'adf', 22, 15.8, 1, 1, 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (34, 2, N'测试44', N'asdf', N'asd', N'adf', 2, 63, 1, 1, 1, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (35, 2, N'测试54', N'adsf', N'adfasf', N'dasdf', 1, 13, 1, 1, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (36, 2, N'测试62', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (37, 1, N'测试61', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (38, 3, N'人间失格3', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (39, 3, N'asdf', N'111111111', N'测试', N'测试', 22, 22, 0, 0, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (40, 3, N'asd', N'asdfa', N'asdf', N'adf', 2, 2, 0, 0, 0, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (41, 3, N'adf', N'afd', N'afa', N'adf', 22, 2, 1, 1, 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (42, 3, N'af', N'asdf', N'asd', N'adf', 2, 2, 1, 1, 1, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (43, 3, N'adfa', N'adsf', N'adfasf', N'dasdf', 1, 1, 1, 1, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (44, 3, N'af', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (45, 3, N'afd', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (46, 4, N'人间失格4', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (47, 4, N'测试1', N'111111111', N'测试', N'测试', 22, 22, 0, 0, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (48, 4, N'adfaf', N'asdfa', N'asdf', N'adf', 2, 2, 0, 0, 0, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (49, 4, N'a', N'afd', N'afa', N'adf', 22, 2, 1, 1, 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (50, 4, N'd', N'asdf', N'asd', N'adf', 2, 2, 1, 1, 1, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (51, 4, N'd', N'adsf', N'adfasf', N'dasdf', 1, 1, 1, 1, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (52, 4, N'a', N'new', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (53, 4, N'测试6', N'new', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (54, 5, N'adf', N'new', N'太宰治', N'作家出版社', 3, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (55, 5, N'adf', N'ad', N'adf', N'作家出版社', 23, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (56, 5, N'adf', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 1, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (57, 5, N'dafg', N'ads', N'太宰治', N'a', 29.99, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (58, 5, N'adf', N'asdf', N'asdf', N'作家出版社', 123, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (59, 5, N'bfda', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'dfadf', 412, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (61, 5, N'at', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 123123, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (62, 1, N'hello', N'233333', N't', N'u', 666, 666, 0, 0, 0, CAST(N'2019-04-29T15:02:37.000' AS DateTime), N'/Goods/img/06.jpg')
SET IDENTITY_INSERT [dbo].[Goods_Info] OFF
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'222', N'222')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'418reg', N'4188')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'admin', N'admin')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'admin111', N'111')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'haue', N'haue')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'ncwu', N'ncwu')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'test1853', N'1234')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'tioa', N'tioa')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'user1', N'user1')
SET IDENTITY_INSERT [dbo].[User_Address] ON 

INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (1, N'admin', N'test', N'473000    ', N'河南工程学院', N'13298325555')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (2, N'user1', N'user1', N'000000    ', N'test1', N'101')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (3, N'tioa', N'tioa', N'000000    ', N'test2', N'102')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (4, N'test1853', N'test1853', N'111111    ', N'111', N'1111')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (5, N'ncwu', N'史雷', N'463400    ', N'河南省华北水利水电大学', N'039610010')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (6, N'haue', NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (7, N'admin111', NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (8, N'222', NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (9, N'418reg', N'实姓', N'463411    ', N'454', N'10086')
SET IDENTITY_INSERT [dbo].[User_Address] OFF
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'222', N'222', CAST(1000.00 AS Decimal(18, 2)), 1, N'/User/ImagesUpload/DefaultImage.png')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'418reg', N'admintest', CAST(790.07 AS Decimal(18, 2)), 1, N'/User/ImagesUpload/DefaultImage.png')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'admin', N'Hello', CAST(1665311.00 AS Decimal(18, 2)), 2, N'/User/ImagesUpload/admin/132024849333772970.jpg')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'admin111', N'admin111', CAST(1000.00 AS Decimal(18, 2)), 1, N'/User/ImagesUpload/DefaultImage.png')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'haue', N'haue', CAST(1000.00 AS Decimal(18, 2)), 1, N'/User/ImagesUpload/DefaultImage.png')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'ncwu', N'测试用户', CAST(16432.67 AS Decimal(18, 2)), 2, N'/User/ImagesUpload/DefaultImage.png')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'Tioa', N'tioa_test', CAST(1000.11 AS Decimal(18, 2)), 1, N'/User/ImagesUpload/DefaultImage.png')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'user1', N'user1_test', CAST(942.02 AS Decimal(18, 2)), 1, N'/User/ImagesUpload/DefaultImage.png')
ALTER TABLE [dbo].[Goods_Info] ADD  CONSTRAINT [DF_Goods_Info_Isrefinement]  DEFAULT ((0)) FOR [Isrefinement]
GO
ALTER TABLE [dbo].[Goods_Info] ADD  CONSTRAINT [DF_Goods_Info_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
ALTER TABLE [dbo].[Goods_Info] ADD  CONSTRAINT [DF_Goods_Info_IsDiscount]  DEFAULT ((0)) FOR [IsDiscount]
GO
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_NickName]  DEFAULT ('请设置您的昵称！') FOR [NickName]
GO
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_Money]  DEFAULT ((1000.00)) FOR [Money]
GO
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_UserType]  DEFAULT ((1)) FOR [UserType]
GO
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_userImgUrl]  DEFAULT ('/User/ImagesUpload/DefaultImage.png') FOR [userImgUrl]
GO
ALTER TABLE [dbo].[Cart_Goods]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Goods-order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[Cart_Info] ([order_id])
GO
ALTER TABLE [dbo].[Cart_Goods] CHECK CONSTRAINT [FK_Cart_Goods-order_id]
GO
ALTER TABLE [dbo].[Goods_Info]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Info-ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Goods_Class] ([ClassID])
GO
ALTER TABLE [dbo].[Goods_Info] CHECK CONSTRAINT [FK_Goods_Info-ClassID]
GO
ALTER TABLE [dbo].[User_Address]  WITH CHECK ADD  CONSTRAINT [FK_User_Address-UID] FOREIGN KEY([UID])
REFERENCES [dbo].[User_Account] ([UID])
GO
ALTER TABLE [dbo].[User_Address] CHECK CONSTRAINT [FK_User_Address-UID]
GO
ALTER TABLE [dbo].[User_Info]  WITH CHECK ADD  CONSTRAINT [FK_User_Info-UID] FOREIGN KEY([UID])
REFERENCES [dbo].[User_Account] ([UID])
GO
ALTER TABLE [dbo].[User_Info] CHECK CONSTRAINT [FK_User_Info-UID]
GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
需要的参数
@uid：uid
*/
CREATE PROCEDURE [dbo].[UserDelete](
@uid VARCHAR(20),
@FLAG int output
)

AS
/*
0:删除成功
-1：找不到ID
*/
IF EXISTS(SELECT * FROM User_Account WHERE UID=@uid)
BEGIN
delete from User_Address where uid=@uid;
delete from User_Info where uid=@uid;
delete from User_Account where uid=@uid;
set @FLAG=0
END
else
	begin
		set @FLAG=-1
	end
GO
/****** Object:  StoredProcedure [dbo].[UserPay]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserPay](
/*
需要的参数
@price：价格
@uid：uid
@orderid：订单id
*/
@price decimal(18,2),
@uid varchar(20),
@orderid varchar(50),
@FLAG int output
)
as
/*
0:支付成功
-1：余额不足
-2：找不到订单
*/
if exists(select * from Cart_Info where order_id=@orderid)
	begin
		if(@price <(select Money from User_Info where UID=@uid))
			begin
				update User_Info set Money=Money-@price where UID=@uid;
				update Cart_Info set isPay='1' where order_id=@orderid
				set @FLAG=0
			end
		else
			begin
			set @FLAG=-1
			end
	end
	else
	begin
		set @FLAG=-2
	end

GO
/****** Object:  StoredProcedure [dbo].[UserRegister]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserRegister](
/*
需要的参数
@uid：uid
@pwd：pwd
@NickName:uid
@UserType:用户级别
*/
@uid VARCHAR(20),
@pwd VARCHAR(30),
@NickName VARCHAR(20),
@UserType int,
@FLAG int output)  
AS
/* 
0:注册成功 
-1：ID已存在
*/
IF not EXISTS(SELECT * FROM User_Account WHERE UID=@uid)
BEGIN
insert into User_Account (UID,Password) values(@uid,@pwd);
insert into User_Info(UID,NickName,UserType) values(@uid,@NickName,@UserType);
insert into User_Address(UID) values(@uid);
set @FLAG=0
END

ELSE
BEGIN
set @FLAG=-1
END
GO
/****** Object:  StoredProcedure [dbo].[UserSetNewPwd]    Script Date: 2019/5/30 9:14:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSetNewPwd](
/*
需要的参数
@uid：uid
@oldpwd：pwd
@newpwd：pwd
*/
@uid VARCHAR(20),
@oldpwd VARCHAR(30),
@newpwd VARCHAR(30),
@FLAG int output)  
AS
/* 
0:修改成功
-1：原密码错误
*/
IF EXISTS(SELECT * FROM User_Account WHERE UID=@uid and Password=@oldpwd)
BEGIN
update User_Account set Password=@newpwd where UID=@uid
set @FLAG=0
END

ELSE
BEGIN
set @FLAG=-1
END
GO
USE [master]
GO
ALTER DATABASE [B2C_Demo] SET  READ_WRITE 
GO
