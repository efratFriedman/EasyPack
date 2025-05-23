USE [master]
GO
/****** Object:  Database [EasyPack]    Script Date: 25/03/2025 8:50:39 ******/
CREATE DATABASE [EasyPack]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EasyPack', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EasyPack.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EasyPack_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EasyPack_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EasyPack] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EasyPack].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EasyPack] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EasyPack] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EasyPack] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EasyPack] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EasyPack] SET ARITHABORT OFF 
GO
ALTER DATABASE [EasyPack] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EasyPack] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EasyPack] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EasyPack] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EasyPack] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EasyPack] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EasyPack] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EasyPack] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EasyPack] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EasyPack] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EasyPack] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EasyPack] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EasyPack] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EasyPack] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EasyPack] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EasyPack] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EasyPack] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EasyPack] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EasyPack] SET  MULTI_USER 
GO
ALTER DATABASE [EasyPack] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EasyPack] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EasyPack] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EasyPack] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EasyPack] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EasyPack] SET QUERY_STORE = OFF
GO
USE [EasyPack]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25/03/2025 8:50:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boxes]    Script Date: 25/03/2025 8:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boxes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [nvarchar](max) NULL,
	[Capacity] [float] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_Boxes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 25/03/2025 8:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 25/03/2025 8:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Capacity] [float] NOT NULL,
	[BoxId] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 25/03/2025 8:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[NumOfBoxes] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/03/2025 8:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250302124824_createDB', N'8.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250310090545_MakeBoxIdNullable', N'8.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250310094545_MakeFieldNullable', N'8.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250310133559_NULLAble', N'8.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250311141758_removeFiledINItem', N'8.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250311164201_addForiegnKey', N'8.0.13')
GO
SET IDENTITY_INSERT [dbo].[Boxes] ON 

INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (146, NULL, 13083.3203125, 104)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (147, NULL, 54207.6640625, 104)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (148, NULL, 31948.8359375, 104)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (149, NULL, 153580.21875, 104)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (150, NULL, 13083.3203125, 105)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (151, NULL, 54207.6640625, 105)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (152, NULL, 31948.8359375, 105)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (153, NULL, 153580.21875, 105)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (154, NULL, 13083.3203125, 107)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (155, NULL, 54207.6640625, 107)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (156, NULL, 31948.8359375, 107)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (157, NULL, 153580.21875, 107)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (158, NULL, 13083.3203125, 108)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (159, NULL, 54207.6640625, 108)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (160, NULL, 31948.8359375, 108)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (161, NULL, 153580.21875, 108)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (162, NULL, 2627.02734375, 109)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (163, NULL, 3245.015625, 109)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (164, NULL, 19750.93359375, 109)
INSERT [dbo].[Boxes] ([Id], [Contents], [Capacity], [RoomId]) VALUES (165, NULL, 41874.921875, 109)
SET IDENTITY_INSERT [dbo].[Boxes] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Living Room')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Bedroom')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Kitchen')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Office')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Garage')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Custom Room
')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1288, N'teddy bear', 526897.0625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1289, N'teddy bear', 166688.375, 146, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1290, N'teddy bear', 312882, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1291, N'teddy bear', 169946.859375, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1292, N'potted plant', 53259.37890625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1293, N'couch', 1716570, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1294, N'teddy bear', 73001.3046875, 146, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1295, N'teddy bear', 93934.2578125, 147, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1296, N'teddy bear', 104631.078125, 147, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1297, N'bottle', 58911.1640625, 148, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1298, N'book', 63540.4609375, 148, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1299, N'teddy bear', 98372.5390625, 148, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1300, N'teddy bear', 58922.3984375, 149, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1301, N'vase', 40270.3828125, 149, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1302, N'teddy bear', 526897.0625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1303, N'teddy bear', 166688.375, 150, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1304, N'teddy bear', 312882, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1305, N'teddy bear', 169946.859375, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1306, N'potted plant', 53259.37890625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1307, N'couch', 1716570, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1308, N'teddy bear', 73001.3046875, 150, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1309, N'teddy bear', 93934.2578125, 151, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1310, N'teddy bear', 104631.078125, 151, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1311, N'bottle', 58911.1640625, 152, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1312, N'book', 63540.4609375, 152, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1313, N'teddy bear', 98372.5390625, 152, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1314, N'teddy bear', 58922.3984375, 153, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1315, N'vase', 40270.3828125, 153, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1316, N'teddy bear', 526897.0625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1317, N'teddy bear', 166688.375, 154, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1318, N'teddy bear', 312882, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1319, N'teddy bear', 169946.859375, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1320, N'potted plant', 53259.37890625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1321, N'couch', 1716570, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1322, N'teddy bear', 73001.3046875, 154, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1323, N'teddy bear', 93934.2578125, 155, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1324, N'teddy bear', 104631.078125, 155, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1325, N'bottle', 58911.1640625, 156, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1326, N'book', 63540.4609375, 156, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1327, N'teddy bear', 98372.5390625, 156, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1328, N'teddy bear', 58922.3984375, 157, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1329, N'vase', 40270.3828125, 157, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1330, N'teddy bear', 526897.0625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1331, N'teddy bear', 166688.375, 158, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1332, N'teddy bear', 312882, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1333, N'teddy bear', 169946.859375, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1334, N'potted plant', 53259.37890625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1335, N'couch', 1716570, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1336, N'teddy bear', 73001.3046875, 158, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1337, N'teddy bear', 93934.2578125, 159, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1338, N'teddy bear', 104631.078125, 159, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1339, N'bottle', 58911.1640625, 160, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1340, N'book', 63540.4609375, 160, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1341, N'teddy bear', 98372.5390625, 160, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1342, N'teddy bear', 58922.3984375, 161, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1343, N'vase', 40270.3828125, 161, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1344, N'potted plant', 259319.234375, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1345, N'chair', 1991732.125, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1346, N'potted plant', 62922.47265625, 162, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1347, N'chair', 1084086.75, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1348, N'book', 115957.125, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1349, N'laptop', 249543.78125, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1350, N'book', 85686.921875, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1351, N'book', 71911.3984375, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1352, N'book', 75883.375, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1353, N'tv', 250982, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1354, N'book', 59450.5, 162, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1355, N'book', 78304.765625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1356, N'book', 170834.515625, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1357, N'book', 71360.8203125, 164, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1358, N'potted plant', 25124.04296875, NULL, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1359, N'vase', 33888.24609375, 164, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1360, N'book', 61349.41015625, 163, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1361, N'book', 60405.57421875, 163, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1362, N'book', 33978.1328125, 165, NULL)
INSERT [dbo].[Items] ([Id], [Name], [Capacity], [BoxId], [CategoryId]) VALUES (1363, N'vase', 49146.9453125, 165, NULL)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Name], [NumOfBoxes], [UserId]) VALUES (104, N'children room', 5, 9)
INSERT [dbo].[Rooms] ([Id], [Name], [NumOfBoxes], [UserId]) VALUES (105, N'fgvbhnjn', 5, 9)
INSERT [dbo].[Rooms] ([Id], [Name], [NumOfBoxes], [UserId]) VALUES (106, N'vbh nj', 0, 9)
INSERT [dbo].[Rooms] ([Id], [Name], [NumOfBoxes], [UserId]) VALUES (107, N'hbjnjk', 5, 10)
INSERT [dbo].[Rooms] ([Id], [Name], [NumOfBoxes], [UserId]) VALUES (108, N'jchjc', 5, 11)
INSERT [dbo].[Rooms] ([Id], [Name], [NumOfBoxes], [UserId]) VALUES (109, N'gfgh', 5, 11)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (1, N'ק', N'ef@gmail.com', N'$2a$11$G95EmLHwS9x.pif2I0VTxue4XodkGjuNlv8N86SjvOkSojmS26nSC', N'string')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (2, N'esti', N'es@gmail.com', N'$2a$11$nD3dFiW/YSRmmdFbjNJIC.KcaabOJ8lR2RAeiM5HiBz4fw7BGzM9G', N'אחד העם 8')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (3, N'efrat friedman', N'fra@gmail.com', N'$2a$11$7MyV9sS3I09D3qQus3UgDec0921fHoKw9LyKMePDi3y66ehDy2gum', N'rdtgfhujnko')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (4, N'esty', N'st@gmail.com', N'#St12345', N'string')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (5, N'ef', N'd@gmail.com', N'$2a$11$XqKxytaljuwKwlIHk/ZYaeQ6izPB4FV3piuVHAtzLunBuTQS6QruS', N'rdtgfhujnko')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (6, N'try', N'try@gmail.com', N'$2a$11$wvmgfBGGLKU8cBpqgaL0QehPWzi3S8OPQ04IcbO8ro5.9BlFrhYJW', N'string')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (7, N'try', N'try1@gmail.com', N'$2a$11$zRygETYRwx8pL..q3nIqqOodbfxtNVIBR0wwHqPDxYwfYNZMP3BPa', N'string')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (8, N'tryone', N'try12@gmail.com', N'$2a$11$dCIsRam9xzFFoMSRsivDg.fFUUGnKOytg.mRvsgPsNVpU6uynwqfC', N'string')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (9, N'tryonetwo', N'try123@gmail.com', N'$2a$11$fusosJyLxTQsU5jftdyWguidObARV8NOxkwiNwwDPPl7REWbjYDha', N'string')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (10, N'rina', N'rina@gmail.com', N'$2a$11$EaHPtc2q7N6vSi8za1j2LuiXbkIhy3KWrZITvNV./QYiaquX5MHsy', N'string')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Address]) VALUES (11, N'tovi', N'tovi@gmail.com', N'$2a$11$uDL7yWqsbSzVjfETjH14He4DGu.g1GiUeYm.rfYadpcwRu2VFYgoy', N'bgyhg')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Boxes_RoomId]    Script Date: 25/03/2025 8:50:40 ******/
CREATE NONCLUSTERED INDEX [IX_Boxes_RoomId] ON [dbo].[Boxes]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Items_BoxId]    Script Date: 25/03/2025 8:50:40 ******/
CREATE NONCLUSTERED INDEX [IX_Items_BoxId] ON [dbo].[Items]
(
	[BoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Items_CategoryId]    Script Date: 25/03/2025 8:50:40 ******/
CREATE NONCLUSTERED INDEX [IX_Items_CategoryId] ON [dbo].[Items]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_UserId]    Script Date: 25/03/2025 8:50:40 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_UserId] ON [dbo].[Rooms]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Boxes]  WITH CHECK ADD  CONSTRAINT [FK_Boxes_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Boxes] CHECK CONSTRAINT [FK_Boxes_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Boxes_BoxId] FOREIGN KEY([BoxId])
REFERENCES [dbo].[Boxes] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Boxes_BoxId]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [EasyPack] SET  READ_WRITE 
GO
