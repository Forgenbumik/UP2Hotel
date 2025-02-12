USE [master]
GO
/****** Object:  Database [УП2]    Script Date: 26.01.2025 16:06:50 ******/
CREATE DATABASE [УП2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'УП2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\УП2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'УП2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\УП2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [УП2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [УП2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [УП2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [УП2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [УП2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [УП2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [УП2] SET ARITHABORT OFF 
GO
ALTER DATABASE [УП2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [УП2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [УП2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [УП2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [УП2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [УП2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [УП2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [УП2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [УП2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [УП2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [УП2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [УП2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [УП2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [УП2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [УП2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [УП2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [УП2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [УП2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [УП2] SET  MULTI_USER 
GO
ALTER DATABASE [УП2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [УП2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [УП2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [УП2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [УП2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [УП2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [УП2] SET QUERY_STORE = ON
GO
ALTER DATABASE [УП2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [УП2]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[CheckInDate] [date] NOT NULL,
	[CheckOutDate] [date] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cleaning]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cleaning](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NULL,
	[EmployeeID] [int] NULL,
	[CleaningDate] [date] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_Cleaning] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CleaningStatuses]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CleaningStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_CleaningStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[DocumentInfo] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Guests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsServices]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GuestID] [int] NULL,
	[ServiceID] [int] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_ClientsServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[Amount] [int] NULL,
	[PaymentDate] [date] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[ID] [int] NOT NULL,
	[Floor] [int] NULL,
	[TypeID] [int] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomStatuses]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_RoomStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](60) NULL,
	[PricePerNight] [int] NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 26.01.2025 16:06:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](350) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (1, 1, 101, CAST(N'2025-02-14' AS Date), CAST(N'2025-03-02' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (2, 2, 102, CAST(N'2025-02-28' AS Date), CAST(N'2025-03-02' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (3, 3, 103, CAST(N'2025-02-23' AS Date), CAST(N'2025-02-02' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (4, 4, 104, CAST(N'2025-03-01' AS Date), CAST(N'2025-03-07' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (5, 5, 105, CAST(N'2025-02-27' AS Date), CAST(N'2025-04-22' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (6, 6, 107, CAST(N'2025-02-24' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (7, 7, 107, CAST(N'2025-02-15' AS Date), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (8, 8, 108, CAST(N'2025-02-27' AS Date), CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (9, 9, 110, CAST(N'2025-02-14' AS Date), CAST(N'0205-02-02' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (10, 10, 201, CAST(N'2025-02-24' AS Date), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (11, 11, 203, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-07' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (12, 12, 205, CAST(N'2025-03-01' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (13, 13, 206, CAST(N'2025-02-02' AS Date), CAST(N'2025-02-02' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (14, 14, 207, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (15, 15, 208, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (16, 16, 209, CAST(N'2025-02-27' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (17, 17, 304, CAST(N'2025-02-28' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Bookings] ([ID], [ClientID], [RoomID], [CheckInDate], [CheckOutDate]) VALUES (18, 18, 306, CAST(N'2025-02-11' AS Date), CAST(N'2025-02-15' AS Date))
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[CleaningStatuses] ON 

INSERT [dbo].[CleaningStatuses] ([ID], [Name]) VALUES (1, N'Назначено')
INSERT [dbo].[CleaningStatuses] ([ID], [Name]) VALUES (2, N'Выполнено')
SET IDENTITY_INSERT [dbo].[CleaningStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (1, N'Шевченко', N'Ольга', N'Викторовна', N'1234', N'5678', CAST(N'2001-01-01' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (2, N'Мазалова', N'Ирина', N'Львовна', N'5678', N'9012', CAST(N'2002-02-02' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (3, N'Семеняка', N'Юрий', N'Геннадьевич', N'9012', N'3456', CAST(N'2003-03-03' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (4, N'Савельев', N'Олег', N'Иванович', N'3456', N'7890', CAST(N'2004-04-04' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (5, N'Бунин', N'Эдуард', N'Михайлович', N'7890', N'1234', CAST(N'2005-05-05' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (6, N'Бахшиев', N'Павел', N'Иннокентьевич', N'4321', N'8765', CAST(N'2006-05-06' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (7, N'Тюренкова', N'Наталья', N'Сергеевна', N'8765', N'2109', CAST(N'2007-07-07' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (8, N'Любяшева', N'Галина', N'Аркадьевна', N'2109', N'6543', CAST(N'2001-02-01' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (9, N'Александров', N'Петр', N'Константинович', N'6543', N'0987', CAST(N'2002-03-02' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (10, N'Мазалова', N'Ольга', N'Николаевна', N'0987', N'4321', CAST(N'2003-04-03' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (11, N'Лапшин', N'Виктор', N'Романович', N'3412', N'7856', CAST(N'2004-05-04' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (12, N'Гусев', N'Семен', N'Петрович', N'7856', N'1290', CAST(N'2005-06-05' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (13, N'Гладилина', N'Вера', N'Михайловна', N'1290', N'5634', CAST(N'2006-07-06' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (14, N'Масюк', N'Динара', N'Викторовна', N'5634', N'9078', CAST(N'2007-08-07' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (15, N'Лукин', N'Илья', N'Федорович', N'9078', N'3412', CAST(N'2001-03-01' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (16, N'Петров', N'Станислав', N'Игоревич', N'2143', N'6587', CAST(N'2002-04-02' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (17, N'Филь', N'Марина', N'Федоровна', N'6587', N'0921', CAST(N'2003-05-03' AS Date))
INSERT [dbo].[Clients] ([ID], [Surname], [FirstName], [LastName], [PhoneNumber], [DocumentInfo], [BirthDate]) VALUES (18, N'Михайлов', N'Игорь', N'Вадимович', N'0921', N'4365', CAST(N'2004-06-04' AS Date))
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (101, 1, 1, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (102, 1, 1, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (103, 1, 2, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (104, 1, 2, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (105, 1, 3, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (106, 1, 3, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (107, 1, 4, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (108, 1, 4, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (109, 1, 5, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (110, 1, 5, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (201, 2, 6, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (202, 2, 6, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (203, 2, 6, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (204, 2, 7, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (205, 2, 7, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (206, 2, 7, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (207, 2, 1, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (208, 2, 1, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (209, 2, 1, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (301, 3, 8, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (302, 3, 8, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (303, 3, 8, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (304, 3, 9, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (305, 3, 9, NULL)
INSERT [dbo].[Rooms] ([ID], [Floor], [TypeID], [StatusID]) VALUES (306, 3, 9, NULL)
GO
SET IDENTITY_INSERT [dbo].[RoomStatuses] ON 

INSERT [dbo].[RoomStatuses] ([ID], [Name]) VALUES (1, N'Занят')
INSERT [dbo].[RoomStatuses] ([ID], [Name]) VALUES (2, N'Грязный')
INSERT [dbo].[RoomStatuses] ([ID], [Name]) VALUES (3, N'Назначен к уборке')
INSERT [dbo].[RoomStatuses] ([ID], [Name]) VALUES (4, N'Чистый')
SET IDENTITY_INSERT [dbo].[RoomStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (1, N'Одноместный стандарт', 2520)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (2, N'Одноместный эконом', 2250)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (3, N'Стандарт двухместный с 2 раздельными кроватями', 2970)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (4, N'Эконом двухместный с 2 раздельными кроватями', 2700)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (5, N'3-местный бюджет', 3150)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (6, N'Бизнес с 1 или 2 кроватями', 3780)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (7, N'Двухкомнатный двухместный стандарт с 1 или 2 кроватями', 3600)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (8, N'Студия', 4050)
INSERT [dbo].[RoomTypes] ([ID], [TypeName], [PricePerNight]) VALUES (9, N'Люкс с 2 двуспальными кроватями', 4500)
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (2, N'Дополнительный завтрак', 750, N'Ресторан отеля предлагает большой
выбор блюд традиционной европейской
кухни. Горячие и холодные закуски,
гарниры и основные блюда, а также
салаты и десерты. Система «шведский
стол»')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (3, N'Дополнительный ужин', 1100, N'Все гости нашего отеля при заселении
получают возможность питаться в
ресторане отеля по системе «шведский
стол», но за дополнительную плату
заказывают дополнительный ужин в
отеле.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (4, N'Зал для конференций
(большой)', 5500, N'Большой конференц-зал находится на
втором этаже гостиницы. Здесь имеется
небольшой подиум для выступающих,
рассадка –театр. Имеется естественное
освещение, также предусмотрены
жалюзи для затемнения.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (5, N'Зал для конференций
(малый)', 3500, N'Малый конференц-зал представляет
собой небольшое помещение со строгим
офисным дизайном, оборудованное
мобильной мебелью (столы, стулья,
трибуна) и современной техникой.
Имеется естественное освещение, также
предусмотрены жалюзи для затемнения.
Зал находится на первом этаже
гостиницы и вмещает до 25 человек.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (6, N'Бизнес центр ', 400, N'К услугам гостей аренда компьютера с
доступом в интернет, сканер, принтер.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (7, N'Прачечная', 0, N'Мы предлагаем своим гостям услуги
современной прачечной.
У нас вы можете заказать все виды услуг
прачечной, связанные с машинной
стиркой.
Мы выстираем, высушим, отгладим и
доставим в номер.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (8, N'Банкетный зал', 2500, N'Рядом с конференц-залом расположен
банкетный зал, где Вам помогут
организовать кофе-паузу или фуршет.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (9, N'Тренажерный зал', 0, N'Расположен на одиннадцатом этаже
гостиницы. Для проживающих в
гостинице посещение тренажерного зала
бесплатно.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (10, N'Парковка', 750, N'Для удобства наших гостей, возле
центрального входа расположена
охраняемая парковка.')
INSERT [dbo].[Services] ([ID], [Name], [Price], [Description]) VALUES (11, N'Камера хранения', 50, N'В гостинице работает круглосуточная
камера хранения.')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Guests] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Guests]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([ID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Rooms]
GO
ALTER TABLE [dbo].[Cleaning]  WITH CHECK ADD  CONSTRAINT [FK_Cleaning_CleaningStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[CleaningStatuses] ([ID])
GO
ALTER TABLE [dbo].[Cleaning] CHECK CONSTRAINT [FK_Cleaning_CleaningStatuses]
GO
ALTER TABLE [dbo].[Cleaning]  WITH CHECK ADD  CONSTRAINT [FK_Cleaning_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Cleaning] CHECK CONSTRAINT [FK_Cleaning_Employees]
GO
ALTER TABLE [dbo].[Cleaning]  WITH CHECK ADD  CONSTRAINT [FK_Cleaning_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([ID])
GO
ALTER TABLE [dbo].[Cleaning] CHECK CONSTRAINT [FK_Cleaning_Rooms]
GO
ALTER TABLE [dbo].[ClientsServices]  WITH CHECK ADD  CONSTRAINT [FK_ClientsServices_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[ClientsServices] CHECK CONSTRAINT [FK_ClientsServices_Employees]
GO
ALTER TABLE [dbo].[ClientsServices]  WITH CHECK ADD  CONSTRAINT [FK_ClientsServices_Guests] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[ClientsServices] CHECK CONSTRAINT [FK_ClientsServices_Guests]
GO
ALTER TABLE [dbo].[ClientsServices]  WITH CHECK ADD  CONSTRAINT [FK_ClientsServices_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[ClientsServices] CHECK CONSTRAINT [FK_ClientsServices_Services]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Bookings] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Bookings]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[RoomStatuses] ([ID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomStatuses]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[RoomTypes] ([ID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes]
GO
USE [master]
GO
ALTER DATABASE [УП2] SET  READ_WRITE 
GO
