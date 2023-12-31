USE [dotnet22_project]
GO
/****** Object:  Table [dbo].[Adv]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adv](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Photo] [nvarchar](500) NULL,
	[Position] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[DisplayHomePage] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriesProducts]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_CategoriesProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[Content] [ntext] NULL,
	[Hot] [int] NULL,
	[Photo] [nvarchar](500) NULL,
 CONSTRAINT [PK_News_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Create] [date] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_orders_detail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](4000) NULL,
	[Description] [nvarchar](4000) NULL,
	[Content] [ntext] NULL,
	[Photo] [nvarchar](4000) NULL,
	[Hot] [int] NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Star] [int] NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Photo] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[SubTitle] [nvarchar](500) NULL,
	[Info] [nvarchar](500) NULL,
	[Link] [nvarchar](500) NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsProducts]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_TagsProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/21/2023 8:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adv] ON 

INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (2, N'Quảng cáo - trang sản phẩm (dưới Popular products)', N'133347666529861774_3-slide-banner-2.jpg', 5)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (3, N'Quảng cáo - trang sản phẩm (dưới TAGS)', N'133347666436813850_3-slide-banner-1.jpg', 4)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (4, N'Trang sản phẩm - banner', N'133347666187463886_digital-electronic-banner.jpg', 3)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (6, N'Trang chủ - Ảnh Quảng cáo dưới slide show', N'133347665832198160_blog-article-4.jpg', 2)
INSERT [dbo].[Adv] ([Id], [Name], [Photo], [Position]) VALUES (7, N'Trang chủ - Quảng cáo dưới slide show', N'133347665775300265_blog-article-5.jpg', 1)
SET IDENTITY_INSERT [dbo].[Adv] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (3, 0, N'Digital & Electronics', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (4, 0, N'Furnitures & Home Decors', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (5, 0, N'Fashion & Accessories', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (9, 0, N'Tools & Equipments', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (10, 5, N'Batteries 1', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (11, 5, N'eadsets 1', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (12, 5, N'Screen 1', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (13, 4, N'Batteries 2', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (14, 4, N'Headsets 2', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (15, 4, N'Screen 2', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (16, 3, N'Batteries 3', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (17, 3, N'Headsets 3', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (18, 3, N'Screen 3', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (19, 0, N'Kid’s Toys', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (20, 0, N'Organics & Spa', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriesProducts] ON 

INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (140, 20, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (141, 19, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (142, 9, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (143, 5, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (144, 12, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (145, 4, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (146, 15, 16)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (147, 20, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (148, 19, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (149, 9, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (150, 5, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (151, 12, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (152, 4, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (153, 15, 14)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (154, 20, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (155, 19, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (156, 9, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (157, 5, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (158, 11, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (159, 4, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (160, 14, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (161, 3, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (162, 18, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (163, 17, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (164, 16, 12)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (165, 20, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (166, 19, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (167, 9, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (168, 5, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (169, 12, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (170, 4, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (171, 15, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (172, 14, 10)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (173, 20, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (174, 19, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (175, 9, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (176, 5, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (177, 12, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (178, 11, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (179, 10, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (180, 4, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (181, 15, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (182, 14, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (183, 13, 9)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (184, 20, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (185, 19, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (186, 9, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (187, 3, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (188, 18, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (189, 17, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (190, 16, 8)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (191, 20, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (192, 19, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (193, 9, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (194, 5, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (195, 12, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (196, 11, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (197, 10, 7)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (198, 19, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (199, 9, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (200, 4, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (201, 15, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (202, 14, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (203, 13, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (204, 3, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (205, 18, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (206, 17, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (207, 16, 6)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (208, 20, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (209, 19, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (210, 4, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (211, 15, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (212, 14, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (213, 13, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (214, 3, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (215, 18, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (216, 17, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (217, 16, 5)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (218, 19, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (219, 9, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (220, 5, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (221, 12, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (222, 11, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (223, 10, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (224, 19, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (225, 9, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (226, 5, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (227, 11, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (228, 10, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (229, 4, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (230, 14, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (231, 13, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (236, 20, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (237, 19, 17)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (238, 20, 18)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (239, 9, 18)
SET IDENTITY_INSERT [dbo].[CategoriesProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (6, N'Nguyễn VănA', N'nva@gmail.com', N'Hà Nội', N'123456789', N'$2b$10$CbCd.UWBy0eV1NDtTphozuu2fRqnwj8UiRlIGFRo2mN6hJP0ycbGG')
INSERT [dbo].[Customers] ([Id], [Name], [Email], [Address], [Phone], [Password]) VALUES (7, N'Nguyễn Văn B', N'nvb@gmail.com', N'Hà Nội', N'123456789', N'$2b$10$JBH9AVugb.qcr64YqaNSieOBby80U6ZvFzAkq8SSUh4wAYeRp69iO')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (2, N'Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử', N'<p>Chiều 17/7/2021, Tổng Thư ký Quốc hội Bùi Văn Cường chủ trì cuộc họp báo về dự kiến chương trình kỳ họp thứ nhất, Quốc hội khóa XV.</p><p>Tại họp báo, giới thiệu nội dung dự kiến chương trình kỳ họp thứ nhất Quốc hội khóa XV, Phó Chủ nhiệm Văn phòng Quốc hội Vũ Minh Tuấn nêu, về thời gian, Quốc hội họp phiên trù bị vào chiều 19/7, khai mạc sáng 20/7 và sẽ kết thúc vào ngày 31/7. Quốc hội có 11,5 ngày làm việc, trong đó, thời gian cho công tác nhân sự chiếm 3 ngày, thời gian dành cho việc xem xét, quyết định các vấn đề quan trọng khác là 8,5 ngày.</p>', N'<p>Chiều 17/7/2021, Tổng Thư ký Quốc hội Bùi Văn Cường chủ trì cuộc họp báo về dự kiến chương trình kỳ họp thứ nhất, Quốc hội khóa XV.</p><p>Tại họp báo, giới thiệu nội dung dự kiến chương trình kỳ họp thứ nhất Quốc hội khóa XV, Phó Chủ nhiệm Văn phòng Quốc hội Vũ Minh Tuấn nêu, về thời gian, Quốc hội họp phiên trù bị vào chiều 19/7, khai mạc sáng 20/7 và sẽ kết thúc vào ngày 31/7. Quốc hội có 11,5 ngày làm việc, trong đó, thời gian cho công tác nhân sự chiếm 3 ngày, thời gian dành cho việc xem xét, quyết định các vấn đề quan trọng khác là 8,5 ngày.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/bui-van-cuong-2-1626510268448.jpg" alt="Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử - 1"></p><p>Nhấn để phóng to ảnh</p><p>Tổng thư ký Quốc hội Bùi Văn Cường chủ trì họp báo trước kỳ họp thứ nhất, Quốc hội khóa XV.</p><p><strong>Vì sao kỳ họp này không thể thực hiện trực tuyến?</strong></p><p>Trong bối cảnh dịch bệnh&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;diễn biến phức tạp trên cả nước, Quốc hội đã chuẩn bị các biện pháp phòng ngừa, đảm bảo an toàn cho kỳ họp.</p><p>Tổng Thư ký Quốc hội Bùi Văn Cường nhấn mạnh bối cảnh kỳ họp thứ nhất diễn ra khi dịch bệnh Covid-19 trong đợt bùng phát thứ 4 đang diễn ra phức tạp trên nhiều địa bàn khắp cả nước, đặc biệt tại TPCHM và một số tỉnh phía Nam, số ca mắc tăng rất cao hàng ngày. Ông Cường khái quát, dù nhiều địa phương trong cả nước phải đang tập trung chống dịch nhưng theo quy định của Hiến pháp, chậm nhất 60 ngày sau bầu cử, Quốc hội phải tiến hành họp kỳ họp thứ nhất nên UB Thường vụ Quốc hội vẫn quyết định triệu tập kỳ họp từ 20/7.</p><p>Kỳ họp đầu tiên, Quốc hội phải tập trung làm công tác nhân sự, ông Cường lý giải, nội dung này không thể họp trực tuyến vì có hoạt động bỏ phiếu kín. Vậy nên cơ quan tổ chức cũng đã cố gắng để tổ chức kỳ họp nhanh, gọn, hiệu quả. Cụ thể, UB Thường vụ Quốc hội đã thống nhất sắp xếp lịch để có thể giảm bớt 5 ngày làm việc (theo dự kiến ban đầu, kỳ họp thứ nhất kéo dài đến 5/8, nay đã được thu gọn lại, kết thúc vào 31/7).</p><p>"Cuộc bầu cử có tới gần 70 triệu cử tri đi bỏ phiếu cuối tháng 5 vừa qua cả nước còn tổ chức được thành công thì không có lý gì kỳ họp Quốc hội với chỉ 499 đại biểu không thể tổ chức thành công" - Tổng Thư ký Quốc hội nói.</p><p>Tại kỳ họp, theo ông Vũ Minh Tuấn, Quốc hội nghe báo cáo tổng kết cuộc bầu cử vừa qua, nghe báo cáo xác nhận tư cách đại biểu Quốc hội khóa XV.</p><p>Công tác nhân sự, quyết định số Phó Chủ tịch Quốc hội, Ủy viên UB Thường vụ Quốc hội, bầu Chủ tịch Quốc hội, các Phó Chủ tịch Quốc hội, Chủ tịch Hội đồng dân tộc, Chủ nhiệm các UB của Quốc hội, Tổng Kiểm toán nhà nước.</p><p>Quốc hội cũng bầu Chủ tịch nước, Thủ tướng Chính phủ, Phó Chủ tịch nước, Chánh án TAND tối cao, Viện trưởng VKSND tối cao.</p><p>Theo quy định, ngay sau khi được bầu, các chức danh Chủ tịch Quốc hội, Chủ tịch nước, Thủ tướng, Chánh án TAND tối cao sẽ tuyên thệ nhậm chức trước Quốc hội.</p><p>Ngoài ra, Quốc hội còn tiến hành phê chuẩn bổ nhiệm các thành viên Chính phủ theo đề nghị của Thủ tướng Chính phủ (sau khi được bầu).</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/bui-van-cuong-1-1626510269534.jpg" alt="Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử - 2"></p><p>Nhấn để phóng to ảnh</p><p>Tổng Thư ký Bùi Văn Cường thông tin, trong cơ cấu Chính phủ kỳ này sẽ rút bớt vị trí một Phó Thủ tướng.</p><p>Vấn đề đặt ra trong nội dung công tác nhân sự, theo cơ cấu hiện tại, số lượng các cơ cấu lãnh đạo nhà nước gồm 51 vị trí. Tuy nhiên, tại Hội nghị Trung ương 3 vừa qua, Ban Chấp hành Trung ương thống nhất chỉ giới thiệu 50 vị trí.</p><p>Trao đổi về việc này, Tổng Thư ký Quốc hội Bùi Văn Cường khẳng định, kỳ họp này, Quốc hội tiến hành kiện toàn tất cả các chức danh lãnh đạo các cơ quan nhà nước theo quy định của pháp luật, cụ thể là 50 vị trí.</p><p>Khối Quốc hội, Quốc hội kiện toàn toàn bộ các chức danh lãnh đạo Quốc hội, lãnh đạo các cơ quan của Quốc hội, của UB Thường vụ Quốc hội.</p><p>Khối cơ quan Chính phủ, Tổng Thư ký Bùi Văn Cường cho biết: "Trước đây, theo thông lệ, Chính phủ có 5 Phó Thủ tướng nhưng kỳ họp này, Quốc hội sẽ chỉ kiện toàn 4 vị trí, đều là các Phó Thủ tướng tái cử. Theo đó, một vị trí chức danh lãnh đạo nhà nước được rút đợt này chính là một Phó Thủ tướng Chính phủ".</p><p><strong>Bộ máy Chính phủ sẽ kiện toàn 27 chức danh</strong></p><p>Trình bày thêm về việc thực hiện quy trình công tác nhân sự tại kỳ họp, Trưởng Ban Công tác đại biểu của UB Thường vụ Quốc hội Nguyễn Thị Thanh nhận định, theo quy định của luật Tổ chức Quốc hội, Tổ chức Chính phủ, công tác nhân sự là một trong những nhiệm vụ trọng tâm Quốc hội phải thực hiện trong kỳ họp đầu nhiệm kỳ, để bắt đầu cho hoạt động của cả khóa.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/2106560993518048030173631056501586342098038n-1626512343776.jpg" alt="Rút một vị trí, Chính phủ còn 4 Phó Thủ tướng được giới thiệu tái cử - 3"></p><p>Nhấn để phóng to ảnh</p><p>Bà Nguyễn Thị Thanh giải thích về các chức danh được kiện toàn trong kỳ họp lần này.</p><p>Về các chức danh được kiện toàn trong kỳ họp lần này, bà Thanh giải thích, sau Đại hội XIII của Đảng, để đảm bảo tính đồng bộ, tổng thể, liên thông về công tác cán bộ, tại kỳ họp 11 khóa XIV, Quốc hội đã kiện toàn một bước công tác nhân sự. Do cách thức tổ chức, các cơ quan nhà nước hoạt động theo nhiệm kỳ nên đến kỳ họp thứ nhất đầu nhiệm kỳ mới, Quốc hội khóa XV, việc kiện toàn các chức danh lãnh đạo cơ quan nhà nước cần thực hiện theo đúng quy trình, quy định của Hiến pháp, pháp luật.</p><p>"Các nhân sự được kiện toàn lần này không thay đổi so với kỳ họp 11 của Quốc hội khóa XIV thì đây vẫn là việc phải làm theo quy định. Việc thực hiện quy trình bầu, phê chuẩn, thực hiện tuyên thệ với các chức danh lãnh đạo chủ chốt tại Quốc hội kỳ này sẽ càng thể hiện trách nhiệm của các chức danh trước Quốc hội và cử tri, nhân dân cả nước" - bà Thanh phát biểu.</p><p>Cũng theo Trưởng Ban Công tác đại biểu, các chức danh được kiện toàn kỳ này đã được báo cáo Bộ Chính trị, ban chấp hành Trung ương, liên quan đến cơ cấu tổ chức của các khối cơ quan. Với khối Chính phủ, bà Thanh cho biết, Bộ máy Chính phủ kỳ này sẽ kiện toàn 27 chức danh, gồm Thủ tướng, 4 Phó Thủ tướng, 18 Bộ trưởng và 4 Thủ trưởng cơ quan ngang bộ.</p><p>"Đề án cơ cấu tổ chức Chính phủ đã được xem xét cụ thể cẩn thận trên cơ sở cân nhắc tổng thể về công tác cán bộ. Theo đó, Bộ Chính trị, Ban Chấp hành Trung ương đã cho ý kiến về cơ cấu Chính phủ, trước mắt có 4 Phó Thủ tướng" - Trưởng Ban Công tác đại biểu thông tin.</p><p>Bà Nguyễn Thị Thanh cũng nói thêm, trước đây, Chính phủ có một Phó Thủ tướng kiêm Bộ trưởng Ngoại giao. Đến nay, vị trí này được tách ra, Phó Thủ tướng Phạm Bình Minh không còn kiêm nhiệm chức danh Bộ trưởng Ngoại giao, ông Bùi Thanh Sơn đã được phê chuẩn bổ nhiệm làm Bộ trưởng Ngoại giao tại kỳ họp cuối cùng của Quốc hội khóa trước. Theo đó, cơ cấu Chính phủ kỳ này sẽ được kiện toàn theo hướng này.</p>', 1, N'133347664196041622_blog-article-4.jpg')
INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (3, N'Phó Thủ tướng: Cán bộ chống dịch thiếu trách nhiệm, sẵn sàng có người thay', N'<p>Ngày 17/7, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo quốc gia phòng, chống dịch&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;dự giao ban trực tuyến ngắn với TPHCM để triển khai các biện pháp phòng, chống dịch.</p><p>Ngày 17/7, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo quốc gia phòng, chống dịch&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;dự giao ban trực tuyến ngắn với TPHCM để triển khai các biện pháp phòng, chống dịch.</p>', N'<p>Ngày 17/7, Phó Thủ tướng Vũ Đức Đam, Trưởng Ban Chỉ đạo quốc gia phòng, chống dịch&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;dự giao ban trực tuyến ngắn với TPHCM để triển khai các biện pháp phòng, chống dịch.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/vu-duc-dam-1-1626519560689.jpg" alt="Phó Thủ tướng: Cán bộ chống dịch thiếu trách nhiệm, sẵn sàng có người thay - 1"></p><p>Nhấn để phóng to ảnh</p><p>Phó Thủ tướng Vũ Đức Đam cùng lãnh đạo TPHCM họp giao ban về tình hình chống dịch Covid-19 tại thành phố (ảnh: VGP).</p><p><strong>Trung tâm cấp cứu điều phối các "tầng" điều trị</strong></p><p>Cập nhật tình hình thành phố, Chủ tịch UBND TPHCM Nguyễn Thành Phong cho biết, trong vòng 24 giờ qua (tính đến 6h ngày 17/7), Thành phố ghi nhận hơn 2.800 ca mắc Covid-19, trong đó, phần lớn phát hiện trong các khu cách ly, phong tỏa (chiếm hơn 81% tổng số ca mắc), khoảng 420 ca qua sàng lọc ở bệnh viện.</p><p>Hiện thành phố đang tập trung điều trị cho các ca F0 nặng nhằm giảm số ca tử vong.</p><p>Bí thư Thành ủy TPHCM Nguyễn Văn Nên xác nhận, số ca F0, F1 ngày càng tăng cao, cả trong khu cách ly, phong tỏa, ngoài cộng đồng và phát sinh ca nhiễm trong một số khu công nghiệp, chế xuất có đông công nhân. Hệ thống y tế nhiều nơi bị quá tải.</p><p>Thành phố đã xây dựng bản đồ các khu cách ly tạm thời, bệnh viện dã chiến điều trị các F0 ở các mức độ khác nhau; đẩy mạnh ứng dụng công nghệ để thiết lập hệ thống quản lý, điều phối ca F0 trên địa bàn, giao Trung tâm cấp cứu quản lý, vận hành hệ thống này, nhằm kịp thời điều phối F0 đến các bệnh viện phù hợp nhanh nhất, giải quyết tình hình ca F0 trở nặng tăng lên hiện nay.</p><p>Bí thư Nên nhận định, những vấn đề về nhân lực, cơ sở vật chất, máy móc, sinh phẩm… đã và đang được khắc phục.</p><p>Chủ tịch UBND TPHCM Nguyễn Thành Phong cũng đề cập, hiện còn tình trạng lây nhiễm chéo trong các khu phong tỏa do vẫn các gia đình vẫn tiếp xúc với nhau. Do đó, Chủ tịch UBND TPHCM yêu cầu siết chặt các biện pháp, bảo đảm tuân thủ giãn cách trong các khu phong tỏa, phát huy vai trò của các Tổ Covid-19 cộng đồng để tăng cường kiểm tra, giám sát, xử lý nghiêm nếu có vi phạm, bảo đảm thực hiện nghiêm Chỉ thị 16.</p><p>Trước tình trạng người dân tụ tập đông người, dễ lây nhiễm trong cộng đồng, Bí thư Thành ủy Nguyễn Văn Nên quán triệt: "Qua kiểm tra, phát hiện, những nơi không thực hiện nghiêm, không chấp hành chỉ đạo cấp trên, phải xử lý nghiêm khắc, thậm chí đề nghị cách chức những lãnh đạo không thực hiện nghiêm các chỉ đạo. Từ đó, việc chấp hành phải nghiêm hơn, toàn diện hơn, đặc biệt đối với những nơi có nguy cơ lây nhiễm cao".</p><p><strong>Các bộ chống dịch thiếu trách nhiệm sẵn sàng có người thay</strong></p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/vu-duc-dam-2-1626519556095.jpg" alt="Phó Thủ tướng: Cán bộ chống dịch thiếu trách nhiệm, sẵn sàng có người thay - 2"></p><p>Nhấn để phóng to ảnh</p><p>Phó Thủ tướng: "Nếu giãn cách, phong tỏa mà ở dưới vẫn giao lưu với nhau thì cũng bằng thừa".</p><p>Đồng tình với quan điểm cương quyết của lãnh đạo TPHCM, Phó Thủ tướng Vũ Đức Đam nhấn mạnh Thành phố phải siết chặt quản lý, không để lây nhiễm chéo trong khu phong tỏa, cách ly.</p><p>Chia sẻ với thành phố có địa bàn rộng, dân số đông nên việc kiểm soát rất khó khăn nhưng Phó Thủ tướng đề nghị TPHCM phải thực hiện rất quyết liệt, huy động hệ thống chính trị vào cuộc, từ các cấp chính quyền, đến mọi tổ chức, đoàn thể. Phó Thủ tướng tán thành quan điểm, nơi nào để xảy ra lây nhiễm trong khu phong tỏa, khu cách ly phải xử lý toàn diện lãnh đạo nơi đó.</p><p>Theo Phó Thủ tướng, dịch bệnh kéo dài khiến lực lượng tham gia chống dịch căng thẳng, cần được động viên, nhưng không có nghĩa là không xử lý các trường hợp lơ là, không thực hiện nghiêm quy định.</p><p>"Tôi tin là ở các đơn vị, cán bộ nào thiếu trách nhiệm sẵn sàng có người khác thay. Nếu giãn cách, phong tỏa mà ở dưới vẫn giao lưu với nhau thì cũng bằng thừa, phải rất quyết liệt. Đây là lúc cả hệ thống chính trị phải rất trách nhiệm" - Phó Thủ tướng nói.</p><p>Về công tác điều trị, Phó Thủ tướng lưu ý thành phố tăng cường vận chuyển ca F0 đến cơ sở điều trị, đặc biệt những trường hợp có triệu chứng nặng lên. Lãnh đạo Chính phủ yêu cầu TPHCM chủ động trang bị, tuyệt đối không để các bệnh viện thiếu.</p><p>"Bây giờ, các bệnh viện vẫn rỉ tai nhau là thiếu. Đề nghị phải làm ngay, chấn chỉnh ngay cho toàn bộ anh em bên dưới yên tâm" - Phó Thủ tướng nói.</p><p>Phó Thủ tướng cho rằng việc cung ứng hàng hóa, hoạt động của các doanh nghiệp cũng phải "chấp nhận thương đau", đảm bảo tuyệt đối an toàn, nếu không thì nỗ lực phòng chống dịch sẽ đổ sông đổ biển. Theo ông, thành phố cần động viên người dân chịu khó vất vả, chia sẻ khó khăn tạm thời trước mắt để tuân thủ nghiêm các quy định giãn cách xã hội.</p>', 1, N'133347664108725619_blog-article-3.jpg')
INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (4, N'Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây?', N'<p>Sáng 17/7, Hà Nội vừa ghi nhận thêm 13 trường hợp dương tính với&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">SARS-CoV-2</a>&nbsp;, trong đó có 6 F1 của bệnh nhân T.T.H. thuộc chùm ca bệnh liên quan đến chung cư Sunshine.&nbsp;</p><p>Bên cạnh ổ dịch Công ty SEI - Khu công nghiệp Thăng Long (Đông Anh) và xã An Mỹ (huyện Mỹ Đức), Hà Nội đang phải đối mặt với các chùm ca bệnh phức tạp khác gồm: Nhóm nhân viên ngân hàng có địa chỉ tại 25 Lý Thường Kiệt (quận Hoàn Kiếm), nhân viên giao pizza tại cửa hàng số 30 Đoàn Trần Nghiệp (Hai Bà Trưng); 3 cán bộ Viện Cơ khí Năng lượng và Mỏ (Thanh Xuân).</p>', N'<p>Sáng 17/7, Hà Nội vừa ghi nhận thêm 13 trường hợp dương tính với&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">SARS-CoV-2</a>&nbsp;, trong đó có 6 F1 của bệnh nhân T.T.H. thuộc chùm ca bệnh liên quan đến chung cư Sunshine.&nbsp;</p><p>Bên cạnh ổ dịch Công ty SEI - Khu công nghiệp Thăng Long (Đông Anh) và xã An Mỹ (huyện Mỹ Đức), Hà Nội đang phải đối mặt với các chùm ca bệnh phức tạp khác gồm: Nhóm nhân viên ngân hàng có địa chỉ tại 25 Lý Thường Kiệt (quận Hoàn Kiếm), nhân viên giao pizza tại cửa hàng số 30 Đoàn Trần Nghiệp (Hai Bà Trưng); 3 cán bộ Viện Cơ khí Năng lượng và Mỏ (Thanh Xuân).</p><p>Như vậy, sau khoảng thời gian ngắn dịch bệnh lắng xuống, Hà Nội đang phải đối mặt với đợt dịch mới phức tạp, khó lường hơn.</p><p><strong>Nguy cơ bùng dịch đến từ nhiều nguồn</strong></p><p>Chiều 17/7, trao đổi với phóng viên&nbsp;<i>Dân trí</i>, ông Khổng Minh Tuấn, Phó Giám đốc CDC Hà Nội đã có những lý giải về việc, Hà Nội liên tiếp xuất hiện các chùm ca bệnh mới, chưa rõ nguồn lây trong những ngày qua.</p><p>Theo ông Tuấn, hiện chùm ca bệnh không rõ nguồn lây phức tạp nhất ở Hà Nội hiện là nhóm nhân viên ngân hàng có địa chỉ tại 25 Lý Thường Kiệt (quận Hoàn Kiếm). Ca bệnh chỉ điểm là nữ nhân viên H., không có lịch trình liên quan đến các tỉnh, vùng dịch và 2 tháng nay không đi khỏi Hà Nội.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/2phongtoa25ngoquyenbocongthuongjpg1626427374889-1626512126634.jpg" alt="Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây? - 2"></p><p>Nhấn để phóng to ảnh</p><p>Trụ sở Bộ Công Thương tại 25 Ngô Quyền phải phong tỏa do liên quan ca bệnh tại Viện Cơ khí Năng lượng và Mỏ.</p><p>Theo báo cáo dịch tễ, ngày 14/7, bà H. sốt 38,5 độ C, đau họng. Ngày 16/7, bà đến Bệnh viện Đại học Y Hà Nội khám và được chuyển vào khu sàng lọc người ho sốt.</p><p>Sau khi lấy mẫu và làm xét nghiệm Covid-19, bà nhận kết quả dương tính. Theo lãnh đạo quận Hoàn Kiếm, phòng làm việc người này có trên 20 người, đã xác định 21 F1 cùng cơ quan.</p><p>"Trong chiều nay 17/7, chúng tôi sẽ tiến hành xác định xem nguồn lây của chùm ca bệnh này xuất phát từ đâu, qua đó đưa ra phương hướng xử lý, phong tỏa và truy vết các F liên quan", ông Tuấn nói.</p><p>Chùm ca bệnh thứ hai chưa xác định nguồn lây là nhân viên giao pizza của cửa hàng số 30 Đoàn Trần Nghiệp (quận Hai Bà Trưng). Theo CDC Hà Nội, cửa hàng này gần với tòa nhà 189 Bà Triệu là nơi có 5 người mắc&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">Covid-19</a>&nbsp;(đến từ TP.HCM) làm việc. Tuy nhiên, đơn vị này thừa nhận chưa có sự liên hệ rõ ràng nào của nhân viên giao pizza với nhóm ca bệnh từ TP.HCM.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/33333-1626502402357.jpg" alt="Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây? - 3"></p><p>Nhấn để phóng to ảnh</p><p>Ngày 17/7, lực lượng chức năng đã phong tỏa khu F3, ngõ 171 Thái Hà với hơn 10 hộ dân, nơi bệnh nhân T.C.T., 31 tuổi, sinh sống.</p><p>Còn chùm ca bệnh liên quan đến Viện Cơ khí Năng lượng và Mỏ (Thanh Xuân), theo ông Tuấn đây là chùm ca bệnh có nguồn lây đến từ tỉnh Bắc Ninh.</p><p>Chùm ca bệnh Khu công nghiệp Thăng Long có nguồn lây từ Bắc Giang, và các ổ dịch rải rác tại Hai Bà Trưng, Bắc Từ Liêm, Quốc Oai... có nguồn lây đến từ TP.HCM.</p><p><strong>Chỉ cần lọt 1-2 trường hợp là có thể thành ổ dịch</strong></p><p>Ông Khổng Minh Tuấn, Phó giám đốc CDC Hà Nội nhận định, thành phố đang trong đợt dịch phức tạp, nguy cơ bùng dịch đến từ nhiều nguồn với nhiều cách thức đa dạng.</p><p>"Nguy cơ tại Hà Nội luôn ở mức rất cao, do là địa bàn trung tâm, đầu não của cả nước, nhiều trường hợp đi từ vùng dịch về nếu không kiểm soát hết, thì chỉ cần lọt 1-2 người là cũng có thể bùng phát thành ổ dịch mới", ông Tuấn chia sẻ.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/15/chc7330-1626335483956.jpg" alt="Vì sao Hà Nội xuất hiện nhiều chùm ca bệnh chưa rõ nguồn lây? - 4"></p><p>Nhấn để phóng to ảnh</p><p>Khu công nghiệp Thăng Long thường xuyên ghi nhận ca nhiễm mới trong 2 tuần qua.&nbsp;</p><p>Theo lãnh đạo CDC Hà Nội, hiện ổ dịch tại Công ty SEI - KCN Thăng Long đang được kiểm soát tốt, không có ca lây nhiễm ngoài cộng đồng, chủ yếu là các F1 đã được cách ly trước đó.</p><p>Nguyên nhân chủ yếu khiến ổ dịch này tiếp tục phát sinh ca nhiễm mới là số lượng công nhân làm việc cùng phân xưởng với ca F0 lớn, liên tục trong nhiều ngày, nên khả năng lây lan mạnh.</p><p>Theo thống kê, tổng số ca dương tính&nbsp;<a href="https://dantri.com.vn/suc-khoe/dai-dich-covid-19.htm">SARS-CoV-2</a>&nbsp;tại Hà Nội từ ngày 29/4 đến nay là 376 trường hợp. Riêng từ ngày 5/7 đến nay là 117 trường hợp thuộc 5 chùm ca bệnh. Chùm ca bệnh liên quan đến Bắc Giang có 54 trường hợp, chùm ca bệnh liên quan đến TPHCM (Hoa Vôi- Quốc Oai: 18; Nguyễn Du- Hai Bà Trưng: 7; Hòa Xá-Ứng Hòa: 5; các quận, huyện khác: 10); chùm ca bệnh tại An Mỹ - Mỹ Đức: 10 trường hợp; chùm ca bệnh liên quan đến chung cư Sunshine, Hoàng Mai: 9 trường hợp; Tân Mai - Hoàng Mai: một trường hợp; chùm ca bệnh liên quan đến Bắc Ninh: 3 trường hợp.</p>', 1, N'133347664032164143_blog-article-2.jpg')
INSERT [dbo].[News] ([Id], [Name], [Description], [Content], [Hot], [Photo]) VALUES (5, N'HLV Park Hang Seo có danh sách sơ bộ đội tuyển Việt Nam', N'<p>Sau khi rà soát, danh sách trên có thể được HLV&nbsp;<a href="https://dantri.com.vn/hlv-park-hang-seo.tag">Park Hang Seo</a>&nbsp;rút gọn xuống còn hơn 30 cầu thủ. Do thời gian qua V-League không diễn ra, đồng nghĩa với việc HLV Park Hang Seo không thể đánh giá phong độ của các cầu thủ cũng như tìm kiếm nhân tố mới.</p><p>Vì thế, nhiều khả năng chiến lược gia người Hàn Quốc vẫn triệu tập những gương mặt cũ đã cùng mình tham dự vòng loại thứ 2 World Cup 2022 ở UAE vừa qua.</p>', N'<p>Sau khi rà soát, danh sách trên có thể được HLV&nbsp;<a href="https://dantri.com.vn/hlv-park-hang-seo.tag">Park Hang Seo</a>&nbsp;rút gọn xuống còn hơn 30 cầu thủ. Do thời gian qua V-League không diễn ra, đồng nghĩa với việc HLV Park Hang Seo không thể đánh giá phong độ của các cầu thủ cũng như tìm kiếm nhân tố mới.</p><p>Vì thế, nhiều khả năng chiến lược gia người Hàn Quốc vẫn triệu tập những gương mặt cũ đã cùng mình tham dự vòng loại thứ 2 World Cup 2022 ở UAE vừa qua.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/danhsachdtvndocx-1626516704681.jpeg" alt="HLV Park Hang Seo có danh sách sơ bộ đội tuyển Việt Nam - 1"></p><p>Nhấn để phóng to ảnh</p><p>Đội tuyển Việt Nam nhiều khả năng không có sự thay đổi về nhân sự.</p><p>Như vậy, những cái tên như Duy Mạnh, Quế Ngọc Hải, Bùi Tiến Dũng, Văn Thanh, Văn Hậu, Trọng Hoàng, Tuấn Anh, Xuân Trường, Quang Hải, Văn Toàn, Công Phượng, Tiến Linh… chắc chắn có tên. Ngoài ra, một số gương mặt trẻ hoặc ít được sử dụng như Việt Anh, Hai Long, Cao Văn Triền, Thanh Bình… cũng được HLV người Hàn Quốc tiếp tục trao cho cơ hội lên tuyển.</p><p>Với trường hợp của thủ thành Đặng Văn Lâm, nhiều khả năng&nbsp;<a href="https://dantri.com.vn/hlv-park-hang-seo.tag">HLV Park Hang Seo</a>&nbsp;sẽ triệu tập trong đợt tập trung lần này. Trước đó, đến phút cuối ông Park đã phải loại Đặng Văn Lâm ở chiến dịch vòng loại 2 World Cup 2022 khu vực châu Á, do thủ thành Việt Kiều là F1 của ca F0 Covid-19 tại Nhật Bản.</p><p>Trong thời gian qua, Đặng Văn Lâm đã thể hiện sự cố gắng để thể hiện mình tại Cerezo Osaka. Thủ thành Việt Nam đã có 2 lần được bắt chính trong trận Cerezo Osaka thắng 2-0 Gainare Tottori ở vòng 2 Cúp Hoàng Đế và mới đây là lượt trận thứ 5 AFC Champions League 2021, khi đội bóng Nhật Bản thắng 5-0 trước Guangzhou FC.</p><p><img src="https://icdn.dantri.com.vn/thumb_w/660/2021/07/17/danhsachdtvndocx-1626516704791.jpeg" alt="HLV Park Hang Seo có danh sách sơ bộ đội tuyển Việt Nam - 2"></p><p>Nhấn để phóng to ảnh</p><p>Văn Lâm sẽ trở lại đội tuyển Việt Nam.</p><p>"Mục tiêu của tôi thời gian tới vẫn là tiếp tục tập luyện chăm chỉ mỗi ngày, cố gắng học hỏi nhiều hơn nữa ở môi trường có tính chuyên nghiệp cao, gồm những cầu thủ đẳng cấp và các bài tập chất lượng của HLV thủ môn.</p><p>Tôi sẽ nỗ lực hết sức mình nếu có cơ hội tập trung cùng đội tuyển Việt Nam, cố gắng cống hiến những gì tốt nhất trong khả năng của bản thân", Đặng Văn Lâm mong muốn được trở lại đội tuyển Việt Nam.</p><p>Trước các trận vòng loại thứ 2 World Cup 2022 diễn ra ở UAE, Văn Lâm luôn là số 1 trong khung gỗ đội tuyển Việt Nam. Nhưng ở thời điểm này, anh chắc chắn phải cạnh tranh khốc liệt với Tấn Trường nếu muốn giành suất bắt chính.</p><p>Về công tác chuẩn bị cho vòng loại thứ 3 World Cup 2022 khu vực châu Á vào tháng 9 tới, VFF đang lên kế hoạch tập trung sớm cho đội tuyển Việt Nam. Mới đây, VPF tạm dừng kế hoạch tổ chức giai đoạn 2 V-League 2021 do ảnh hưởng dịch Covid-19. BTC giải thậm chí đề xuất lùi giải tới tháng 2/2022. VFF và ông Park vì vậy cũng phải điều chỉnh kế hoạch tập trung của đội tuyển Việt Nam.</p><p>"Yêu cầu đặt ra là các cầu thủ cần được đảm bảo điều kiện tốt nhất để duy trì thể lực cũng như phong độ, cảm giác bóng, qua đó chuẩn bị tốt nhất cho Vòng loại World Cup. Để đạt mục tiêu, kế hoạch của đội tuyển Việt Nam càng cụ thể, chi tiết càng tốt bởi khoảng cách các trận sân nhà và sân khách rất ngắn.</p><p>Nếu không chuẩn bị kỹ, chúng ta sẽ khó đảm bảo sự khoa học và hiệu quả", Phó Chủ tịch VFF Trần Quốc Tuấn cho biết.</p><p>HLV Park Hang Seo vừa qua đã trở về Hàn Quốc để lo việc gia đình. Dự kiến cuối tháng 7 này, ông Park sẽ trở về Việt Nam, và sẽ bắt tay vào công tác chuẩn bị cho đội tuyển.</p>', 1, N'133347663938673035_blog-article-1.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (6, 6, CAST(N'2023-08-08' AS Date), 30000000, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [Create], [Price], [Status]) VALUES (7, 6, CAST(N'2023-08-08' AS Date), 27000000, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetail] ON 

INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (10, 6, 10, 1, 22500000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (11, 7, 8, 1, 18900000)
SET IDENTITY_INSERT [dbo].[OrdersDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (1, N'tools_equipment_6', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347663472679669_digital_13.jpg', 1, 32000000, 80)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (4, N'tools_equipment_2', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347663373297900_digital_12.jpg', 1, 31000000, 70)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (5, N'kidtoy_08', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347663287293555_digital_11.jpg', 1, 30000000, 60)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (6, N'organics_spa_2', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347663189941485_digital_10.jpg', 1, 29000000, 50)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (7, N'kidtoy_07', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347663074460021_digital_09.jpg', 1, 28000000, 40)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (8, N'kidtoy_04', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347662965399532_digital_08.jpg', 1, 27000000, 30)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (9, N'kidtoy_03', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347662826095067_digital_07.jpg', 1, 26000000, 20)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (10, N'kidtoy_02', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347662679251440_digital_05.jpg', 1, 30000000, 25)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (12, N'kidtoy_01', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347662591515801_digital_04.jpg', 1, 30000000, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (14, N'furniture_08', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347662496222678_digital_03.jpg', 0, 30000000, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (16, N'furniture_07', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', N'133347662331329152_digital_02.jpg', 1, 30000000, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (17, N'tools_equipment_8@', N'<p>Lorem ipsum dolor sit amet, an munere tibique consequat mel, congue albucius no qui, a t everti meliore erroribus sea. ro cum. Sea ne accusata voluptatibus. Ne cum falli dolor voluptua, duo ei sonet choro facilisis, labores officiis torquatos cum ei.</p><p>Cum altera mandamus in, mea verear disputationi et. Vel regione discere ut, legere expetenda ut eos. In nam nibh invenire similique. Atqui mollis ea his, ius graecis accommodare te. No eam tota nostrum eque. Est cu nibh clita. Sed an nominavi, et stituto, duo id rebum lucilius. Te eam iisque deseruisse, ipsum euismod his at. Eu putent habemus voluptua sit, sit cu rationibus scripserit, modus taria .</p><p>experian soleat maluisset per. Has eu idque similique, et blandit scriptorem tatibus mea. Vis quaeque ocurreret ea.cu bus scripserit, modus voluptaria ex per.</p>', N'<p>Lorem ipsum dolor sit amet, an munere tibique consequat mel, congue albucius no qui, a t everti meliore erroribus sea. ro cum. Sea ne accusata voluptatibus. Ne cum falli dolor voluptua, duo ei sonet choro facilisis, labores officiis torquatos cum ei.</p><p>Cum altera mandamus in, mea verear disputationi et. Vel regione discere ut, legere expetenda ut eos. In nam nibh invenire similique. Atqui mollis ea his, ius graecis accommodare te. No eam tota nostrum eque. Est cu nibh clita. Sed an nominavi, et stituto, duo id rebum lucilius. Te eam iisque deseruisse, ipsum euismod his at. Eu putent habemus voluptua sit, sit cu rationibus scripserit, modus taria .</p><p>experian soleat maluisset per. Has eu idque similique, et blandit scriptorem tatibus mea. Vis quaeque ocurreret ea.cu bus scripserit, modus voluptaria ex per.</p>', N'133423653907068573_digital_01.jpg', 1, 30000000, 50)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Content], [Photo], [Hot], [Price], [Discount]) VALUES (18, N'test', N'', N'', N'133423666562467758_digital_01.jpg', 0, 1, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (13, 10, 5)
INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (14, 10, 5)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (1, N'Slide 1', N'133347667163565643_main-slider-1-3.jpg', N'Kid Smart Watches', N'Compra todos tus productos Smart por internet.', N'Info slide 1', N'http://dantri.com.vn')
INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (2, N'Slide 2', N'133347667081514630_main-slider-1-2.jpg', N'Title slide 2', N'Sub Title slide 2', N'Info slide 2', N'http://dantri.com.vn')
INSERT [dbo].[Slides] ([Id], [Name], [Photo], [Title], [SubTitle], [Info], [Link]) VALUES (3, N'Slide 3', N'133347666970334267_main-slider-1-1.jpg', N'Title slide 3', N'Sub Title slide 3', N'Info slide 3', N'http://dantri.com.vn')
SET IDENTITY_INSERT [dbo].[Slides] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'Fashion Clothings')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'Laptop Batteries')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'Printer & Ink')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4, N'CPUs & Prosecsors')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'Sound & Speaker')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (6, N'Shop Smartphone & Tablets')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[TagsProducts] ON 

INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (3, 1, 18)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (4, 4, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (5, 3, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (6, 2, 19)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (7, 4, 20)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (8, 2, 20)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (82, 4, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (83, 3, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (84, 2, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (85, 1, 16)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (86, 6, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (87, 5, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (88, 4, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (89, 3, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (90, 2, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (91, 1, 14)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (92, 6, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (93, 5, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (94, 4, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (95, 3, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (96, 2, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (97, 1, 12)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (98, 6, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (99, 5, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (100, 4, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (101, 3, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (102, 2, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (103, 1, 10)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (104, 4, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (105, 3, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (106, 2, 9)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (107, 3, 8)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (108, 2, 8)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (109, 1, 8)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (110, 4, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (111, 3, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (112, 2, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (113, 1, 7)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (114, 5, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (115, 4, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (116, 3, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (117, 2, 6)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (118, 6, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (119, 5, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (120, 4, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (121, 3, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (122, 2, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (123, 1, 5)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (124, 4, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (125, 3, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (126, 2, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (127, 1, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (128, 6, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (129, 5, 17)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (130, 5, 18)
SET IDENTITY_INSERT [dbo].[TagsProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (1, N'Nguyễn Văn A', N'nva@gmail.com', N'$2a$11$kgGE4CzaK5BblQCZn8yd3OChsGmAEDGHBWojzVM00Osl5.flLHfLm')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (2, N'Nguyễn Văn B', N'nvb@gmail.com', N'$2a$11$kgGE4CzaK5BblQCZn8yd3OChsGmAEDGHBWojzVM00Osl5.flLHfLm')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (3, N'Nguyễn Văn C', N'nvc@gmail.com', N'$2a$11$kgGE4CzaK5BblQCZn8yd3OChsGmAEDGHBWojzVM00Osl5.flLHfLm')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (4, N'Nguyễn Văn D', N'nvd@gmail.com', N'$2a$11$kgGE4CzaK5BblQCZn8yd3OChsGmAEDGHBWojzVM00Osl5.flLHfLm')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (5, N'Nguyễn Văn E', N'nve@gmail.com', N'$2a$11$kgGE4CzaK5BblQCZn8yd3OChsGmAEDGHBWojzVM00Osl5.flLHfLm')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (6, N'test', N'test@gmail.com', N'$2a$11$kgGE4CzaK5BblQCZn8yd3OChsGmAEDGHBWojzVM00Osl5.flLHfLm')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_DisplayHomePage]  DEFAULT ((0)) FOR [DisplayHomePage]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_news_hot]  DEFAULT ((0)) FOR [Hot]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discount_1]  DEFAULT ((0)) FOR [Discount]
GO
