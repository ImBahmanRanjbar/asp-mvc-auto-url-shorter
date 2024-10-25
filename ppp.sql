USE [master]
GO
/****** Object:  Database [LinkShorter]    Script Date: 04/08/1403 23:46:54 ******/
CREATE DATABASE [LinkShorter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LinkShorter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LinkShorter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LinkShorter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LinkShorter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LinkShorter] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LinkShorter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LinkShorter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LinkShorter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LinkShorter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LinkShorter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LinkShorter] SET ARITHABORT OFF 
GO
ALTER DATABASE [LinkShorter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LinkShorter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LinkShorter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LinkShorter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LinkShorter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LinkShorter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LinkShorter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LinkShorter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LinkShorter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LinkShorter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LinkShorter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LinkShorter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LinkShorter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LinkShorter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LinkShorter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LinkShorter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LinkShorter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LinkShorter] SET RECOVERY FULL 
GO
ALTER DATABASE [LinkShorter] SET  MULTI_USER 
GO
ALTER DATABASE [LinkShorter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LinkShorter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LinkShorter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LinkShorter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LinkShorter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LinkShorter] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LinkShorter', N'ON'
GO
ALTER DATABASE [LinkShorter] SET QUERY_STORE = OFF
GO
USE [LinkShorter]
GO
/****** Object:  Table [dbo].[Tbl_Links]    Script Date: 04/08/1403 23:46:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Links](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Link] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_Links] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Tbl_Links] UNIQUE NONCLUSTERED 
(
	[Link] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_News]    Script Date: 04/08/1403 23:46:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[LongLink] [nvarchar](50) NOT NULL,
	[ShortLink] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Tbl_News] UNIQUE NONCLUSTERED 
(
	[ShortLink] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Tbl_News_1] UNIQUE NONCLUSTERED 
(
	[LongLink] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Links] ADD  CONSTRAINT [DF_Tbl_Links_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tbl_News]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_News_Tbl_Links] FOREIGN KEY([ShortLink])
REFERENCES [dbo].[Tbl_Links] ([ID])
GO
ALTER TABLE [dbo].[Tbl_News] CHECK CONSTRAINT [FK_Tbl_News_Tbl_Links]
GO
USE [master]
GO
ALTER DATABASE [LinkShorter] SET  READ_WRITE 
GO
