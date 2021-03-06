USE [master]
GO
/****** Object:  Database [B2C_Demo]    Script Date: 2019/6/26 16:11:16 ******/
CREATE DATABASE [B2C_Demo] ON  PRIMARY 
( NAME = N'B2C_Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\B2C_Demo.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  User [debug]    Script Date: 2019/6/26 16:11:16 ******/
CREATE USER [debug] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'debug'
GO
/****** Object:  Table [dbo].[Cart_Goods]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Goods](
	[order_id] [varchar](50) NOT NULL,
	[order_bookid] [int] NOT NULL,
	[order_booknum] [int] NOT NULL,
	[uid] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Cart_Goods] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[order_bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Info]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Info](
	[order_id] [varchar](50) NOT NULL,
	[UID] [varchar](50) NOT NULL,
	[receiver_address_id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Goods_Class]    Script Date: 2019/6/26 16:11:16 ******/
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
/****** Object:  Table [dbo].[Goods_Info]    Script Date: 2019/6/26 16:11:16 ******/
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
	[OriginalPrice] [float] NOT NULL,
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
/****** Object:  Table [dbo].[User_Account]    Script Date: 2019/6/26 16:11:16 ******/
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
/****** Object:  Table [dbo].[User_Address]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](20) NOT NULL,
	[RealName] [varchar](50) NOT NULL,
	[PostCode] [nchar](6) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[AddTime] [timestamp] NOT NULL,
	[IsSelected] [bit] NOT NULL,
 CONSTRAINT [PK_User_Address-id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Info]    Script Date: 2019/6/26 16:11:16 ******/
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
/****** Object:  View [dbo].[Goods_Sales_Rank]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Goods_Sales_Rank]
AS
SELECT   TOP (100) PERCENT dbo.Cart_Goods.order_bookid AS BookID, COUNT(dbo.Cart_Goods.order_booknum) 
                AS BookSalesCount
FROM      dbo.Cart_Goods INNER JOIN
                dbo.Goods_Info ON dbo.Cart_Goods.order_bookid = dbo.Goods_Info.BookID
GROUP BY dbo.Cart_Goods.order_bookid
GO
/****** Object:  View [dbo].[Goods_Sales_Rank_Top10]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Goods_Sales_Rank_Top10]
AS
SELECT   TOP (10) dbo.Goods_Sales_Rank.BookID, dbo.Goods_Sales_Rank.BookSalesCount, dbo.Goods_Info.BookName, 
                dbo.Goods_Info.BookIntroduce, dbo.Goods_Info.picUrl, dbo.Goods_Info.ClassID
FROM      dbo.Goods_Sales_Rank INNER JOIN
                dbo.Goods_Info ON dbo.Goods_Sales_Rank.BookID = dbo.Goods_Info.BookID
GO
/****** Object:  View [dbo].[Goods_Recommend_ByClass]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Goods_Recommend_ByClass]
AS
SELECT   TOP (100) dbo.Goods_Sales_Rank.BookID, dbo.Goods_Info.OriginalPrice, dbo.Goods_Info.MarketPrice, 
                dbo.Goods_Info.ClassID, dbo.Goods_Sales_Rank.BookSalesCount, dbo.Goods_Info.BookName, 
                dbo.Goods_Info.picUrl
FROM      dbo.Goods_Sales_Rank INNER JOIN
                dbo.Goods_Info ON dbo.Goods_Sales_Rank.BookID = dbo.Goods_Info.BookID
GO
/****** Object:  View [dbo].[Goods_Order_AllUser]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Goods_Order_AllUser]
AS
SELECT     Cart_Info.order_id, Cart_Info.UID, User_Address.RealName, User_Address.PostCode, User_Address.Address, User_Address.PhoneNumber, Cart_Info.order_price, 
                      Cart_Info.isSend, Cart_Info.isPay
FROM         Cart_Info INNER JOIN
                      User_Address ON Cart_Info.UID = User_Address.UID AND Cart_Info.receiver_address_id = User_Address.id
GO
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608016294888680admin', 1, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608061564159638admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608063236625174admin', 1019, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'131608066054035593admin', 5, 1, N'admin')
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
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010084979832322admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010086851802563admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010171642901483admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010171642901483admin', 14, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010210153326367user1', 8, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010223570455012user1', 8, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010223570455012user1', 32, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010223570455012user1', 34, 1, N'user1')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 14, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 23, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 33, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132010930416599341admin', 34, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132025262166849524admin', 53, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132028047886698353admin', 53, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132030093157894143admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132030103061812497admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132030103061812497admin', 53, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132030108074827046admin', 53, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132040443594342367admin', 8, 2, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132040945936931654admin', 8, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132040946840581249admin', 37, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132052962565742731admin', 9, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132052962565742731admin', 19, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132052966901118064admin', 19, 2, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132053001761498487admin', 37, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132053001761498487admin', 62, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132053136389730280admin', 30, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132053136389730280admin', 35, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132053801885018180admin', 24, 2, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132053804652944895admin', 24, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132053804894247356admin', 10, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132054993300162549admin', 9, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132054993452069750admin', 45, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132054993950876355admin', 49, 2, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132054993950876355admin', 59, 2, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132054993950876355admin', 62, 2, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132054993950876355admin', 63, 2, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132054993950876355admin', 64, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055171225102191admin', 45, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055171346943546admin', 62, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055171497510081admin', 61, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055171643423797admin', 64, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055171755963135admin', 53, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055180672307871admin', 133, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055180834504566admin', 138, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055180964081916admin', 145, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055181077545529admin', 146, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055181323777846admin', 150, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055181323777846admin', 151, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055181323777846admin', 152, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 153, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 154, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 155, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 162, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 163, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 169, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 170, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055183427941388admin', 172, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055529173404634admin', 62, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055605190641048admin', 150, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055610571197983admin', 61, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132055610571197983admin', 162, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132058363435375588admin', 61, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132058371345471053admin', 23, 1, N'admin')
INSERT [dbo].[Cart_Goods] ([order_id], [order_bookid], [order_booknum], [uid]) VALUES (N'132058371345471053admin', 64, 1, N'admin')
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608016294888680admin', N'admin', 20, CAST(N'2018-01-19T10:13:49.000' AS DateTime), 0, 0, 233.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608061564159638admin', N'admin', 20, CAST(N'2018-01-19T11:29:16.000' AS DateTime), 0, 0, 55)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608063236625174admin', N'admin', 20, CAST(N'2018-01-19T11:32:03.000' AS DateTime), 0, 0, 9)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131608066054035593admin', N'admin', 20, CAST(N'2018-01-19T11:36:45.000' AS DateTime), 0, 1, 3)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131611496085363164admin', N'admin', 20, CAST(N'2018-01-23T10:53:28.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131611649227993650admin', N'admin', 20, CAST(N'2018-01-23T15:08:42.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131611725123469336admin', N'admin', 20, CAST(N'2018-01-23T17:15:12.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131998890967070060admin', N'admin', 20, CAST(N'2019-04-16T19:51:36.000' AS DateTime), 0, 1, 89.97)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131999871353887598admin', N'admin', 20, CAST(N'2019-04-17T23:05:35.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131999872964512231admin', N'admin', 20, CAST(N'2019-04-17T23:08:16.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'131999873852512208admin', N'admin', 20, CAST(N'2019-04-17T23:09:45.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000261357358925admin', N'admin', 20, CAST(N'2019-04-18T09:55:35.000' AS DateTime), 0, 1, 89.97)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000261860929463admin', N'admin', 20, CAST(N'2019-04-18T09:56:26.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132000267308272925admin', N'admin', 20, CAST(N'2019-04-18T10:05:30.000' AS DateTime), 0, 1, 2969.01)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010084979832322admin', N'admin', 20, CAST(N'2019-04-29T18:48:17.000' AS DateTime), 0, 0, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010086851802563admin', N'admin', 20, CAST(N'2019-04-29T18:51:25.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010171642901483admin', N'admin', 20, CAST(N'2019-04-29T21:12:44.000' AS DateTime), 0, 1, 31.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010210153326367user1', N'user1', 2, CAST(N'2019-04-29T22:16:55.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010223570455012user1', N'user1', 2, CAST(N'2019-04-29T22:39:17.000' AS DateTime), 0, 1, 33.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132010930416599341admin', N'admin', 20, CAST(N'2019-04-30T18:17:21.000' AS DateTime), 0, 1, 37.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132025262166849524admin', N'admin', 20, CAST(N'2019-05-17T08:23:36.000' AS DateTime), 0, 1, 2)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132028047886698353admin', N'admin', 20, CAST(N'2019-05-20T13:46:28.000' AS DateTime), 0, 1, 2)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132030093157894143admin', N'admin', 20, CAST(N'2019-05-22T22:35:15.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132030103061812497admin', N'admin', 20, CAST(N'2019-05-22T22:51:46.000' AS DateTime), 0, 1, 31.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132030108074827046admin', N'admin', 20, CAST(N'2019-05-22T23:00:07.000' AS DateTime), 0, 1, 2)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132040443594342367admin', N'admin', 20, CAST(N'2019-06-03T22:05:59.000' AS DateTime), 0, 0, 59.98)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132040945936931654admin', N'admin', 20, CAST(N'2019-06-04T12:03:13.000' AS DateTime), 0, 1, 29.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132040946840581249admin', N'admin', 37, CAST(N'2019-06-04T12:04:44.000' AS DateTime), 0, 1, 2)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132052962565742731admin', N'admin', 20, CAST(N'2019-06-18T09:50:56.000' AS DateTime), 0, 1, 52)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132052966901118064admin', N'admin', 36, CAST(N'2019-06-18T09:58:10.000' AS DateTime), 0, 1, 60)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132053001761498487admin', N'admin', 36, CAST(N'2019-06-18T10:56:16.000' AS DateTime), 0, 1, 534.4)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132053136389730280admin', N'admin', 36, CAST(N'2019-06-18T14:40:38.000' AS DateTime), 0, 1, 42.99)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132053801885018180admin', N'admin', 36, CAST(N'2019-06-19T09:09:48.000' AS DateTime), 0, 1, 26)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132053804652944895admin', N'admin', 36, CAST(N'2019-06-19T09:14:25.000' AS DateTime), 0, 1, 13)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132053804894247356admin', N'admin', 36, CAST(N'2019-06-19T09:14:49.000' AS DateTime), 0, 1, 23.33)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132054993300162549admin', N'admin', 36, CAST(N'2019-06-20T18:15:30.000' AS DateTime), 0, 1, 17.6)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132054993452069750admin', N'admin', 37, CAST(N'2019-06-20T18:15:45.000' AS DateTime), 0, 1, 41.7)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132054993950876355admin', N'admin', 37, CAST(N'2019-06-20T18:16:35.000' AS DateTime), 0, 1, 605.6)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055171225102191admin', N'admin', 36, CAST(N'2019-06-20T23:12:02.000' AS DateTime), 0, 1, 41.7)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055171346943546admin', N'admin', 37, CAST(N'2019-06-20T23:12:14.000' AS DateTime), 0, 1, 159.2)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055171497510081admin', N'admin', 37, CAST(N'2019-06-20T23:12:29.000' AS DateTime), 0, 1, 61.6)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055171643423797admin', N'admin', 37, CAST(N'2019-06-20T23:12:44.000' AS DateTime), 0, 1, 20.8)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055171755963135admin', N'admin', 37, CAST(N'2019-06-20T23:12:55.000' AS DateTime), 0, 1, 40.3)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055180672307871admin', N'admin', 37, CAST(N'2019-06-20T23:27:47.000' AS DateTime), 0, 1, 24)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055180834504566admin', N'admin', 36, CAST(N'2019-06-20T23:28:03.000' AS DateTime), 0, 1, 42.6)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055180964081916admin', N'admin', 36, CAST(N'2019-06-20T23:28:16.000' AS DateTime), 0, 1, 38.3)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055181077545529admin', N'admin', 20, CAST(N'2019-06-20T23:28:27.000' AS DateTime), 0, 1, 55.3)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055181323777846admin', N'admin', 20, CAST(N'2019-06-20T23:28:52.000' AS DateTime), 0, 1, 77.9)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055183427941388admin', N'admin', 37, CAST(N'2019-06-20T23:32:22.000' AS DateTime), 0, 1, 396.5)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055529173404634admin', N'admin', 37, CAST(N'2019-06-21T09:08:37.000' AS DateTime), 0, 1, 159.2)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055605190641048admin', N'admin', 20, CAST(N'2019-06-21T11:15:19.000' AS DateTime), 0, 0, 24.7)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132055610571197983admin', N'admin', 20, CAST(N'2019-06-21T11:24:17.000' AS DateTime), 0, 0, 85.6)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132058363435375588admin', N'admin', 20, CAST(N'2019-06-24T15:52:23.000' AS DateTime), 0, 0, 61.6)
INSERT [dbo].[Cart_Info] ([order_id], [UID], [receiver_address_id], [order_date], [isSend], [isPay], [order_price]) VALUES (N'132058371345471053admin', N'admin', 20, CAST(N'2019-06-24T16:05:34.000' AS DateTime), 0, 0, 54.5)
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

INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (8, 1, N'人间失格', N'超燃！“丧文化”流行，《人间失格》成了现象级畅销书！', N'太宰治', N'作家出版社', 299.9, 23.992, 29.99, 0, 0, 0, CAST(N'2019-06-19T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (9, 1, N'人海生海', N'测试数据', N'麦家', N'测试', 220, 17.6, 17.6, 0, 0, 0, CAST(N'2019-06-19T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (10, 1, N'测试2', N'测试数据', N'测试数据', N'测试出版社', 20, 1.6, 23.33, 0, 0, 0, CAST(N'2019-06-19T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (14, 1, N'间谍之死', N'拒绝好莱坞翻拍的年度作品，刺激程度超越《碟中谍》，更…（未完）', N'[美]丹·马里兰', N'天津人民出版社', 41, 41, 41, 0, 0, 0, CAST(N'2018-08-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (19, 1, N'德国极简史', N'测试数据', N'[英]詹姆斯·霍斯', N'湖南文艺出版社', 45.5, 45.5, 45.5, 0, 0, 0, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (20, 1, N'读懂孩子的心', N'樊登2019年新书.', N'樊登', N'中国友谊出版公司', 46.7, 46.7, 46.7, 0, 0, 0, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (23, 1, N'脱口而出，妙语连珠', N'令人终生难忘的即兴演说书成功与否并不取…（未完）', N'安德里·赛德涅夫', N'天津人民出版社', 33.7, 33.7, 33.7, 0, 0, 0, CAST(N'2016-08-01T00:00:00.000' AS DateTime), N'/Goods/img/07.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (24, 1, N'魔力四射：如何打动、亲近和影响他人', N'一本改变人生思维方式的魔...', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2016-08-01T00:00:00.000' AS DateTime), N'/Goods/img/08.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (30, 1, N'她被给予的人生', N'当当独家首发 那些没被原生家庭打败的人,都经历...', N'（美）爱伦·玛丽·怀斯曼', N'中国友谊出版公司', 37, 37, 37, 0, 0, 0, CAST(N'2019-04-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (31, 1, N'锁脑', N'如何瞬间、深度、持久地影响他人', N'程志良', N'机械工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2018-10-20T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (32, 1, N'当仓央嘉措遇见纳兰容若', N'测试数据', N'随园散人', N'湖南人民出版社', 30.9, 30.9, 30.9, 0, 0, 0, CAST(N'2019-02-20T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (33, 1, N'找回迷失的自己', N'从自耗到高效逆转', N'程志良', N'北京大学出版社', 31.9, 31.9, 31.9, 0, 0, 0, CAST(N'2018-08-27T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (34, 1, N'绩效管理与量化考核从入门到精通', N'测试数据', N'任康磊', N'人民邮电出版社', 53.2, 53.2, 53.2, 0, 0, 0, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (35, 1, N'每个孩子都能学好语文', N'常青藤爸爸对话特级教师书系', N'李怀源，常青藤爸爸', N'长江少年儿童出版社', 37.5, 37.5, 37.5, 0, 0, 0, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (36, 1, N'每个孩子都能学好数学', N'常青藤爸爸对话特级教师书系', N'陈凤伟，常青藤爸爸', N'长江少年儿童出版社', 37.5, 37.5, 37.5, 0, 0, 0, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (37, 1, N'小小的Python编程故事', N'测试数据', N'毛雪涛', N'电子工业出版社', 66.2, 66.2, 66.2, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (38, 1, N'为爱独行', N'三个北京女孩的真实生活', N'姜丹迪', N'华文出版社', 38.1, 38.1, 38.1, 0, 0, 0, CAST(N'2018-04-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (39, 1, N'做个侃爷：精于闲聊 施展魅力', N'与任何人滔滔不绝的技巧', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2016-08-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (40, 1, N'烧烤怪谈', N'微博大V@鬼叔悬疑烧脑小说集', N'蔡必贵', N'江苏凤凰文艺出版社', 32.4, 32.4, 32.4, 0, 0, 0, CAST(N'2019-03-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (41, 1, N'林徽因传', N'人生从来都靠自己成全', N'程 碧', N'河北人民出版社', 46, 46, 46, 0, 0, 0, CAST(N'2019-01-31T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (42, 1, N'短视频：内容设计+营销推广+流量变现', N'测试数据', N'向登付', N'电子工业出版社', 52.9, 52.9, 52.9, 0, 0, 0, CAST(N'2018-09-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (43, 1, N'林清玄清欢三卷', N'50年散文创作里程碑式代表作', N'林清玄', N'北京十月文艺出版社', 147.8, 147.8, 147.8, 0, 0, 0, CAST(N'2018-11-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (44, 1, N'人生海海', N'莫言盛赞！董卿、高晓松反复阅读，杨洋、李健倾力推荐…（未完）', N'麦家', N'北京十月文艺出版社', 52.8, 52.8, 52.8, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (45, 2, N'精进2', N'解锁万物的心智进化法采铜新作！', N'采铜', N'江苏凤凰文艺出版社', 41.7, 41.7, 41.7, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (46, 2, N'生命是最好的奢侈品', N'当当独家，随书赠送个性手帖', N'赫文', N'台海出版社', 35.7, 35.7, 35.7, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (47, 2, N'人生海海', N'莫言盛赞！董卿、高晓松反复阅读，杨洋、李健倾力推荐…（未完）', N'麦家', N'北京十月文艺出版社', 52.8, 52.8, 52.8, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (48, 2, N'最初之前', N'数十万读者共情落泪，当代年轻人的缩影，令人意外的结…（未完）', N'张皓宸', N'天津人民出版社', 43.8, 43.8, 43.8, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (49, 2, N'成瘾', N'如何设计让人上瘾的产品、品牌和观念', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (50, 2, N'淘气小子马克斯（套装共4册）', N'澳洲版“马小跳”，爆笑治愈的图文…（未完）', N'[澳]马特·斯坦顿，白马时光', N'天津人民美术出版社', 115.2, 115.2, 115.2, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (51, 2, N'白色橄榄树（全二册）', N'当当专享签名本&阿瓒同款限量红绳随机发货…（未完）', N'玖月晞，白马时光', N'百花洲文艺出版社', 59.6, 59.6, 59.6, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (52, 2, N'有话说出来！', N'彻底颠覆社会人脉的固有方式，社交电池帮你搞定社…（未完）', N'【美】帕特里克·金', N'天津人民出版社', 31.5, 31.5, 31.5, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (53, 2, N'熊镇2：我们对抗你们', N'吴磊领读书目，里程碑杰作《熊镇》第二季！…（未完）', N'[瑞典]弗雷德里克·巴克曼', N'四川文艺出版社', 40.3, 40.3, 40.3, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (54, 2, N'呐喊——大屠杀回忆录', N'二战犹太大屠杀幸存者自述——一部震撼人…（未完）', N'曼尼·斯坦伯格', N'天津人民出版社', 26.4, 26.4, 26.4, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (55, 2, N'情深，万象皆深', N'林清玄50年散文创作代表作“清欢三卷”白金纪念…（未完）', N'林清玄', N'北京十月文艺出版社', 49.3, 49.3, 49.3, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (56, 2, N'谋杀鉴赏', N'《读者的选择》最佳小说奖、国际推理小说“安东尼”奖…（未完）', N'莉比·菲舍尔·赫尔曼', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (57, 2, N'做个侃爷', N'精于闲聊 施展魅力与任何人滔滔不绝的技巧', N'帕特里克·金 著', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (58, 2, N'锁脑', N'如何瞬间、深度、持久地影响他人', N'程志良', N'机械工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (59, 2, N'国家地理动物百科：鱼类（上）', N'测试数据', N'西班牙Sol90公司', N'山西人民出版社发行部', 61.6, 61.6, 61.6, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (61, 2, N'国家地理动物百科：鸟类（上）', N'测试数据', N'西班牙Sol90公司', N'山西人民出版社发行部', 61.6, 61.6, 61.6, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (62, 2, N'俏鼠记者冒险系列：第一辑（全5册）', N'老鼠记者姊妹篇，被翻译成2…（未完）', N'〔意〕菲·斯蒂顿，白马时光 出品', N'天津人民美术出版社', 159.2, 159.2, 159.2, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (63, 2, N'找回迷失的自己：从自耗到高效逆转', N'测试数据', N'程志良', N'北京大学出版社', 31.9, 31.9, 31.9, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (64, 2, N'《另类间谍》', N'推理小说名家赫尔曼之战争三部曲 展现人性深处的生…（未完）', N'[美] 莉比·菲舍尔·赫尔曼', N'天津人民出版社', 20.8, 20.8, 20.8, 0, 0, 0, CAST(N'2019-04-16T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (133, 3, N'做个侃爷：精于闲聊 施展魅力', N'与任何人滔滔不绝的技巧', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2016-08-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (134, 3, N'有话说', N'崔永元新书，ZUI高级的说话是实话实说', N'崔永元', N'浙江人民出版社', 44.3, 44.3, 44.3, 0, 0, 0, CAST(N'2018-12-25T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (135, 3, N'公众号运营：内容创作+运营推广+商业变现', N'没有简介就是简介', N'魏颖', N'化学工业出版社', 49.6, 49.6, 49.6, 0, 0, 0, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (136, 3, N'谋杀鉴赏', N'《读者的选择》最佳小说奖、国际推理小说“安东尼”奖...（未完）', N'莉比·菲舍尔·赫尔曼', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2016-05-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (137, 3, N'绩效量化管理实操指南', N'没有简介就是简介', N'冯涛', N'中国铁道出版社', 47.1, 47.1, 47.1, 0, 0, 0, CAST(N'2018-06-26T00:00:00.000' AS DateTime), N'/Goods/img/07.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (138, 3, N'文案策划：撰写技巧与经典案例', N'没有简介就是简介', N'张贵泉，张洵瑒', N'化学工业出版社', 42.6, 42.6, 42.6, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/08.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (139, 3, N'新手小白开公司：注册、财务、运营一本通', N'没有简介就是简介', N'叶小荣', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (140, 3, N'区块链+ 开启智能新时代', N'没有简介就是简介', N'张元林，陈序，赵熙', N'人民邮电出版社', 57.9, 57.9, 57.9, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (141, 3, N'企业融资：从天使投资到IPO', N'没有简介就是简介', N'廖连中', N'清华大学出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (142, 3, N'呐喊——大屠杀回忆录', N'二战犹太大屠杀幸存者自述——一部震撼人...（未完）', N'曼尼·斯坦伯格', N'天津人民出版社', 26.4, 26.4, 26.4, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (143, 3, N'孤独力', N'孤独，是我们认识自己最好的机会', N'（日）午堂登纪雄', N'天津人民出版社', 36.6, 36.6, 36.6, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (144, 3, N'转化率：淘宝天猫运营100招', N'没有简介就是简介', N'仲小建', N'电子工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (145, 3, N'股权融资：理论、案例、方法一本通', N'没有简介就是简介', N'张淼', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (146, 3, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (147, 3, N'区块链接智能', N'没有简介就是简介', N'吴锐', N'电子工业出版社', 62.4, 62.4, 62.4, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (148, 3, N'旋木情缘', N'《今日美国》畅销书获奖作品中国首发：一座重获新生的...（未完）', N'堂娜·法萨诺', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (149, 3, N'夏摩山谷', N'文艺女神袁泉推荐！庆山2019重磅长篇。充满泪水与光亮...（未完）', N'庆山（安妮宝贝），果麦文化 出品', N'江苏凤凰文艺出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (150, 3, N'美的人', N'没有简介就是简介', N'邱伟杰', N'四川文艺出版社', 24.7, 24.7, 24.7, 0, 0, 0, CAST(N'2018-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (151, 3, N'《另类间谍》', N'推理小说名家赫尔曼之战争三部曲 展现人性深处的生...（未完）', N'[美] 莉比·菲舍尔·赫尔曼', N'天津人民出版社', 20.8, 20.8, 20.8, 0, 0, 0, CAST(N'2017-03-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (152, 3, N'安卡的故事', N'聚焦人类史上极其残忍恐怖的犯罪，一场被血污沾染的...（未完）', N'[英]马克·威廉姆斯', N'天津人民出版社', 32.4, 32.4, 32.4, 0, 0, 0, CAST(N'2018-08-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (153, 4, N'克隆版大脑', N'如果你脑子里的一切都被计算机复制，会发生什么事？...（未完）', N'大卫·沃尔夫', N'天津人民出版社', 28, 28, 28, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (154, 4, N'微信公众号运营：实战方法、案例与技巧', N'没有简介就是简介', N'庐七', N'电子工业出版社', 41.7, 41.7, 41.7, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (155, 4, N'成瘾：如何设计让人上瘾的产品、品牌和观念', N'没有简介就是简介', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (156, 4, N'绩效管理与量化考核从入门到精通', N'没有简介就是简介', N'任康磊', N'人民邮电出版社', 53.2, 53.2, 53.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (157, 4, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (158, 4, N'魔力四射：如何打动、亲近和影响他人', N'一本改变人生思维方式的魔...（未完）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (159, 4, N'一千个陌生人的生与死', N'没有简介就是简介', N'[美]凯文·哈扎德', N'天津人民出版社', 24.9, 24.9, 24.9, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (160, 4, N'旋木情缘', N'《今日美国》畅销书获奖作品中国首发：一座重获新生的...（未完）', N'堂娜·法萨诺', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (161, 4, N'找回迷失的自己：从自耗到高效逆转', N'没有简介就是简介', N'程志良', N'北京大学出版社', 31.9, 31.9, 31.9, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (162, 4, N'做个侃爷：精于闲聊 施展魅力', N'与任何人滔滔不绝的技巧）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (163, 4, N'节日之书：余世存说中国传统节日', N'余世存2019年重磅新作）', N'余世存', N'北京时代华文书局', 26.5, 26.5, 26.5, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (164, 4, N'刀尖（套装共2册）', N'没有简介就是简介', N'麦家', N'人民文学出版社', 95.4, 95.4, 95.4, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (165, 4, N'文案策划：撰写技巧与经典案例', N'没有简介就是简介', N'张贵泉，张洵瑒', N'化学工业出版社', 42.6, 42.6, 42.6, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (166, 4, N'股权融资：理论、案例、方法一本通', N'没有简介就是简介', N'张淼', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (167, 4, N'锁脑：如何瞬间、深度、持久地影响他人', N'没有简介就是简介', N'程志良', N'机械工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (168, 4, N'好姑娘的爱情升级手册', N'没有简介就是简介', N'辛香兰', N'江苏凤凰文艺出版社', 26.3, 26.3, 26.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (169, 4, N'约翰·克利斯朵夫', N'完整珍藏版！世上只有一种英雄主义，就是认清...（未完）', N'（法）罗曼·罗兰(Romain Rolland)', N'海南出版社', 151.3, 151.3, 151.3, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (170, 4, N'短视频：内容设计+营销推广+流量变现', N'没有简介就是简介', N'向登付', N'电子工业出版社', 52.9, 52.9, 52.9, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (171, 4, N'秋灯琐忆', N'与《浮生六记》并列的中国人生活美学典范，古文经典遗...（未完）', N'蒋坦，译者：朱隐山，果麦文化 出品', N'天津人民出版社', 35.7, 35.7, 35.7, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (172, 4, N'时光电影院', N'没有简介就是简介', N'姚瑶', N'四川文艺出版社', 32.4, 32.4, 32.4, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (173, 5, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (174, 5, N'区块链接智能', N'没有简介就是简介', N'吴锐', N'电子工业出版社', 62.4, 62.4, 62.4, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (175, 5, N'旋木情缘', N'《今日美国》畅销书获奖作品中国首发：一座重获新生的...（未完）', N'堂娜·法萨诺', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (176, 5, N'夏摩山谷', N'文艺女神袁泉推荐！庆山2019重磅长篇。充满泪水与光亮...（未完）', N'庆山（安妮宝贝），果麦文化 出品', N'江苏凤凰文艺出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (177, 5, N'美的人', N'没有简介就是简介', N'邱伟杰', N'四川文艺出版社', 24.7, 24.7, 24.7, 0, 0, 0, CAST(N'2018-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (178, 5, N'《另类间谍》', N'推理小说名家赫尔曼之战争三部曲 展现人性深处的生...（未完）', N'[美] 莉比·菲舍尔·赫尔曼', N'天津人民出版社', 20.8, 20.8, 20.8, 0, 0, 0, CAST(N'2017-03-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (179, 5, N'安卡的故事', N'聚焦人类史上极其残忍恐怖的犯罪，一场被血污沾染的...（未完）', N'[英]马克·威廉姆斯', N'天津人民出版社', 32.4, 32.4, 32.4, 0, 0, 0, CAST(N'2018-08-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (180, 5, N'克隆版大脑', N'如果你脑子里的一切都被计算机复制，会发生什么事？...（未完）', N'大卫·沃尔夫', N'天津人民出版社', 28, 28, 28, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (181, 5, N'微信公众号运营：实战方法、案例与技巧', N'没有简介就是简介', N'庐七', N'电子工业出版社', 41.7, 41.7, 41.7, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (182, 5, N'成瘾：如何设计让人上瘾的产品、品牌和观念', N'没有简介就是简介', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (183, 5, N'绩效管理与量化考核从入门到精通', N'没有简介就是简介', N'任康磊', N'人民邮电出版社', 53.2, 53.2, 53.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (184, 5, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (185, 5, N'魔力四射：如何打动、亲近和影响他人', N'一本改变人生思维方式的魔...（未完）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (186, 5, N'一千个陌生人的生与死', N'没有简介就是简介', N'[美]凯文·哈扎德', N'天津人民出版社', 24.9, 24.9, 24.9, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (187, 1002, N'成瘾：如何设计让人上瘾的产品、品牌和观念', N'没有简介就是简介', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (188, 1002, N'绩效管理与量化考核从入门到精通', N'没有简介就是简介', N'任康磊', N'人民邮电出版社', 53.2, 53.2, 53.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (189, 1002, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
GO
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (190, 1002, N'魔力四射：如何打动、亲近和影响他人', N'一本改变人生思维方式的魔...（未完）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (191, 1002, N'一千个陌生人的生与死', N'没有简介就是简介', N'[美]凯文·哈扎德', N'天津人民出版社', 24.9, 24.9, 24.9, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (192, 1002, N'旋木情缘', N'《今日美国》畅销书获奖作品中国首发：一座重获新生的...（未完）', N'堂娜·法萨诺', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (193, 1002, N'找回迷失的自己：从自耗到高效逆转', N'没有简介就是简介', N'程志良', N'北京大学出版社', 31.9, 31.9, 31.9, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (194, 1002, N'做个侃爷：精于闲聊 施展魅力', N'与任何人滔滔不绝的技巧）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (195, 1002, N'节日之书：余世存说中国传统节日', N'余世存2019年重磅新作）', N'余世存', N'北京时代华文书局', 26.5, 26.5, 26.5, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (196, 1002, N'刀尖（套装共2册）', N'没有简介就是简介', N'麦家', N'人民文学出版社', 95.4, 95.4, 95.4, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (197, 1002, N'文案策划：撰写技巧与经典案例', N'没有简介就是简介', N'张贵泉，张洵瑒', N'化学工业出版社', 42.6, 42.6, 42.6, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (198, 1002, N'股权融资：理论、案例、方法一本通', N'没有简介就是简介', N'张淼', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (199, 1002, N'锁脑：如何瞬间、深度、持久地影响他人', N'没有简介就是简介', N'程志良', N'机械工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (200, 1002, N'好姑娘的爱情升级手册', N'没有简介就是简介', N'辛香兰', N'江苏凤凰文艺出版社', 26.3, 26.3, 26.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (201, 1002, N'约翰·克利斯朵夫', N'完整珍藏版！世上只有一种英雄主义，就是认清...（未完）', N'（法）罗曼·罗兰(Romain Rolland)', N'海南出版社', 151.3, 151.3, 151.3, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (202, 1002, N'短视频：内容设计+营销推广+流量变现', N'没有简介就是简介', N'向登付', N'电子工业出版社', 52.9, 52.9, 52.9, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (203, 1002, N'秋灯琐忆', N'与《浮生六记》并列的中国人生活美学典范，古文经典遗...（未完）', N'蒋坦，译者：朱隐山，果麦文化 出品', N'天津人民出版社', 35.7, 35.7, 35.7, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (204, 1002, N'时光电影院', N'没有简介就是简介', N'姚瑶', N'四川文艺出版社', 32.4, 32.4, 32.4, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (205, 1002, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (206, 1003, N'绩效量化管理实操指南', N'没有简介就是简介', N'冯涛', N'中国铁道出版社', 47.1, 47.1, 47.1, 0, 0, 0, CAST(N'2018-06-26T00:00:00.000' AS DateTime), N'/Goods/img/07.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (207, 1003, N'文案策划：撰写技巧与经典案例', N'没有简介就是简介', N'张贵泉，张洵瑒', N'化学工业出版社', 42.6, 42.6, 42.6, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/08.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (208, 1003, N'新手小白开公司：注册、财务、运营一本通', N'没有简介就是简介', N'叶小荣', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (209, 1003, N'区块链+ 开启智能新时代', N'没有简介就是简介', N'张元林，陈序，赵熙', N'人民邮电出版社', 57.9, 57.9, 57.9, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (210, 1003, N'企业融资：从天使投资到IPO', N'没有简介就是简介', N'廖连中', N'清华大学出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (211, 1003, N'呐喊——大屠杀回忆录', N'二战犹太大屠杀幸存者自述——一部震撼人...（未完）', N'曼尼·斯坦伯格', N'天津人民出版社', 26.4, 26.4, 26.4, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (212, 1003, N'孤独力', N'孤独，是我们认识自己最好的机会', N'（日）午堂登纪雄', N'天津人民出版社', 36.6, 36.6, 36.6, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (213, 1003, N'转化率：淘宝天猫运营100招', N'没有简介就是简介', N'仲小建', N'电子工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (214, 1003, N'股权融资：理论、案例、方法一本通', N'没有简介就是简介', N'张淼', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (215, 1003, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (216, 1003, N'区块链接智能', N'没有简介就是简介', N'吴锐', N'电子工业出版社', 62.4, 62.4, 62.4, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (217, 1003, N'旋木情缘', N'《今日美国》畅销书获奖作品中国首发：一座重获新生的...（未完）', N'堂娜·法萨诺', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (218, 1003, N'夏摩山谷', N'文艺女神袁泉推荐！庆山2019重磅长篇。充满泪水与光亮...（未完）', N'庆山（安妮宝贝），果麦文化 出品', N'江苏凤凰文艺出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (219, 1003, N'美的人', N'没有简介就是简介', N'邱伟杰', N'四川文艺出版社', 24.7, 24.7, 24.7, 0, 0, 0, CAST(N'2018-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (220, 1003, N'《另类间谍》', N'推理小说名家赫尔曼之战争三部曲 展现人性深处的生...（未完）', N'[美] 莉比·菲舍尔·赫尔曼', N'天津人民出版社', 20.8, 20.8, 20.8, 0, 0, 0, CAST(N'2017-03-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (221, 1003, N'安卡的故事', N'聚焦人类史上极其残忍恐怖的犯罪，一场被血污沾染的...（未完）', N'[英]马克·威廉姆斯', N'天津人民出版社', 32.4, 32.4, 32.4, 0, 0, 0, CAST(N'2018-08-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (222, 1003, N'克隆版大脑', N'如果你脑子里的一切都被计算机复制，会发生什么事？...（未完）', N'大卫·沃尔夫', N'天津人民出版社', 28, 28, 28, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (223, 1003, N'微信公众号运营：实战方法、案例与技巧', N'没有简介就是简介', N'庐七', N'电子工业出版社', 41.7, 41.7, 41.7, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (224, 1003, N'成瘾：如何设计让人上瘾的产品、品牌和观念', N'没有简介就是简介', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (225, 1004, N'孤独力', N'孤独，是我们认识自己最好的机会', N'（日）午堂登纪雄', N'天津人民出版社', 36.6, 36.6, 36.6, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (226, 1004, N'转化率：淘宝天猫运营100招', N'没有简介就是简介', N'仲小建', N'电子工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (227, 1004, N'股权融资：理论、案例、方法一本通', N'没有简介就是简介', N'张淼', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (228, 1004, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (229, 1004, N'区块链接智能', N'没有简介就是简介', N'吴锐', N'电子工业出版社', 62.4, 62.4, 62.4, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (230, 1004, N'旋木情缘', N'《今日美国》畅销书获奖作品中国首发：一座重获新生的...（未完）', N'堂娜·法萨诺', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (231, 1004, N'夏摩山谷', N'文艺女神袁泉推荐！庆山2019重磅长篇。充满泪水与光亮...（未完）', N'庆山（安妮宝贝），果麦文化 出品', N'江苏凤凰文艺出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (232, 1004, N'安卡的故事', N'聚焦人类史上极其残忍恐怖的犯罪，一场被血污沾染的...（未完）', N'[英]马克·威廉姆斯', N'天津人民出版社', 32.4, 32.4, 32.4, 0, 0, 0, CAST(N'2018-08-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (233, 1004, N'克隆版大脑', N'如果你脑子里的一切都被计算机复制，会发生什么事？...（未完）', N'大卫·沃尔夫', N'天津人民出版社', 28, 28, 28, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (234, 1004, N'微信公众号运营：实战方法、案例与技巧', N'没有简介就是简介', N'庐七', N'电子工业出版社', 41.7, 41.7, 41.7, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (235, 1004, N'成瘾：如何设计让人上瘾的产品、品牌和观念', N'没有简介就是简介', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (236, 1004, N'孤独力', N'孤独，是我们认识自己最好的机会', N'（日）午堂登纪雄', N'天津人民出版社', 36.6, 36.6, 36.6, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (237, 1004, N'转化率：淘宝天猫运营100招', N'没有简介就是简介', N'仲小建', N'电子工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (238, 1005, N'成瘾：如何设计让人上瘾的产品、品牌和观念', N'没有简介就是简介', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (239, 1005, N'绩效管理与量化考核从入门到精通', N'没有简介就是简介', N'任康磊', N'人民邮电出版社', 53.2, 53.2, 53.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (240, 1005, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (241, 1005, N'魔力四射：如何打动、亲近和影响他人', N'一本改变人生思维方式的魔...（未完）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (242, 1005, N'一千个陌生人的生与死', N'没有简介就是简介', N'[美]凯文·哈扎德', N'天津人民出版社', 24.9, 24.9, 24.9, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (243, 1005, N'成瘾：如何设计让人上瘾的产品、品牌和观念', N'没有简介就是简介', N'程志良', N'机械工业出版社', 39.7, 39.7, 39.7, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (244, 1005, N'绩效管理与量化考核从入门到精通', N'没有简介就是简介', N'任康磊', N'人民邮电出版社', 53.2, 53.2, 53.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (245, 1005, N'合伙创业：合作机制+股份分配+风险规避', N'没有简介就是简介', N'曹海涛', N'清华大学出版社', 55.3, 55.3, 55.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (246, 1005, N'魔力四射：如何打动、亲近和影响他人', N'一本改变人生思维方式的魔...（未完）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (247, 1005, N'一千个陌生人的生与死', N'没有简介就是简介', N'[美]凯文·哈扎德', N'天津人民出版社', 24.9, 24.9, 24.9, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/05.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (248, 1005, N'旋木情缘', N'《今日美国》畅销书获奖作品中国首发：一座重获新生的...（未完）', N'堂娜·法萨诺', N'天津人民出版社', 27.3, 27.3, 27.3, 0, 0, 0, CAST(N'2018-12-07T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (249, 1005, N'找回迷失的自己：从自耗到高效逆转', N'没有简介就是简介', N'程志良', N'北京大学出版社', 31.9, 31.9, 31.9, 0, 0, 0, CAST(N'2018-12-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (250, 1005, N'做个侃爷：精于闲聊 施展魅力', N'与任何人滔滔不绝的技巧）', N'帕特里克·金', N'天津人民出版社', 24, 24, 24, 0, 0, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (251, 1005, N'节日之书：余世存说中国传统节日', N'余世存2019年重磅新作）', N'余世存', N'北京时代华文书局', 26.5, 26.5, 26.5, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/06.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (252, 1005, N'刀尖（套装共2册）', N'没有简介就是简介', N'麦家', N'人民文学出版社', 95.4, 95.4, 95.4, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/09.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (253, 1005, N'文案策划：撰写技巧与经典案例', N'没有简介就是简介', N'张贵泉，张洵瑒', N'化学工业出版社', 42.6, 42.6, 42.6, 0, 0, 0, CAST(N'2018-07-01T00:00:00.000' AS DateTime), N'/Goods/img/10.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (254, 1005, N'股权融资：理论、案例、方法一本通', N'没有简介就是简介', N'张淼', N'电子工业出版社', 38.3, 38.3, 38.3, 0, 0, 0, CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'/Goods/img/01.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (255, 1005, N'锁脑：如何瞬间、深度、持久地影响他人', N'没有简介就是简介', N'程志良', N'机械工业出版社', 50.2, 50.2, 50.2, 0, 0, 0, CAST(N'2017-04-01T00:00:00.000' AS DateTime), N'/Goods/img/02.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (256, 1005, N'好姑娘的爱情升级手册', N'没有简介就是简介', N'辛香兰', N'江苏凤凰文艺出版社', 26.3, 26.3, 26.3, 0, 0, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'/Goods/img/03.jpg')
INSERT [dbo].[Goods_Info] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [OriginalPrice], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate], [picUrl]) VALUES (257, 1005, N'约翰·克利斯朵夫', N'完整珍藏版！世上只有一种英雄主义，就是认清...（未完）', N'（法）罗曼·罗兰(Romain Rolland)', N'海南出版社', 151.3, 151.3, 151.3, 0, 0, 0, CAST(N'2018-10-01T00:00:00.000' AS DateTime), N'/Goods/img/04.jpg')
SET IDENTITY_INSERT [dbo].[Goods_Info] OFF
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'admin', N'admin')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'user1', N'user1')
INSERT [dbo].[User_Account] ([UID], [Password]) VALUES (N'user2', N'user2')
SET IDENTITY_INSERT [dbo].[User_Address] ON 

INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber], [IsSelected]) VALUES (2, N'user1', N'USER1', N'460000', N'HAUE', N'10086', 0)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber], [IsSelected]) VALUES (20, N'admin', N'莫古力', N'463400', N'艾欧泽亚', N'10086', 0)
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber], [IsSelected]) VALUES (37, N'admin', N'GUMI', N'463400', N'艾欧泽亚', N'10086', 0)
SET IDENTITY_INSERT [dbo].[User_Address] OFF
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'admin', N'Hello', CAST(99999999.00 AS Decimal(18, 2)), 2, N'/User/ImagesUpload/admin/132055614588137134.jpg')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'user1', N'user1_test', CAST(940000000.00 AS Decimal(18, 2)), 1, N'/User/ImagesUpload/DefaultImage.png')
INSERT [dbo].[User_Info] ([UID], [NickName], [Money], [UserType], [userImgUrl]) VALUES (N'user2', N'default', CAST(12.00 AS Decimal(18, 2)), 2, N'/User/ImagesUpload/DefaultImage.png')
ALTER TABLE [dbo].[Goods_Info] ADD  CONSTRAINT [DF_Goods_Info_OriginalPrice]  DEFAULT ((0)) FOR [OriginalPrice]
GO
ALTER TABLE [dbo].[Goods_Info] ADD  CONSTRAINT [DF_Goods_Info_Isrefinement]  DEFAULT ((0)) FOR [Isrefinement]
GO
ALTER TABLE [dbo].[Goods_Info] ADD  CONSTRAINT [DF_Goods_Info_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
ALTER TABLE [dbo].[Goods_Info] ADD  CONSTRAINT [DF_Goods_Info_IsDiscount]  DEFAULT ((0)) FOR [IsDiscount]
GO
ALTER TABLE [dbo].[User_Address] ADD  CONSTRAINT [DF_User_Address_IsSelected]  DEFAULT ((0)) FOR [IsSelected]
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
ON UPDATE CASCADE
ON DELETE CASCADE
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
/****** Object:  StoredProcedure [dbo].[SetUserDefaultAddress]    Script Date: 2019/6/26 16:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
需要的参数
@uid：uid
@id:address id
*/
CREATE PROCEDURE [dbo].[SetUserDefaultAddress](
@uid VARCHAR(20),
@id int,
@FLAG int output
)

AS
/*
0:设置成功
-1：找不到ID
*/
IF not EXISTS(SELECT * FROM User_Address WHERE id=@id and UID=@uid)
	BEGIN
		set @FLAG=-1
	END
else
	begin
		update User_Address set IsSelected=0 where uid=@uid
		update User_Address set IsSelected=1 where id=@id and uid=@uid
		set @FLAG=0
	end
GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 2019/6/26 16:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[UserPay]    Script Date: 2019/6/26 16:11:16 ******/
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
/****** Object:  StoredProcedure [dbo].[UserRegister]    Script Date: 2019/6/26 16:11:16 ******/
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
set @FLAG=0
END

ELSE
BEGIN
set @FLAG=-1
END
GO
/****** Object:  StoredProcedure [dbo].[UserSetNewPwd]    Script Date: 2019/6/26 16:11:16 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Goods_Info"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 210
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Goods_Sales_Rank"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 145
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Goods_Recommend_ByClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Goods_Recommend_ByClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cart_Goods"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 251
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Goods_Info"
            Begin Extent = 
               Top = 23
               Left = 308
               Bottom = 315
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2190
         Alias = 1920
         Table = 1755
         Output = 1080
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 2085
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Goods_Sales_Rank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Goods_Sales_Rank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Goods_Sales_Rank"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 108
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Goods_Info"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 146
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Goods_Sales_Rank_Top10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Goods_Sales_Rank_Top10'
GO
USE [master]
GO
ALTER DATABASE [B2C_Demo] SET  READ_WRITE 
GO
