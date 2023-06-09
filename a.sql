USE [Tourism]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Starts] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel_Comment]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel_Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Hotelid] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_Hotel_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Hotelid] [int] NOT NULL,
	[source] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoteltour]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoteltour](
	[hotel] [int] NOT NULL,
	[tour] [int] NOT NULL,
 CONSTRAINT [PK_hoteltour] PRIMARY KEY CLUSTERED 
(
	[hotel] ASC,
	[tour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsOpen] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[Descr] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typetour]    Script Date: 07.04.2023 16:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typetour](
	[tour] [int] NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_typetour] PRIMARY KEY CLUSTERED 
(
	[tour] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[Hotel_Comment]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Comment_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Hotel_Comment] CHECK CONSTRAINT [FK_Hotel_Comment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[hoteltour]  WITH CHECK ADD  CONSTRAINT [FK_hoteltour_Hotel] FOREIGN KEY([hotel])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[hoteltour] CHECK CONSTRAINT [FK_hoteltour_Hotel]
GO
ALTER TABLE [dbo].[hoteltour]  WITH CHECK ADD  CONSTRAINT [FK_hoteltour_Tour] FOREIGN KEY([tour])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[hoteltour] CHECK CONSTRAINT [FK_hoteltour_Tour]
GO
ALTER TABLE [dbo].[typetour]  WITH CHECK ADD  CONSTRAINT [FK_typetour_Tour] FOREIGN KEY([tour])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[typetour] CHECK CONSTRAINT [FK_typetour_Tour]
GO
ALTER TABLE [dbo].[typetour]  WITH CHECK ADD  CONSTRAINT [FK_typetour_Type] FOREIGN KEY([type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[typetour] CHECK CONSTRAINT [FK_typetour_Type]
GO
