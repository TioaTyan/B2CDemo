USE [master]
GO
/****** Object:  Database [B2C_Demo]    Script Date: 2019/4/29 18:05:22 ******/
CREATE DATABASE [B2C_Demo] ON  PRIMARY 
( NAME = N'B2C_Demo', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\B2C_Demo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'B2C_Demo_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\B2C_Demo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  User [debug]    Script Date: 2019/4/29 18:05:22 ******/
CREATE USER [debug] FOR LOGIN [debug] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'debug'
GO
/****** Object:  Table [dbo].[Cart_Goods]    Script Date: 2019/4/29 18:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Goods](
	[order_no] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [varchar](50) NOT NULL,
	[order_bookid] [int] NOT NULL,
	[order_booknum] [int] NOT NULL,
 CONSTRAINT [PK_Cart_Goods] PRIMARY KEY CLUSTERED 
(
	[order_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Info]    Script Date: 2019/4/29 18:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Info](
	[order_no] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [varchar](50) NOT NULL,
	[UID] [varchar](50) NOT NULL,
	[receiver_address] [varchar](50) NOT NULL,
	[receiver_name] [varchar](50) NOT NULL,
	[receiver_phone] [varchar](50) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[isSend] [bit] NOT NULL,
	[isPay] [bit] NOT NULL,
	[order_price] [float] NOT NULL,
 CONSTRAINT [PK_Cart_Info] PRIMARY KEY CLUSTERED 
(
	[order_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods_Class]    Script Date: 2019/4/29 18:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods_Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Goods_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods_Info]    Script Date: 2019/4/29 18:05:22 ******/
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
 CONSTRAINT [PK_Goods_Info] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Account]    Script Date: 2019/4/29 18:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](20) NOT NULL,
	[Password] [varchar](30) NOT NULL,
 CONSTRAINT [PK_User_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Address]    Script Date: 2019/4/29 18:05:22 ******/
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
 CONSTRAINT [PK_User_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Info]    Script Date: 2019/4/29 18:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](20) NOT NULL,
	[NickName] [varchar](20) NULL,
	[Money] [decimal](18, 2) NULL,
	[UserType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart_Goods] ON 

INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (7, N'131608002153181867ncwu', 1, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (8, N'131608012925283907ncwu', 5, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (9, N'131608016294888680admin', 1, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (10, N'131608029430002989ncwu', 1, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (11, N'131608031313676771ncwu', 1, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (12, N'131608032463306647ncwu', 1, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (13, N'131608061564159638admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (14, N'131608063236625174admin', 1019, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (15, N'131608066054035593admin', 5, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (16, N'131608082018303883ncwu', 1, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (17, N'131611496085363164admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (18, N'131611649227993650admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (19, N'131611725123469336admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1018, N'131998890967070060admin', 8, 3)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1019, N'131999871353887598admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1020, N'131999872964512231admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1021, N'131999873852512208admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1022, N'132000261357358925admin', 8, 3)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1023, N'132000261860929463admin', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1024, N'132000267308272925admin', 8, 99)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1025, N'132000271166578091418reg', 8, 6)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1026, N'132000271696485569418reg', 8, 1)
INSERT [dbo].[Cart_Goods] ([order_no], [order_id], [order_bookid], [order_booknum]) VALUES (1027, N'132009946381769320admin', 42, 2)
SET IDENTITY_INSERT [dbo].[Cart_Goods] OFF
SET IDENTITY_INSERT [dbo].[Cart_Info] ON 

INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (3, N'131608002153181867ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T09:50:15.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (4, N'131608012925283907ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:08:12.000' AS DateTime), 0, 0, 3)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (5, N'131608016294888680admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:13:49.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (6, N'131608029430002989ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:35:43.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (7, N'131608031313676771ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:38:51.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (8, N'131608032463306647ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T10:40:46.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (9, N'131608061564159638admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T11:29:16.000' AS DateTime), 0, 0, 55)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (10, N'131608063236625174admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T11:32:03.000' AS DateTime), 0, 0, 9)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (11, N'131608066054035593admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T11:36:45.000' AS DateTime), 0, 1, 3)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (12, N'131608082018303883ncwu', N'ncwu', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-19T12:03:21.000' AS DateTime), 0, 1, 233.33)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (13, N'131611496085363164admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-23T10:53:28.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (14, N'131611649227993650admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-23T15:08:42.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (15, N'131611725123469336admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2018-01-23T17:15:12.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1015, N'131998890967070060admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-16T19:51:36.000' AS DateTime), 0, 1, 89.97)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1016, N'131999871353887598admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-17T23:05:35.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1017, N'131999872964512231admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-17T23:08:16.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1018, N'131999873852512208admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-17T23:09:45.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1019, N'132000261357358925admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T09:55:35.000' AS DateTime), 0, 1, 89.97)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1020, N'132000261860929463admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T09:56:26.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1021, N'132000267308272925admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T10:05:30.000' AS DateTime), 0, 1, 2969.01)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1022, N'132000271166578091418reg', N'418reg', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T10:11:56.000' AS DateTime), 0, 1, 179.94)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1023, N'132000271696485569418reg', N'418reg', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-18T10:12:49.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_no], [order_id], [UID], [receiver_address], [receiver_name], [receiver_phone], [order_date], [isSend], [isPay], [order_price]) VALUES (1024, N'132009946381769320admin', N'admin', N'功能未实现', N'功能未实现', N'功能未实现', CAST(N'2019-04-29T14:57:18.000' AS DateTime), 0, 1, 4)
SET IDENTITY_INSERT [dbo].[Cart_Info] OFF
SET IDENTITY_INSERT [dbo].[Goods_Class] ON 

INSERT [dbo].[Goods_Class] ([ClassID], [ClassName]) VALUES (1, N'小说')
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

INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (8, 1, N'人间失格', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 1, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (9, 1, N'测试1', N'111111111', N'测试', N'测试', 22, 22, 0, 1, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (10, 1, N'测试2', N'asdfa', N'asdf', N'adf', 2, 2, 0, 0, 1, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (14, 1, N'测试3', N'afd', N'afa', N'adf', 22, 2, 1, 0, 0, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (19, 1, N'测试4', N'asdf', N'asd', N'adf', 2, 2, 0, 1, 0, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (20, 1, N'测试5', N'adsf', N'adfasf', N'dasdf', 1, 1, 0, 0, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (23, 1, N'测试6', N'asdf', N'asdf', N'asdf', 2, 2, 1, 0, 0, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (24, 1, N'测试6', N'asdf', N'asdf', N'asdf', 2, 2, 0, 1, 0, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (30, 2, N'人间失格2', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (31, 2, N'测试11', N'111111111', N'测试', N'测试', 22, 22, 0, 0, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (32, 2, N'测试22', N'asdfa', N'asdf', N'adf', 2, 2, 0, 0, 0, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (33, 2, N'测试33', N'afd', N'afa', N'adf', 22, 2, 1, 1, 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (34, 2, N'测试44', N'asdf', N'asd', N'adf', 2, 2, 1, 1, 1, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (35, 2, N'测试54', N'adsf', N'adfasf', N'dasdf', 1, 1, 1, 1, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (36, 2, N'测试62', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (37, 1, N'测试61', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (38, 3, N'人间失格3', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (39, 3, N'asdf', N'111111111', N'测试', N'测试', 22, 22, 0, 0, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (40, 3, N'asd', N'asdfa', N'asdf', N'adf', 2, 2, 0, 0, 0, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (41, 3, N'adf', N'afd', N'afa', N'adf', 22, 2, 1, 1, 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (42, 3, N'af', N'asdf', N'asd', N'adf', 2, 2, 1, 1, 1, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (43, 3, N'adfa', N'adsf', N'adfasf', N'dasdf', 1, 1, 1, 1, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (44, 3, N'af', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (45, 3, N'afd', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (46, 4, N'人间失格4', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 29.99, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (47, 4, N'测试1', N'111111111', N'测试', N'测试', 22, 22, 0, 0, 0, CAST(N'2019-04-17T19:39:04.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (48, 4, N'adfaf', N'asdfa', N'asdf', N'adf', 2, 2, 0, 0, 0, CAST(N'2019-04-17T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (49, 4, N'a', N'afd', N'afa', N'adf', 22, 2, 1, 1, 1, CAST(N'2019-04-18T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (50, 4, N'd', N'asdf', N'asd', N'adf', 2, 2, 1, 1, 1, CAST(N'2018-02-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (51, 4, N'd', N'adsf', N'adfasf', N'dasdf', 1, 1, 1, 1, 1, CAST(N'2058-06-05T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (52, 4, N'a', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (53, 4, N'测试6', N'asdf', N'asdf', N'asdf', 2, 2, 1, 1, 1, CAST(N'2055-01-01T00:00:00.000' AS DateTime), N'/Goods/img/131999747449660376.png')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (54, 5, N'adf', N'ad', N'太宰治', N'作家出版社', 3, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (55, 5, N'adf', N'ad', N'adf', N'作家出版社', 23, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (56, 5, N'adf', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 1, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (57, 5, N'dafg', N'ads', N'太宰治', N'a', 29.99, 29.99, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (58, 5, N'adf', N'asdf', N'asdf', N'作家出版社', 123, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (59, 5, N'bfda', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'dfadf', 412, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (61, 5, N'at', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 123123, 123, 0, 0, 0, CAST(N'2018-01-23T10:52:46.000' AS DateTime), N'/Goods/img/131611495668010613.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (62, 1, N'hello', N'233333', N't', N'u', 666, 666, 0, 0, 0, CAST(N'2019-04-29T15:02:37.000' AS DateTime), N'/Goods/img/132009949573401490.jpg')
SET IDENTITY_INSERT [dbo].[Goods_Info] OFF
SET IDENTITY_INSERT [dbo].[User_Account] ON 

INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (3, N'admin', N'admin')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (4, N'user1', N'user1')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (5, N'tioa', N'tioa')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (8, N'test1853', N'1234')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (9, N'ncwu', N'ncwu')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (10, N'haue', N'haue')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (11, N'admin111', N'111')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (12, N'222', N'222')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (13, N'418reg', N'4188')
SET IDENTITY_INSERT [dbo].[User_Account] OFF
SET IDENTITY_INSERT [dbo].[User_Address] ON 

INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (1, N'admin', N'实姓', N'463411    ', N'华北水利水电大学1', N'10086')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (2, N'user1', N'user1', N'000000    ', N'test1', N'101')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (3, N'tioa', N'tioa', N'000000    ', N'test2', N'102')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (4, N'test1853', N'test1853', N'111111    ', N'111', N'1111')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (5, N'ncwu', N'史雷', N'463400    ', N'河南省华北水利水电大学', N'039610010')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (6, N'haue', NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (7, N'admin111', NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (8, N'222', NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (9, N'418reg', N'实姓', N'463411    ', N'454', N'10086')
SET IDENTITY_INSERT [dbo].[User_Address] OFF
SET IDENTITY_INSERT [dbo].[User_Info] ON 

INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (8, N'222', N'222', CAST(1000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (9, N'418reg', N'admintest', CAST(790.07 AS Decimal(18, 2)), 1)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (4, N'admin', N'admintest', CAST(1665411.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (7, N'admin111', N'admin111', CAST(1000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (6, N'haue', N'haue', CAST(1000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (5, N'ncwu', N'测试用户', CAST(16432.67 AS Decimal(18, 2)), 2)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (3, N'Tioa', N'tioa_test', CAST(1000.11 AS Decimal(18, 2)), 1)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (2, N'user1', N'user1_test', CAST(1006.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[User_Info] OFF
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
USE [master]
GO
ALTER DATABASE [B2C_Demo] SET  READ_WRITE 
GO
