USE [master]
GO
/****** Object:  Database [ExOne]    Script Date: 3/22/2025 11:31:48 AM ******/
CREATE DATABASE [ExOne]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExOne', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\ExOne.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExOne_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\ExOne_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExOne] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExOne].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExOne] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExOne] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExOne] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExOne] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExOne] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExOne] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExOne] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExOne] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExOne] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExOne] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExOne] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExOne] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExOne] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExOne] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExOne] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExOne] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExOne] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExOne] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExOne] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExOne] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExOne] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ExOne] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExOne] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExOne] SET  MULTI_USER 
GO
ALTER DATABASE [ExOne] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExOne] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExOne] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExOne] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExOne] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExOne] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExOne] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExOne] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExOne]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/22/2025 11:31:48 AM ******/
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
/****** Object:  Table [dbo].[Authors]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Bio] [nvarchar](500) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[PublishedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksViewModel]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksViewModel](
	[BookId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PublishedDate] [datetime2](7) NULL,
	[AuthorId] [int] NOT NULL,
	[AuthorName] [nvarchar](max) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelTests]    Script Date: 3/22/2025 11:31:48 AM ******/
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
/****** Object:  Index [IX_Books_AuthorId]    Script Date: 3/22/2025 11:31:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Books_AuthorId] ON [dbo].[Books]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors_AuthorId]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAuthor]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[sp_DeleteAuthor]
   @AuthorId INT
AS
BEGIN
   DELETE FROM Authors WHERE AuthorId = @AuthorId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBook]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteBook]
  @BookId INT,
  @RowsAffected INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Books WHERE BookId = @BookId;
    SET @RowsAffected = @@ROWCOUNT; -- Gán số dòng bị xóa
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAuthors]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[sp_GetAllAuthors]
AS
BEGIN
  SELECT * FROM Authors;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllBooks]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllBooks]
AS
BEGIN
    SELECT b.BookId, b.Title, b.Price, b.PublishedDate, 
           a.AuthorId, a.Name AS AuthorName, a.Bio
    FROM Books b
    JOIN Authors a ON b.AuthorId = a.AuthorId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAuthorById]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy Author theo Id
CREATE PROCEDURE [dbo].[sp_GetAuthorById]
  @AuthorId INT
AS
BEGIN
  SELECT * FROM Authors WHERE AuthorId = @AuthorId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookById]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetBookById]
    @BookId INT
AS
BEGIN
    SELECT b.BookId, b.Title, b.Price, b.PublishedDate, 
           a.AuthorId, a.Name AS AuthorName, a.Bio
    FROM Books b
    JOIN Authors a ON b.AuthorId = a.AuthorId
    WHERE b.BookId = @BookId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredBooks]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetFilteredBooks]
   @searchKey NVARCHAR(200) = NULL,
   @authorId INT = NULL,
   @fromPublishedDate DATETIME = NULL,
   @toPublishedDate DATETIME = NULL,
   @pageSize INT,
   @pageIndex INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Offset INT = (@pageIndex - 1) * @pageSize;

    SELECT 
        b.BookId, 
        b.Title, 
        b.Price, 
        b.AuthorId, 
        a.Name AS AuthorName,  
        a.Bio, -- ✅ THÊM CỘT Bio
        b.PublishedDate
    FROM Books b
    JOIN Authors a ON b.AuthorId = a.AuthorId
    WHERE (@searchKey IS NULL OR b.Title LIKE '%' + @searchKey + '%')
        AND (@authorId IS NULL OR b.AuthorId = @authorId)
        AND (@fromPublishedDate IS NULL OR b.PublishedDate >= @fromPublishedDate)
        AND (@toPublishedDate IS NULL OR b.PublishedDate <= @toPublishedDate)
    ORDER BY b.PublishedDate DESC
    OFFSET @Offset ROWS FETCH NEXT @pageSize ROWS ONLY;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAuthor]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAuthor]
    @Name NVARCHAR(100),
    @Bio NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @InsertedAuthors TABLE (AuthorId INT, Name NVARCHAR(100), Bio NVARCHAR(500));

    INSERT INTO Authors (Name, Bio)
    OUTPUT INSERTED.AuthorId, INSERTED.Name, INSERTED.Bio INTO @InsertedAuthors
    VALUES (@Name, @Bio);

    SELECT * FROM @InsertedAuthors;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertBook]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertBook]
    @Title NVARCHAR(200),
    @Price DECIMAL(10,2),
    @AuthorId INT,
    @PublishedDate DATETIME,
    @NewBookId INT OUTPUT
AS
BEGIN
    INSERT INTO Books (Title, Price, AuthorId, PublishedDate)
    VALUES (@Title, @Price, @AuthorId, @PublishedDate);

    SET @NewBookId = SCOPE_IDENTITY();
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAuthor]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateAuthor]
   @AuthorId INT,
   @Name NVARCHAR(100),
   @Bio NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Authors
    SET Name = @Name, Bio = @Bio
    WHERE AuthorId = @AuthorId;
    SELECT AuthorId, Name, Bio FROM Authors WHERE AuthorId = @AuthorId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBook]    Script Date: 3/22/2025 11:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateBook]
    @BookId INT,
    @Title NVARCHAR(200),
    @Price DECIMAL(10,2),
    @AuthorId INT,
    @PublishedDate DATETIME,
    @UpdatedBookId INT OUTPUT
AS
BEGIN
    UPDATE Books
    SET Title = @Title,
        Price = @Price,
        AuthorId = @AuthorId,
        PublishedDate = @PublishedDate
    WHERE BookId = @BookId;

    -- Trả về ID của sách được cập nhật
    SET @UpdatedBookId = @BookId;
END;
GO
USE [master]
GO
ALTER DATABASE [ExOne] SET  READ_WRITE 
GO
