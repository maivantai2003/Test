USE [master]
GO
/****** Object:  Database [ExTwo]    Script Date: 3/22/2025 11:33:37 AM ******/
CREATE DATABASE [ExTwo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExTwo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\ExTwo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExTwo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\ExTwo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExTwo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExTwo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExTwo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExTwo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExTwo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExTwo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExTwo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExTwo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExTwo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExTwo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExTwo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExTwo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExTwo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExTwo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExTwo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExTwo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExTwo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExTwo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExTwo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExTwo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExTwo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExTwo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExTwo] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ExTwo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExTwo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExTwo] SET  MULTI_USER 
GO
ALTER DATABASE [ExTwo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExTwo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExTwo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExTwo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExTwo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExTwo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExTwo] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExTwo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExTwo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/22/2025 11:33:37 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplexOrderReportViewModel]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplexOrderReportViewModel](
	[OrderID] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[ShipmentDate] [datetime2](7) NULL,
	[DeliveryStatus] [nvarchar](max) NULL,
	[OrderStatus] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelTests]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelTests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_modelTests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[ShipmentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ShipmentDate] [datetime2](7) NOT NULL,
	[DeliveryStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderID]    Script Date: 3/22/2025 11:33:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderID] ON [dbo].[OrderItems]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_ProductID]    Script Date: 3/22/2025 11:33:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_ProductID] ON [dbo].[OrderItems]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CustomerID]    Script Date: 3/22/2025 11:33:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerID] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipments_OrderID]    Script Date: 3/22/2025 11:33:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_Shipments_OrderID] ON [dbo].[Shipments]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerID]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Orders_OrderID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplexOrderReport]    Script Date: 3/22/2025 11:33:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetComplexOrderReport]
    @StartDate DATE,
    @EndDate DATE,
    @CustomerID INT = NULL,
    @MinAmount DECIMAL(18,2) = NULL,
    @MaxAmount DECIMAL(18,2) = NULL,
    @OrderStatus VARCHAR(50) = NULL,
    @ShipmentStatus VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON
	SELECT
	     o.OrderID,o.OrderDate,c.Name AS CustomerName,
		 SUM(oi.Quantity*oi.Price) AS TotalAmount,SUM(oi.Quantity) AS TotalQuantity,
		 s.ShipmentDate,s.DeliveryStatus,o.Status AS OrderStatus
	FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
	LEFT JOIN Shipments s ON o.OrderID = s.OrderID
	WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
        AND (@CustomerID IS NULL OR o.CustomerID = @CustomerID)
        AND (@MinAmount IS NULL OR (SELECT SUM(oi.Quantity * oi.Price) FROM OrderItems oi WHERE oi.OrderID = o.OrderID) >= @MinAmount)
        AND (@MaxAmount IS NULL OR (SELECT SUM(oi.Quantity * oi.Price) FROM OrderItems oi WHERE oi.OrderID = o.OrderID) <= @MaxAmount)
        AND (@OrderStatus IS NULL OR o.Status = @OrderStatus)
        AND (@ShipmentStatus IS NULL OR s.DeliveryStatus = @ShipmentStatus)
    GROUP BY o.OrderID, o.OrderDate, c.Name, s.ShipmentDate, s.DeliveryStatus, o.Status;
END;
GO
USE [master]
GO
ALTER DATABASE [ExTwo] SET  READ_WRITE 
GO
