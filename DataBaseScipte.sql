USE [master]
GO
/****** Object:  Database [ITDB]    Script Date: 11/16/2019 9:18:24 AM ******/
CREATE DATABASE [ITDB]
 CONTAINMENT = NONE
 ON  PRIMARY 

( NAME = N'ITDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ITDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ITDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ITDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ITDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ITDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ITDB] SET  MULTI_USER 
GO
ALTER DATABASE [ITDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ITDB]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 11/16/2019 9:18:24 AM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\LOCAL SERVICE]    Script Date: 11/16/2019 9:18:24 AM ******/
CREATE USER [NT AUTHORITY\LOCAL SERVICE] FOR LOGIN [NT AUTHORITY\LOCAL SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\LOCAL SERVICE]
GO
/****** Object:  Table [dbo].[absenceTb]    Script Date: 11/16/2019 9:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absenceTb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfDay] [date] NULL,
	[EmployeeName] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DailyLogTb]    Script Date: 11/16/2019 9:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyLogTb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfDay] [date] NOT NULL,
	[Satement] [nvarchar](max) NOT NULL,
	[Dayofweekid] [int] NULL,
 CONSTRAINT [PK__DailyLog__3214EC07CE355EC8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayofWeak]    Script Date: 11/16/2019 9:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayofWeak](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Day] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderTb]    Script Date: 11/16/2019 9:18:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderTb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderN] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[Day] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[absenceTb] ON 

GO
INSERT [dbo].[absenceTb] ([id], [DateOfDay], [EmployeeName], [Type], [Description]) VALUES (1, CAST(0x2A400B00 AS Date), N'الحسين احمد حسن ', N'اجازة', N'بسبب وجود امتحان')
GO
INSERT [dbo].[absenceTb] ([id], [DateOfDay], [EmployeeName], [Type], [Description]) VALUES (2, CAST(0x35400B00 AS Date), N'Nessreen', N'اجازة', N'naughty girl')
GO
INSERT [dbo].[absenceTb] ([id], [DateOfDay], [EmployeeName], [Type], [Description]) VALUES (3, CAST(0x38400B00 AS Date), N'محمد أحمد سعد', N'أجازة', NULL)
GO
INSERT [dbo].[absenceTb] ([id], [DateOfDay], [EmployeeName], [Type], [Description]) VALUES (1003, CAST(0x46400B00 AS Date), N'محمود مجدى ', N'غياب', N'غياب محمود')
GO
INSERT [dbo].[absenceTb] ([id], [DateOfDay], [EmployeeName], [Type], [Description]) VALUES (1004, CAST(0x4E400B00 AS Date), N'امير مصطفي', N'اجازة', NULL)
GO
INSERT [dbo].[absenceTb] ([id], [DateOfDay], [EmployeeName], [Type], [Description]) VALUES (3003, CAST(0x4E400B00 AS Date), N'f', N'f', N'f')
GO
SET IDENTITY_INSERT [dbo].[absenceTb] OFF
GO
SET IDENTITY_INSERT [dbo].[DailyLogTb] ON 

GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2007, CAST(0x38400B00 AS Date), N'1-تواجد مسئول الصيانة ', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2008, CAST(0x38400B00 AS Date), N'متابعة أعمال التنسيق', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2009, CAST(0x38400B00 AS Date), N'تنزيل Soft wear لجهاز عبد الله', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2011, CAST(0x38400B00 AS Date), N'تنزيل للاجهزة الجديدة الخاصة بالمعامل software', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2012, CAST(0x39400B00 AS Date), N'أجازة رسمية بمناسبة أعياد 6 أكتوبر كل عام وانتم بخير', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2015, CAST(0x3A400B00 AS Date), N'1- تواجد مسئول الصيانة ', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2016, CAST(0x3A400B00 AS Date), N'متابعة أعمال التنسيق', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2017, CAST(0x3A400B00 AS Date), N' تنزيل Software لأجهزة المعامل الجديدة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2020, CAST(0x3B400B00 AS Date), N'متابعة أعمال التنسيق', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2021, CAST(0x3B400B00 AS Date), N'تواجد مسئول الصيانة', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2022, CAST(0x3B400B00 AS Date), N'التقدم للمشاريع بالدور الرابع', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2023, CAST(0x3C400B00 AS Date), N'تواجد مسئول الصيانة', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2024, CAST(0x3C400B00 AS Date), N'متابعة أعمال التنسيق', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (2025, CAST(0x3C400B00 AS Date), N'متابعة تقديم المشاريع بالدور الرابع', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3008, CAST(0x3C400B00 AS Date), N'تنزيل لجهاز معمل (3 )software', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3009, CAST(0x3F400B00 AS Date), N'1-تواجد مسئول الصيانة', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3010, CAST(0x3F400B00 AS Date), N'2-متابعة اعمال التنسيق', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3011, CAST(0x3F400B00 AS Date), N'3-متابعة تقديم المشاريع بالدور الرابع', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3012, CAST(0x41400B00 AS Date), N'تواجد مسئول الصيانة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3013, CAST(0x41400B00 AS Date), N'متابعة أعمال التنسيق', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3014, CAST(0x41400B00 AS Date), N'متابعة تسجيل المشاريع بالدور الرابعه', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3015, CAST(0x41400B00 AS Date), N'تواجد مسئول الصيانة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3016, CAST(0x41400B00 AS Date), N'متابعة أعمال التنسيق', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3017, CAST(0x41400B00 AS Date), N'تسجيل المشاريع بالدور الرابع', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3018, CAST(0x41400B00 AS Date), N'تعريف الطابعة فى حاسبات سياحة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3019, CAST(0x41400B00 AS Date), N'تشغيل شاشة الكاميرات عند مدير الأمن', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3020, CAST(0x42400B00 AS Date), N'1-تواجد مسئول الصيانة
', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3021, CAST(0x42400B00 AS Date), N'2-متابعة اعمال التنسيق', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3022, CAST(0x42400B00 AS Date), N'3-تسجيل المشاريع بالدور الرابع', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3023, CAST(0x43400B00 AS Date), N'تواجد مسئول الصيانة', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3024, CAST(0x43400B00 AS Date), N'متابعة أعمال التنسيق', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3025, CAST(0x43400B00 AS Date), N'طباعة ملفات التنسيق من الموقع لشئون الطلبة حايب', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3026, CAST(0x46400B00 AS Date), N'تواجد مسئول الصيانة', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3027, CAST(0x46400B00 AS Date), N'متابعة أعمال التنسيق', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3028, CAST(0x46400B00 AS Date), N'غياب محمود', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3029, CAST(0x46400B00 AS Date), N'طباعة ملفات التنسيقف من الموقع لشئون طلبة سياحة', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3030, CAST(0x47400B00 AS Date), N'تواجد مسئول الصيانة', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3031, CAST(0x47400B00 AS Date), N'تسجيل أسماء الطلبة في المشاريع', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3033, CAST(0x47400B00 AS Date), N'تغير حبر لجهاز أنور شئون طلبة سياحة', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3034, CAST(0x48400B00 AS Date), N'تواجد مسئول الصيانة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3035, CAST(0x48400B00 AS Date), N'متابعة أعمال التنسيق', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3036, CAST(0x48400B00 AS Date), N'تشغيل جهاز وبروجيكتور فى قاعة 310 سياحة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3037, CAST(0x49400B00 AS Date), N'تواجد مسئول الصيانة', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3039, CAST(0x49400B00 AS Date), N'متابعة أعمال التنسيق', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3040, CAST(0x49400B00 AS Date), N'تسجيل اسماء الطلبة فى المشاريع بالدور الرابع ', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3041, CAST(0x49400B00 AS Date), N'نقل الــ Data من جهاز ايمان القديم للجهاز الجديد', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3042, CAST(0x49400B00 AS Date), N'تعريف الـ Printerعلى جهاز محمد شئون طلبة حاسب', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3043, CAST(0x4A400B00 AS Date), N'تواجد مسئول الصيانة', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3044, CAST(0x4A400B00 AS Date), N'تسجيل أسماء طلبة المشاريع بالدور الرابع', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3045, CAST(0x4A400B00 AS Date), N'تنزيل Software لجهاز لإيمان القديم شئون طلبة حاسب ونسليمة لـ محمد شئون طلبة حاسب', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3046, CAST(0x4A400B00 AS Date), N'تعريف الـ Printer على جهاز ايمان شئون طلبة حاسب وربطها محمود وجهاز مصطفى', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3047, CAST(0x4A400B00 AS Date), N'تنزيل Googel chrome على جهاز اسلام شئون طلبة سياحة', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3048, CAST(0x4D400B00 AS Date), N'تواجد مسئول الصيانة', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3051, CAST(0x4D400B00 AS Date), N'متابعة التسجيل فى المشاريع بالدور الرابع', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3052, CAST(0x4D400B00 AS Date), N'تعديل في برامج معامل (1، 2، 3، 4)', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3053, CAST(0x4E400B00 AS Date), N'2-نقل ملفات الي مكتب عميد سياحة
office ', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3054, CAST(0x4E400B00 AS Date), N'3-توصيل البروجيكتور لقاعة (407) لدكتور رحاب .', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3055, CAST(0x4E400B00 AS Date), N'تنزيل برنامج vlc لحسابات سياحة ', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3056, CAST(0x4F400B00 AS Date), N'تواجد مسئول الصيانة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3057, CAST(0x4F400B00 AS Date), N'متابعة تسجيل المشاريع بالدور الرابع', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3058, CAST(0x4F400B00 AS Date), N'طباعة أوراق التنسيق', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (3059, CAST(0x4E400B00 AS Date), N'أمير أجازة', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4032, CAST(0x50400B00 AS Date), N'تواجد مسئول الصيانة', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4033, CAST(0x50400B00 AS Date), N'متابعة أعمال التنسيق', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4034, CAST(0x50400B00 AS Date), N'تغير شبكة الـ Network لشئون الطلبة حاسب', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4035, CAST(0x50400B00 AS Date), N'تعريف مكنة التصوير والبرنتر على أجهزة إيمان - محمد -مصطفى وربطها بمكنة التصوير شئون طلبة حاسب', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4036, CAST(0x51400B00 AS Date), N'تواجد مسئول الصيانة', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4037, CAST(0x51400B00 AS Date), N'متابعة أعمال التنسيق', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4038, CAST(0x51400B00 AS Date), N'تنزيل Software لجهاز بمعمل (2)', 5)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4046, CAST(0x54400B00 AS Date), N'تواجد مسئول الصيانة', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4047, CAST(0x54400B00 AS Date), N'طباعة أوراق الترشيح', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4048, CAST(0x54400B00 AS Date), N'طباعة أوراق المشاريع', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4049, CAST(0x54400B00 AS Date), N'كتابة كشف بأسماء الدكاترة والمشاريع وطباعتها', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4050, CAST(0x54400B00 AS Date), N'توصيل سماعات بجهاز الماستر بعمل (7)', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4051, CAST(0x54400B00 AS Date), N'تغير Mouse محمد شعيب ', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (4052, CAST(0x55400B00 AS Date), N'تواجد ميئول الصيانة', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5049, CAST(0x5D400B00 AS Date), N'تواجد مسئول الصيانة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5050, CAST(0x56400B00 AS Date), N'طباعة ورق الترشيح للتنسيق', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5051, CAST(0x57400B00 AS Date), N'تواجد مسئول الصيانة ', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5052, CAST(0x57400B00 AS Date), N'متابعة تسجيل المشاريع', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5053, CAST(0x5B400B00 AS Date), N'أجازة رسمية بمناسبة المولد النهبوي الشريف', 1)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5054, CAST(0x5C400B00 AS Date), N'تواجد مسئول الصيانة', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5055, CAST(0x5C400B00 AS Date), N'متابعة التسجيل فى المشاريع', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (5056, CAST(0x5C400B00 AS Date), N'إقامة محاضرة اسنرشادية بمعمل (8) ', 2)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (6049, CAST(0x5D400B00 AS Date), N'تواجد مسئول الصيانة', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (6050, CAST(0x5D400B00 AS Date), N'متابعة تسجيل بيانات الترشيح', 3)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (6051, CAST(0x5E400B00 AS Date), N'تواجد مسئول الصيانة', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (6052, CAST(0x5E400B00 AS Date), N'متابعة تسجيل بيانات المشاريع
', 4)
GO
INSERT [dbo].[DailyLogTb] ([Id], [DateOfDay], [Satement], [Dayofweekid]) VALUES (6053, CAST(0x5E400B00 AS Date), N'تعريف printer بشئون الطلبة سياحة وربطها بالشبكة', 4)
GO
SET IDENTITY_INSERT [dbo].[DailyLogTb] OFF
GO
SET IDENTITY_INSERT [dbo].[DayofWeak] ON 

GO
INSERT [dbo].[DayofWeak] ([ID], [Day]) VALUES (1, N'السبت')
GO
INSERT [dbo].[DayofWeak] ([ID], [Day]) VALUES (2, N'الأحد')
GO
INSERT [dbo].[DayofWeak] ([ID], [Day]) VALUES (3, N'الاثنين ')
GO
INSERT [dbo].[DayofWeak] ([ID], [Day]) VALUES (4, N'الثلاثاء ')
GO
INSERT [dbo].[DayofWeak] ([ID], [Day]) VALUES (5, N'الأربعاء ')
GO
INSERT [dbo].[DayofWeak] ([ID], [Day]) VALUES (6, N'الخميس ')
GO
INSERT [dbo].[DayofWeak] ([ID], [Day]) VALUES (7, N'الجمعة ')
GO
SET IDENTITY_INSERT [dbo].[DayofWeak] OFF
GO
SET IDENTITY_INSERT [dbo].[orderTb] ON 

GO
INSERT [dbo].[orderTb] ([id], [OrderN], [quantity], [Day]) VALUES (1, N'HP g5 i5 5400', 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[orderTb] OFF
GO
ALTER TABLE [dbo].[DailyLogTb]  WITH CHECK ADD  CONSTRAINT [FK_PersonOrder] FOREIGN KEY([Dayofweekid])
REFERENCES [dbo].[DayofWeak] ([ID])
GO
ALTER TABLE [dbo].[DailyLogTb] CHECK CONSTRAINT [FK_PersonOrder]
GO
USE [master]
GO
ALTER DATABASE [ITDB] SET  READ_WRITE 
GO
