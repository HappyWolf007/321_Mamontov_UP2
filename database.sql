USE [master]
GO
/****** Object:  Database [Mamontov_UP2]    Script Date: 19.12.2024 23:24:56 ******/
CREATE DATABASE [Mamontov_UP2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mamontov_UP2_Data', FILENAME = N'E:\Games\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mamontov_UP2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mamontov_UP2_Log', FILENAME = N'E:\Games\MSSQL15.MSSQLSERVER\MSSQL\DATA\Mamontov_UP2.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Mamontov_UP2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mamontov_UP2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mamontov_UP2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mamontov_UP2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mamontov_UP2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mamontov_UP2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mamontov_UP2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Mamontov_UP2] SET  MULTI_USER 
GO
ALTER DATABASE [Mamontov_UP2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mamontov_UP2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mamontov_UP2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mamontov_UP2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mamontov_UP2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Mamontov_UP2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mamontov_UP2', N'ON'
GO
ALTER DATABASE [Mamontov_UP2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Mamontov_UP2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Mamontov_UP2]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 19.12.2024 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_type]    Script Date: 19.12.2024 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](200) NULL,
	[procent_of_brak] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Material_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_product]    Script Date: 19.12.2024 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[partner_id] [int] NULL,
	[quantity_of_products] [int] NULL,
	[sale_date] [date] NULL,
 CONSTRAINT [PK_Partner_product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 19.12.2024 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](10) NULL,
	[company_name] [nvarchar](255) NULL,
	[director_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[legal_address] [nvarchar](255) NULL,
	[inn] [nvarchar](10) NULL,
	[rating] [float] NULL,
 CONSTRAINT [PK__Partners__3214EC27F4FB4FB0] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2024 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[type_id] [int] NULL,
	[name] [nvarchar](190) NULL,
	[articul] [int] NULL,
	[minPrice] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 19.12.2024 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](100) NULL,
	[koef_of_type] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19.12.2024 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [first_name], [last_name], [email], [role_id]) VALUES (1, N'Денис', N'Мамонтов', N'123@mail.ru', 1)
INSERT [dbo].[Employee] ([ID], [first_name], [last_name], [email], [role_id]) VALUES (2, N'Екатерина', N'Япрынцева', N'321@mail.ru', 2)
INSERT [dbo].[Employee] ([ID], [first_name], [last_name], [email], [role_id]) VALUES (3, N'Павел', N'Петрович', N'1@mail.ru', 3)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Material_type] ON 

INSERT [dbo].[Material_type] ([ID], [type], [procent_of_brak]) VALUES (1, N'Тип материала 1', CAST(0.10 AS Decimal(10, 2)))
INSERT [dbo].[Material_type] ([ID], [type], [procent_of_brak]) VALUES (2, N'Тип материала 2', CAST(0.95 AS Decimal(10, 2)))
INSERT [dbo].[Material_type] ([ID], [type], [procent_of_brak]) VALUES (3, N'Тип материала 3', CAST(0.28 AS Decimal(10, 2)))
INSERT [dbo].[Material_type] ([ID], [type], [procent_of_brak]) VALUES (4, N'Тип материала 4', CAST(0.55 AS Decimal(10, 2)))
INSERT [dbo].[Material_type] ([ID], [type], [procent_of_brak]) VALUES (5, N'Тип материала 5', CAST(0.34 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Material_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner_product] ON 

INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[Partner_product] ([ID], [product_id], [partner_id], [quantity_of_products], [sale_date]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[Partner_product] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([ID], [type], [company_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (1, N'ООО', N'База Строитель', N'Иванова Александра Ивановна', N'aleksandraivanova@ml.ru', N'+79687158466', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179', 5)
INSERT [dbo].[Partners] ([ID], [type], [company_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (2, N'ООО', N'Паркет 29', N'Петров Василий Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520', 7)
INSERT [dbo].[Partners] ([ID], [type], [company_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (3, N'ПАО', N'Стройсервис', N'Соловьев Андрей Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035', 7)
INSERT [dbo].[Partners] ([ID], [type], [company_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (4, N'ОАО', N'Ремонт и отделка', N'Воробьева Екатерина Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', 5)
INSERT [dbo].[Partners] ([ID], [type], [company_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (5, N'ЗАО', N'МонтажПро', N'Степанов Степан Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309501, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140', 10)
INSERT [dbo].[Partners] ([ID], [type], [company_name], [director_name], [email], [phone], [legal_address], [inn], [rating]) VALUES (6, N'ООО', N'123', N'Япрынцев Николай', N'123@mail.com', N'+79687158466', N'Москва', N'1235434434', 5)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [type_id], [name], [articul], [minPrice]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, 4456.9)
INSERT [dbo].[Product] ([ID], [type_id], [name], [articul], [minPrice]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, 7330.99)
INSERT [dbo].[Product] ([ID], [type_id], [name], [articul], [minPrice]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, 1799.33)
INSERT [dbo].[Product] ([ID], [type_id], [name], [articul], [minPrice]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, 3890.41)
INSERT [dbo].[Product] ([ID], [type_id], [name], [articul], [minPrice]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, 5450.59)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_type] ON 

INSERT [dbo].[Product_type] ([ID], [type], [koef_of_type]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(10, 2)))
INSERT [dbo].[Product_type] ([ID], [type], [koef_of_type]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(10, 2)))
INSERT [dbo].[Product_type] ([ID], [type], [koef_of_type]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(10, 2)))
INSERT [dbo].[Product_type] ([ID], [type], [koef_of_type]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Roles] ([ID], [name]) VALUES (2, N'Пользователь')
INSERT [dbo].[Roles] ([ID], [name]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Roles]
GO
ALTER TABLE [dbo].[Partner_product]  WITH CHECK ADD  CONSTRAINT [FK_Partner_product_Partners] FOREIGN KEY([partner_id])
REFERENCES [dbo].[Partners] ([ID])
GO
ALTER TABLE [dbo].[Partner_product] CHECK CONSTRAINT [FK_Partner_product_Partners]
GO
ALTER TABLE [dbo].[Partner_product]  WITH CHECK ADD  CONSTRAINT [FK_Partner_product_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Partner_product] CHECK CONSTRAINT [FK_Partner_product_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[Product_type] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_type]
GO
USE [master]
GO
ALTER DATABASE [Mamontov_UP2] SET  READ_WRITE 
GO
