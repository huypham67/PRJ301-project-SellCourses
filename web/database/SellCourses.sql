USE [master]
GO
/****** Object:  Database [SellCourses]    Script Date: 3/14/2024 4:28:48 PM ******/
CREATE DATABASE [SellCourses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SellCourses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SellCourses.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SellCourses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SellCourses_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SellCourses] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SellCourses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SellCourses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SellCourses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SellCourses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SellCourses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SellCourses] SET ARITHABORT OFF 
GO
ALTER DATABASE [SellCourses] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SellCourses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SellCourses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SellCourses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SellCourses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SellCourses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SellCourses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SellCourses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SellCourses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SellCourses] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SellCourses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SellCourses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SellCourses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SellCourses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SellCourses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SellCourses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SellCourses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SellCourses] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SellCourses] SET  MULTI_USER 
GO
ALTER DATABASE [SellCourses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SellCourses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SellCourses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SellCourses] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SellCourses] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SellCourses] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SellCourses] SET QUERY_STORE = ON
GO
ALTER DATABASE [SellCourses] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SellCourses]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/14/2024 4:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/14/2024 4:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[id] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[image] [ntext] NOT NULL,
	[description] [varchar](300) NOT NULL,
	[price] [money] NULL,
	[duration_month] [int] NULL,
	[cid] [int] NULL,
	[publicDate] [datetime] NULL,
	[discount] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/14/2024 4:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[courseId] [varchar](50) NOT NULL,
	[transactionId] [varchar](50) NOT NULL,
	[activationCode] [varchar](50) NULL,
	[endDate] [datetime] NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_OrdersId] PRIMARY KEY CLUSTERED 
(
	[courseId] ASC,
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/14/2024 4:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [varchar](50) NOT NULL,
	[userId] [int] NOT NULL,
	[date] [datetime] NULL,
	[totalPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/14/2024 4:28:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](200) NULL,
	[address] [nvarchar](200) NULL,
	[phoneNumber] [varchar](200) NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Web Development')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Data Science')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Mobile App Development')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Machine Learning')
INSERT [dbo].[Categories] ([id], [name]) VALUES (5, N'Game Development')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'DS101', N'Introduction to Data Analysis', N'images/5.png', N'Get started with data analysis using Python and Pandas library.', 69.9900, 6, 2, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'DS104', N'SQL for Data Science', N'images/6.png', N'Learn SQL basics and advanced queries for data manipulation and analysis.', 59.9900, 12, 2, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'DS105', N'Introduction to Statistics', N'images/7.png', N'Gain a solid understanding of statistical concepts for data analysis.', 39.9900, 24, 2, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'MD101', N'iOS App Development with Swift', N'images/8.png', N'Build iOS apps from scratch using Swift programming language and Xcode.', 89.9900, 36, 3, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'MD102', N'Android App Development with Kotlin', N'images/9.png', N'Learn Android app development using Kotlin programming language and Android Studio.', 79.9900, 12, 3, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'MD103', N'Cross-platform App Development', N'images/10.png', N'Develop apps that run on both iOS and Android platforms using frameworks like Flutter or React Native.', 99.9900, 6, 3, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'ML101', N'Introduction to Machine Learning', N'images/11.png', N'Get an overview of machine learning concepts, algorithms, and applications.', 79.9900, 12, 4, CAST(N'2024-03-08T16:57:52.110' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'ML102', N'Deep Learning Fundamentals', N'images/12.png', N'Learn the fundamentals of deep learning and neural networks.', 89.9900, 12, 4, CAST(N'2024-03-08T16:57:52.110' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'WD101', N'HTML & CSS Fundamentals', N'images/1.png', N'Learn the basics of HTML and CSS for web development.', 39.9900, 18, 1, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'WD102', N'JavaScript Basics', N'images/2.png', N'Get started with JavaScript and learn the basics of web development.', 49.9900, 12, 1, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'WD103', N'Full Stack Web Development', N'images/3.png', N'Become proficient in both front-end and back-end web development.', 99.9900, 18, 1, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[Courses] ([id], [name], [image], [description], [price], [duration_month], [cid], [publicDate], [discount]) VALUES (N'WD104', N'Responsive Web Design', N'images/4.png', N'Learn how to create responsive websites using HTML, CSS, and Bootstrap.', 59.9900, 24, 1, CAST(N'2024-03-03T01:06:00.510' AS DateTime), CAST(0.00 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [fullname], [address], [phoneNumber], [email], [password], [role]) VALUES (1, N'Phạm Đắc Nhật Huy', N'Quảng Nam', N'0941121748', N'huy@gmail.com', N'123', 1)
INSERT [dbo].[Users] ([id], [fullname], [address], [phoneNumber], [email], [password], [role]) VALUES (2, N'Ronaldo', N'Portugal', N'0123456789', N'ronaldo@gmail.com', N'123', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [duration_month]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_CategoryID] FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_CategoryID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_CourseId] FOREIGN KEY([courseId])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_CourseId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_TransactionId] FOREIGN KEY([transactionId])
REFERENCES [dbo].[Transactions] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_TransactionId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_id] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_id]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD CHECK  (([discount]>=(0)))
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [CK_Price] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [CK_Price]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [CK_TransactionTotalPrice] CHECK  (([totalPrice]>=(0)))
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [CK_TransactionTotalPrice]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([email] like '%@gmail.com'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
USE [master]
GO
ALTER DATABASE [SellCourses] SET  READ_WRITE 
GO
