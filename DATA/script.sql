USE [B2C_Demo]
GO
/****** Object:  Table [dbo].[Goods_Cart]    Script Date: 2017/7/1 22:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods_Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](20) NOT NULL,
	[CartID] [int] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[GoodsName] [varchar](50) NOT NULL,
	[GoodsPrice] [decimal](18, 2) NOT NULL,
	[Num] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goods_Info]    Script Date: 2017/7/1 22:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods_Info](
	[GoodsID] [int] NULL,
	[GoodsName] [varchar](50) NULL,
	[GoodsKind] [varchar](50) NULL,
	[GoodsPrice] [decimal](18, 2) NULL,
	[GoodsPhoto] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Account]    Script Date: 2017/7/1 22:43:02 ******/
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
/****** Object:  Table [dbo].[User_Address]    Script Date: 2017/7/1 22:43:02 ******/
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
	[PhoneNumber] [varchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Info]    Script Date: 2017/7/1 22:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](20) NULL,
	[NickName] [varchar](20) NULL,
	[Money] [decimal](18, 2) NULL,
	[UserType] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[User_Account] ON 

INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (3, N'admin', N'admin')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (4, N'user1', N'user1')
INSERT [dbo].[User_Account] ([ID], [UID], [Password]) VALUES (5, N'tioa', N'tioa')
SET IDENTITY_INSERT [dbo].[User_Account] OFF
SET IDENTITY_INSERT [dbo].[User_Address] ON 

INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (1, N'admin', N'admin', N'000000    ', N'华北水利水电大学', N'100')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (2, N'user1', N'user1', N'000000    ', N'test1', N'101')
INSERT [dbo].[User_Address] ([id], [UID], [RealName], [PostCode], [Address], [PhoneNumber]) VALUES (3, N'tioa', N'tioa', N'000000    ', N'test2', N'102')
SET IDENTITY_INSERT [dbo].[User_Address] OFF
SET IDENTITY_INSERT [dbo].[User_Info] ON 

INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (3, N'admin', N'AdminQAQ', CAST(1000.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (4, N'user1', N'user1', CAST(1000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[User_Info] ([ID], [UID], [NickName], [Money], [UserType]) VALUES (5, N'tioa', N'请设置您的昵称！', CAST(1000.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[User_Info] OFF
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_NickName]  DEFAULT ('请设置您的昵称！') FOR [NickName]
GO
ALTER TABLE [dbo].[User_Info] ADD  CONSTRAINT [DF_User_Info_Money]  DEFAULT ((1000.00)) FOR [Money]
GO
