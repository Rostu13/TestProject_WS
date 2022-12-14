USE [master]
GO
/****** Object:  Database [EKB2015]    Script Date: 17.08.2022 23:27:26 ******/
CREATE DATABASE [EKB2015]
 CONTAINMENT = NONE
GO
ALTER DATABASE [EKB2015] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EKB2015].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EKB2015] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EKB2015] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EKB2015] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EKB2015] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EKB2015] SET ARITHABORT OFF 
GO
ALTER DATABASE [EKB2015] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EKB2015] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EKB2015] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EKB2015] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EKB2015] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EKB2015] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EKB2015] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EKB2015] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EKB2015] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EKB2015] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EKB2015] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EKB2015] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EKB2015] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EKB2015] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EKB2015] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EKB2015] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EKB2015] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EKB2015] SET RECOVERY FULL 
GO
ALTER DATABASE [EKB2015] SET  MULTI_USER 
GO
ALTER DATABASE [EKB2015] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EKB2015] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EKB2015] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EKB2015] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EKB2015] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EKB2015] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EKB2015', N'ON'
GO
ALTER DATABASE [EKB2015] SET QUERY_STORE = OFF
GO
USE [EKB2015]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17.08.2022 23:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Categories_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 17.08.2022 23:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[date] [date] NOT NULL,
	[id_category] [int] NOT NULL,
	[id_type] [int] NOT NULL,
	[count] [int] NOT NULL,
	[price] [decimal](14, 2) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentsType]    Script Date: 17.08.2022 23:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentsType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_PaymentsType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.08.2022 23:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[login] [nvarchar](128) NOT NULL,
	[password] [nvarchar](512) NOT NULL,
	[first_name] [nvarchar](128) NOT NULL,
	[last_name] [nvarchar](128) NOT NULL,
	[patronymic] [nvarchar](128) NOT NULL,
	[pincode] [char](10) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Коммунальные платежи')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Автомобиль')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Питание и быт')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Медицина')
INSERT [dbo].[Categories] ([id], [name]) VALUES (5, N'Разное')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (1, 10, CAST(N'2015-03-01' AS Date), 1, 1, 1, CAST(2964.58 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (2, 10, CAST(N'2015-03-01' AS Date), 1, 2, 1, CAST(450.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (3, 10, CAST(N'2015-03-01' AS Date), 1, 3, 1, CAST(170.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (4, 20, CAST(N'2015-03-01' AS Date), 1, 4, 1, CAST(300.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (5, 30, CAST(N'2015-03-01' AS Date), 1, 5, 1, CAST(184.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (6, 40, CAST(N'2015-03-01' AS Date), 1, 6, 1, CAST(3120.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (7, 10, CAST(N'2015-03-01' AS Date), 1, 7, 1, CAST(16.41 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (8, 20, CAST(N'2015-03-01' AS Date), 2, 8, 1, CAST(5000.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (9, 30, CAST(N'2015-03-30' AS Date), 2, 9, 1, CAST(2238.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (10, 40, CAST(N'2015-03-01' AS Date), 3, 10, 1, CAST(45.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (11, 10, CAST(N'2015-03-02' AS Date), 3, 11, 1, CAST(15.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (12, 20, CAST(N'2015-03-03' AS Date), 3, 12, 1, CAST(40.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (13, 30, CAST(N'2015-03-04' AS Date), 3, 13, 1, CAST(159.20 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (14, 40, CAST(N'2015-03-05' AS Date), 3, 14, 1, CAST(240.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (15, 10, CAST(N'2015-03-06' AS Date), 3, 15, 1, CAST(94.96 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (16, 20, CAST(N'2015-03-07' AS Date), 3, 16, 2, CAST(35.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (17, 30, CAST(N'2015-03-08' AS Date), 3, 17, 1, CAST(82.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (18, 40, CAST(N'2015-03-09' AS Date), 3, 18, 1, CAST(119.93 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (19, 10, CAST(N'2015-03-10' AS Date), 3, 18, 1, CAST(127.66 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (20, 20, CAST(N'2015-03-11' AS Date), 3, 13, 1, CAST(258.84 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (21, 30, CAST(N'2015-03-12' AS Date), 3, 13, 1, CAST(213.31 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (22, 40, CAST(N'2015-03-13' AS Date), 3, 13, 1, CAST(137.18 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (23, 10, CAST(N'2015-03-14' AS Date), 3, 13, 1, CAST(127.82 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (24, 20, CAST(N'2015-03-15' AS Date), 3, 13, 1, CAST(195.39 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (25, 30, CAST(N'2015-03-16' AS Date), 3, 19, 1, CAST(3726.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (26, 40, CAST(N'2015-03-17' AS Date), 3, 19, 1, CAST(2484.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (27, 10, CAST(N'2015-03-18' AS Date), 3, 20, 1, CAST(33.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (28, 20, CAST(N'2015-03-19' AS Date), 3, 13, 1, CAST(144.75 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (29, 30, CAST(N'2015-03-20' AS Date), 3, 13, 1, CAST(138.73 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (30, 40, CAST(N'2015-03-21' AS Date), 3, 13, 1, CAST(24.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (31, 10, CAST(N'2015-03-22' AS Date), 3, 13, 1, CAST(261.21 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (32, 20, CAST(N'2015-03-23' AS Date), 3, 18, 1, CAST(19.42 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (33, 30, CAST(N'2015-03-24' AS Date), 3, 13, 1, CAST(80.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (34, 40, CAST(N'2015-03-25' AS Date), 3, 18, 1, CAST(58.86 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (35, 10, CAST(N'2015-03-26' AS Date), 3, 13, 1, CAST(82.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (36, 20, CAST(N'2015-03-27' AS Date), 3, 13, 1, CAST(81.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (37, 30, CAST(N'2015-03-01' AS Date), 4, 21, 1, CAST(450.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (38, 40, CAST(N'2015-03-03' AS Date), 4, 21, 1, CAST(400.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (39, 10, CAST(N'2015-03-05' AS Date), 4, 21, 1, CAST(330.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (40, 20, CAST(N'2015-03-07' AS Date), 4, 22, 1, CAST(455.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (41, 30, CAST(N'2015-03-09' AS Date), 4, 23, 1, CAST(280.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (42, 40, CAST(N'2015-03-11' AS Date), 4, 21, 1, CAST(220.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (43, 10, CAST(N'2015-03-13' AS Date), 4, 24, 1, CAST(20.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (44, 20, CAST(N'2015-03-15' AS Date), 4, 25, 1, CAST(449.50 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (45, 30, CAST(N'2015-03-17' AS Date), 4, 26, 1, CAST(202.40 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (46, 40, CAST(N'2015-03-19' AS Date), 4, 21, 1, CAST(800.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (47, 10, CAST(N'2015-03-21' AS Date), 4, 21, 1, CAST(400.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (48, 20, CAST(N'2015-03-23' AS Date), 4, 23, 1, CAST(1740.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (49, 30, CAST(N'2015-03-25' AS Date), 4, 27, 1, CAST(152.50 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (50, 40, CAST(N'2015-03-27' AS Date), 4, 28, 1, CAST(3500.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (51, 10, CAST(N'2015-03-01' AS Date), 5, 29, 1, CAST(699.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (52, 20, CAST(N'2015-03-04' AS Date), 5, 30, 1, CAST(933.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (53, 30, CAST(N'2015-03-07' AS Date), 5, 31, 1, CAST(550.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (54, 40, CAST(N'2015-03-10' AS Date), 5, 32, 1, CAST(150.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (55, 10, CAST(N'2015-03-13' AS Date), 5, 33, 1, CAST(2871.84 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (56, 20, CAST(N'2015-03-16' AS Date), 5, 34, 1, CAST(1040.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (57, 30, CAST(N'2015-03-19' AS Date), 5, 35, 1, CAST(165.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (58, 40, CAST(N'2015-03-22' AS Date), 5, 36, 1, CAST(120.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (59, 10, CAST(N'2015-03-25' AS Date), 5, 37, 2, CAST(500.00 AS Decimal(14, 2)))
INSERT [dbo].[Payments] ([id], [id_user], [date], [id_category], [id_type], [count], [price]) VALUES (60, 10, CAST(N'2022-08-17' AS Date), 2, 38, 3, CAST(22.00 AS Decimal(14, 2)))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentsType] ON 

INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (1, N'Квартплата')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (2, N'Интернет')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (3, N'Телефон')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (4, N'Мобильный')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (5, N'Электроэнергия')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (6, N'Газоснабжение')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (7, N'Водоснабжение')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (8, N'Взнос за гараж')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (9, N'Бензин')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (10, N'Сметана')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (11, N'Томатный сок')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (12, N'Губка для обуви')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (13, N'Еда')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (14, N'Булочки и тесто')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (15, N'Творог и сметана')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (16, N'Семечки')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (17, N'Хачапури и морс')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (18, N'Столовая')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (19, N'Гипермаркет')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (20, N'Макароны')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (21, N'Прием врача')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (22, N'ЭКГ')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (23, N'Анализы')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (24, N'Контейнер для анализов')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (25, N'Наринэ')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (26, N'Магнелис')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (27, N'Термометр для ванн')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (28, N'Юниспорт')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (29, N'Туфли')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (30, N'Диски, кейс, стяжки')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (31, N'Маникюр')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (32, N'Ушивание брюк')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (33, N'Одежда')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (34, N'Плавательный набор')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (35, N'CD')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (36, N'Маркеры')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (37, N'Сбор на кафедру')
INSERT [dbo].[PaymentsType] ([id], [name]) VALUES (38, N'Автомобиль целый :)')
SET IDENTITY_INSERT [dbo].[PaymentsType] OFF
GO
INSERT [dbo].[Users] ([id], [login], [password], [first_name], [last_name], [patronymic], [pincode]) VALUES (10, N'Boico', N'aut_aliasg', N'Бойко', N'Игорь', N'Петрович', N'6039      ')
INSERT [dbo].[Users] ([id], [login], [password], [first_name], [last_name], [patronymic], [pincode]) VALUES (20, N'Vasilenco', N'qwerty', N'Василенко', N'Василий', N'Александрович', N'8797      ')
INSERT [dbo].[Users] ([id], [login], [password], [first_name], [last_name], [patronymic], [pincode]) VALUES (30, N'Konteenco', N'placeat1972l', N'Контеенко', N'Дмитрий', N'Семенович', N'0961      ')
INSERT [dbo].[Users] ([id], [login], [password], [first_name], [last_name], [patronymic], [pincode]) VALUES (40, N'Lazarkov', N'equam442', N'Лазарьков', N'Петр', N'Михайлович', N'4842      ')
INSERT [dbo].[Users] ([id], [login], [password], [first_name], [last_name], [patronymic], [pincode]) VALUES (50, N'Kuznetsov', N'libero%88f', N'Кузнецов', N'Василий', N'Семенович', N'8720      ')
INSERT [dbo].[Users] ([id], [login], [password], [first_name], [last_name], [patronymic], [pincode]) VALUES (60, N'Test', N'12345', N'Дорофеева', N'Анна', N'Геннадьевна', N'9812      ')
INSERT [dbo].[Users] ([id], [login], [password], [first_name], [last_name], [patronymic], [pincode]) VALUES (70, N'Ann', N'porro_autu', N'Прокопьева', N'Елена', N'Петровна', N'9553      ')
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Categories] FOREIGN KEY([id_category])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Categories]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentsType] FOREIGN KEY([id_type])
REFERENCES [dbo].[PaymentsType] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentsType]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Users]
GO
USE [master]
GO
ALTER DATABASE [EKB2015] SET  READ_WRITE 
GO
