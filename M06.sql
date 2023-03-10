USE [master]
GO
/****** Object:  Database [M06]    Script Date: 13.12.2022 14:45:11 ******/
CREATE DATABASE [M06]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'M06', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\M06.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'M06_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\M06_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [M06] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [M06].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [M06] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [M06] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [M06] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [M06] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [M06] SET ARITHABORT OFF 
GO
ALTER DATABASE [M06] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [M06] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [M06] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [M06] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [M06] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [M06] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [M06] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [M06] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [M06] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [M06] SET  DISABLE_BROKER 
GO
ALTER DATABASE [M06] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [M06] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [M06] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [M06] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [M06] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [M06] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [M06] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [M06] SET RECOVERY FULL 
GO
ALTER DATABASE [M06] SET  MULTI_USER 
GO
ALTER DATABASE [M06] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [M06] SET DB_CHAINING OFF 
GO
ALTER DATABASE [M06] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [M06] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [M06] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [M06] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [M06] SET QUERY_STORE = OFF
GO
USE [M06]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_isaret]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_isaret](@sayi int)
returns int
as begin
if(@sayi<0)
return -1
if(@sayi=0)
return 0
return 1
End
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Maas]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_Maas](@maas int, @prim int)
returns int
as begin
declare @Sonuc int
set @Sonuc=@maas*@prim/100
return @Sonuc
end
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Tambolme]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_Tambolme](@s1 int,@s2 int)
returns varchar(10)
as begin
declare @mesajver varchar(10)
if(@s1%@s2=0)
set @mesajver='Bölünür'
else
set @mesajver='Bölünmez'
return @mesajver
End
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ToplaCarp]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function  [dbo].[fn_ToplaCarp](@X int,@Y int)
returns int
as begin
declare @Toplam int 
set @Toplam=@X+@Y 
return @Toplam
end 
GO
/****** Object:  UserDefinedFunction [dbo].[fnYasHesapla]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fnYasHesapla](@DogumTarihi smalldatetime)
returns int
as begin
declare @Yas int
set @Yas=datediff(year,@DogumTarihi,getdate())
return @Yas
end
GO
/****** Object:  Table [dbo].[Araçlar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Araçlar](
	[AracNo] [int] IDENTITY(1,1) NOT NULL,
	[AracFiyat] [int] NULL,
	[AracAdet] [int] NULL,
	[AracMarka] [varchar](50) NULL,
	[AracModel] [varchar](50) NULL,
	[AracYıl] [varchar](50) NULL,
	[AracÖzellik] [varchar](50) NULL,
	[AracMotor] [varchar](50) NULL,
	[AracPaket] [varchar](50) NULL,
	[AracRenk] [varchar](50) NULL,
	[SubeNo] [int] NULL,
 CONSTRAINT [PK_Araçlar] PRIMARY KEY CLUSTERED 
(
	[AracNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bankalar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bankalar](
	[BankaNo] [int] NOT NULL,
	[BankaAdi] [varchar](50) NULL,
	[VergiNo] [int] NULL,
 CONSTRAINT [PK_Bankalar] PRIMARY KEY CLUSTERED 
(
	[BankaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calisanlar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisanlar](
	[CalisanNo] [int] IDENTITY(1,1) NOT NULL,
	[CalisanAdSoyad] [varchar](50) NULL,
	[KullaniciAd] [varchar](50) NOT NULL,
	[Sifre] [varchar](50) NULL,
	[KutuphaneNo] [int] NULL,
 CONSTRAINT [PK_Calisanlar_KullanıcıAd] PRIMARY KEY CLUSTERED 
(
	[KullaniciAd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ceyizSet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ceyizSet](
	[malno] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](max) NOT NULL,
	[fiyat] [int] NOT NULL,
 CONSTRAINT [PK_ceyizSet] PRIMARY KEY CLUSTERED 
(
	[malno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CKullanici]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CKullanici](
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Sifre] [varchar](20) NOT NULL,
	[Mail] [varchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CKullanici_1] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMusteriler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMusteriler](
	[MusteriNo] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdSoyad] [varchar](50) NULL,
	[MusteriTelefon] [varchar](50) NULL,
 CONSTRAINT [PK_CMusteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSaticilar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSaticilar](
	[SaticiNo] [int] IDENTITY(1,1) NOT NULL,
	[SaticiAdSoyad] [varchar](50) NULL,
	[SaticiAdres] [varchar](50) NULL,
	[SaticiIlce] [varchar](50) NULL,
	[SaticiSube] [varchar](50) NULL,
 CONSTRAINT [PK_CSaticilar] PRIMARY KEY CLUSTERED 
(
	[SaticiNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSiparis]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSiparis](
	[UrunNo] [int] NOT NULL,
	[SiparisFiyat] [money] NULL,
	[SiparisAdet] [int] NULL,
	[Tutar] [money] NULL,
	[SiparisNo] [int] NOT NULL,
	[KullanıcıNo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CSiparis_1] PRIMARY KEY CLUSTERED 
(
	[SiparisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUrunler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUrunler](
	[UrunNo] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdı] [varchar](50) NULL,
	[UrunFiyati] [money] NULL,
	[SonKullanmaTarihi] [varchar](50) NULL,
	[ÜretimTarihi] [varchar](50) NULL,
	[SatıcıNo] [int] NULL,
 CONSTRAINT [PK_CUrunler] PRIMARY KEY CLUSTERED 
(
	[UrunNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CYKullanici]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CYKullanici](
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Sifre] [varchar](50) NOT NULL,
	[Mail] [varchar](20) NULL,
	[Telefon] [varchar](50) NULL,
 CONSTRAINT [PK_CYKullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departman]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departman](
	[DepartmanNo] [int] IDENTITY(1,1) NOT NULL,
	[DepartmanAdi] [varchar](50) NULL,
	[CalisanSayisi] [int] NULL,
	[BagliOlduguBirim] [int] NULL,
	[BirimAdi] [varchar](50) NULL,
 CONSTRAINT [PK_Departman] PRIMARY KEY CLUSTERED 
(
	[DepartmanNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DerslerSet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DerslerSet](
	[DersNo] [int] IDENTITY(1,1) NOT NULL,
	[DersAdi] [nvarchar](max) NOT NULL,
	[DersKodu] [nvarchar](max) NOT NULL,
	[OgrenciNo] [int] NOT NULL,
 CONSTRAINT [PK_DerslerSet] PRIMARY KEY CLUSTERED 
(
	[DersNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[DoktorAdSoyad] [varchar](50) NULL,
	[DoktorTc] [char](11) NULL,
	[DoktorUzmanlıkAlani] [varchar](50) NULL,
	[DoktorUnvani] [varchar](50) NULL,
	[DoktorTelefonNumarasi] [char](11) NULL,
	[DoktorAdres] [varchar](50) NULL,
	[DoktorDogumTarihi] [varchar](50) NULL,
	[PoliklinikNo] [int] NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[HastaAdSoyad] [varchar](50) NULL,
	[HastaTcNo] [char](11) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[HastaBoy] [int] NULL,
	[HastaYas] [int] NULL,
	[Reçete] [varchar](50) NULL,
	[RaporDurumu] [nvarchar](50) NULL,
	[RandevuTarihi] [varchar](50) NULL,
	[DoktorNo] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kategoriSet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategoriSet](
	[kategorino] [int] IDENTITY(1,1) NOT NULL,
	[kaadi] [nvarchar](max) NOT NULL,
	[malno] [int] NOT NULL,
 CONSTRAINT [PK_kategoriSet] PRIMARY KEY CLUSTERED 
(
	[kategorino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KKullanicilar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KKullanicilar](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
 CONSTRAINT [PK_KKullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kutuphane]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kutuphane](
	[KutuphaneNo] [int] IDENTITY(1,1) NOT NULL,
	[KutuphaneAdi] [varchar](50) NULL,
	[KitapSayisi] [int] NULL,
	[Bolge] [varchar](50) NULL,
	[UyeSayisi] [int] NULL,
	[Adres] [varchar](50) NULL,
 CONSTRAINT [PK_Kutuphane] PRIMARY KEY CLUSTERED 
(
	[KutuphaneNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Malzemeler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Malzemeler](
	[MalzemeNo] [int] IDENTITY(1,1) NOT NULL,
	[MalzemeAdi] [varchar](50) NULL,
	[Mensei] [varchar](50) NULL,
	[Fiyat] [int] NULL,
	[Cins] [varchar](50) NULL,
	[Sehir] [varchar](50) NULL,
 CONSTRAINT [PK_Malzemeler] PRIMARY KEY CLUSTERED 
(
	[MalzemeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriNo] [int] IDENTITY(1,1) NOT NULL,
	[Banka] [varchar](50) NULL,
	[AdSoyad] [varchar](50) NULL,
	[Yas] [int] NULL,
	[Maas] [int] NULL,
	[Bakiye] [int] NULL,
	[Adres] [varchar](50) NULL,
	[Şube] [varchar](50) NULL,
	[Gelir] [int] NULL,
	[Gider] [int] NULL,
	[KrediNotu] [int] NULL,
	[VergiSicilNo] [char](10) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Müşteriler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Müşteriler](
	[MusteriNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL,
	[Yas] [int] NULL,
	[MusteriBakiye] [int] NULL,
 CONSTRAINT [PK_Müşteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[OgrenciNo] [int] IDENTITY(1,1) NOT NULL,
	[Adsoyad] [varchar](50) NULL,
	[Yas] [int] NULL,
	[TcNo] [char](11) NULL,
	[Mail] [varchar](50) NULL,
	[Sehir] [varchar](50) NULL,
	[Puan] [int] NULL,
	[DersKodu] [varchar](50) NULL,
	[DersSayisi] [int] NULL,
	[Memleket] [varchar](50) NULL,
	[odeme] [int] NULL,
 CONSTRAINT [PK_Ogrenciler] PRIMARY KEY CLUSTERED 
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OgrencilerSet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrencilerSet](
	[OgrenciNo] [int] IDENTITY(1,1) NOT NULL,
	[OgrenciAdi] [nvarchar](max) NOT NULL,
	[OgrenciSoyadi] [nvarchar](max) NOT NULL,
	[OgrenciSubeNo] [int] NOT NULL,
	[OgrenciAdres] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OgrencilerSet] PRIMARY KEY CLUSTERED 
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OgretmenSet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgretmenSet](
	[OgretmenNo] [int] IDENTITY(1,1) NOT NULL,
	[OgretmenAdi] [nvarchar](max) NOT NULL,
	[OgretmenBransi] [nvarchar](max) NOT NULL,
	[OgretmenAdresi] [nvarchar](max) NOT NULL,
	[DersNo] [int] NOT NULL,
 CONSTRAINT [PK_OgretmenSet] PRIMARY KEY CLUSTERED 
(
	[OgretmenNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[PersonelNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Yas] [int] NULL,
	[Maas] [money] NULL,
	[Cinsiyet] [varchar](50) NULL,
	[DepartmanNo] [int] NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[PersonelNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinikler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinikler](
	[PoliklinikNo] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinikAdı] [varchar](50) NULL,
	[PoliklinikUzmanSayısı] [int] NULL,
	[PoliklinikBaskanı] [varchar](50) NULL,
	[PoliklinikBasHemsire] [varchar](50) NULL,
	[PoliklinikYatakSayısı] [int] NULL,
 CONSTRAINT [PK_Poliklinikler] PRIMARY KEY CLUSTERED 
(
	[PoliklinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saticilar]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saticilar](
	[SaticiNo] [int] IDENTITY(1,1) NOT NULL,
	[SaticiAdi] [varchar](50) NULL,
	[Sube] [varchar](50) NULL,
	[MalzemeNo] [int] NULL,
 CONSTRAINT [PK_Saticilar] PRIMARY KEY CLUSTERED 
(
	[SaticiNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subeler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subeler](
	[SubeNo] [int] IDENTITY(1,1) NOT NULL,
	[SubeAdi] [varchar](50) NULL,
	[PersonelNo] [int] NULL,
 CONSTRAINT [PK_Subeler] PRIMARY KEY CLUSTERED 
(
	[SubeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Şubeler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Şubeler](
	[SubeNo] [int] IDENTITY(1,1) NOT NULL,
	[SubeAdi] [varchar](50) NULL,
	[CalisanSayisi] [int] NULL,
	[SubeCiro] [int] NULL,
	[MusteriNo] [int] NULL,
 CONSTRAINT [PK_Şubeler] PRIMARY KEY CLUSTERED 
(
	[SubeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarihler]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarihler](
	[g_date] [date] NULL,
	[g_time] [time](7) NULL,
	[g_datetime] [datetime] NULL,
	[g_smalltime] [smalldatetime] NULL,
	[g_ofset] [datetimeoffset](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunlerdnm]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunlerdnm](
	[UrunNo] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [varchar](50) NULL,
	[UrunMarka] [varchar](50) NULL,
	[UrunFiyat] [money] NULL,
	[UrunKod] [varchar](50) NOT NULL,
 CONSTRAINT [UQ_Urunlerr_UrunKod] PRIMARY KEY CLUSTERED 
(
	[UrunKod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersSet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersSet](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](max) NOT NULL,
	[Sifre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UsersSet] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Araçlar] ON 

INSERT [dbo].[Araçlar] ([AracNo], [AracFiyat], [AracAdet], [AracMarka], [AracModel], [AracYıl], [AracÖzellik], [AracMotor], [AracPaket], [AracRenk], [SubeNo]) VALUES (1, 2000, 2, N'volvo', N'xc40', N'2009', N'otomatik', N'4', N'full', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Araçlar] OFF
GO
INSERT [dbo].[Bankalar] ([BankaNo], [BankaAdi], [VergiNo]) VALUES (1, N'garanti', 1234567890)
INSERT [dbo].[Bankalar] ([BankaNo], [BankaAdi], [VergiNo]) VALUES (2, N'ziraat', 1234567899)
GO
SET IDENTITY_INSERT [dbo].[Calisanlar] ON 

INSERT [dbo].[Calisanlar] ([CalisanNo], [CalisanAdSoyad], [KullaniciAd], [Sifre], [KutuphaneNo]) VALUES (1, N'Gamze Başgöze', N'gamzebasgoze', N'12345', 1)
SET IDENTITY_INSERT [dbo].[Calisanlar] OFF
GO
SET IDENTITY_INSERT [dbo].[CKullanici] ON 

INSERT [dbo].[CKullanici] ([KullaniciAdi], [Sifre], [Mail], [Telefon], [KullaniciNo]) VALUES (N'gmz', N'12345', N'gmz@brekkie.com', N'5555555555 ', 1)
SET IDENTITY_INSERT [dbo].[CKullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[CMusteriler] ON 

INSERT [dbo].[CMusteriler] ([MusteriNo], [MusteriAdSoyad], [MusteriTelefon]) VALUES (1, N'Ayça Güneş', N'5540000000 ')
INSERT [dbo].[CMusteriler] ([MusteriNo], [MusteriAdSoyad], [MusteriTelefon]) VALUES (2, N'Merve Ay', N'5554444444 ')
SET IDENTITY_INSERT [dbo].[CMusteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[CSaticilar] ON 

INSERT [dbo].[CSaticilar] ([SaticiNo], [SaticiAdSoyad], [SaticiAdres], [SaticiIlce], [SaticiSube]) VALUES (1, N'Burak Ulus', N'Fevzipaşa Mah.', N'Ataşehir', N'Batı Ataşehir')
INSERT [dbo].[CSaticilar] ([SaticiNo], [SaticiAdSoyad], [SaticiAdres], [SaticiIlce], [SaticiSube]) VALUES (2, N'Erdem Kara', N'İnönü Mah.', N'Beyoğlu', N'Şişli')
SET IDENTITY_INSERT [dbo].[CSaticilar] OFF
GO
SET IDENTITY_INSERT [dbo].[CUrunler] ON 

INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (1, N'Sade Kruvasan', 60.0000, N'19.10.2022', N'18.10.2022', 2)
INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (2, N'Bademli Kruvasan', 70.0000, N'19.10.2022', N'18.10.2022', 2)
INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (3, N'Hindi Fümeli Kruvasan', 70.0000, N'19.10.2022', N'18.10.2022', 1)
INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (4, N'Orman Meyveli Kruvasan', 65.0000, N'20.10.2022', N'19.10.2022', 2)
INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (5, N'Nutela Kruvasan', 65.0000, N'20.10.2022', N'19.10.2022', 2)
INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (6, N'Sedigo Kruvasan', 70.0000, N'20.10.2022', N'19.10.2022', 1)
INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (7, N'Yummy Kruvasan', 70.0000, N'20.10.2022', N'19.10.2022', 1)
INSERT [dbo].[CUrunler] ([UrunNo], [UrunAdı], [UrunFiyati], [SonKullanmaTarihi], [ÜretimTarihi], [SatıcıNo]) VALUES (8, N'Butcher Kruvasan', 70.0000, N'20.10.2022', N'19.10.2022', 1)
SET IDENTITY_INSERT [dbo].[CUrunler] OFF
GO
INSERT [dbo].[CYKullanici] ([KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (N'Admin', N'11111', N'admin@brekkie.com', N'(507) 123-4567')
GO
SET IDENTITY_INSERT [dbo].[Departman] ON 

INSERT [dbo].[Departman] ([DepartmanNo], [DepartmanAdi], [CalisanSayisi], [BagliOlduguBirim], [BirimAdi]) VALUES (1, N'Muhasebe', 25, 1, N'maliye')
INSERT [dbo].[Departman] ([DepartmanNo], [DepartmanAdi], [CalisanSayisi], [BagliOlduguBirim], [BirimAdi]) VALUES (2, N'İk', 7, 1, N'maliye')
INSERT [dbo].[Departman] ([DepartmanNo], [DepartmanAdi], [CalisanSayisi], [BagliOlduguBirim], [BirimAdi]) VALUES (3, N'İt', 50, 2, N'arge')
INSERT [dbo].[Departman] ([DepartmanNo], [DepartmanAdi], [CalisanSayisi], [BagliOlduguBirim], [BirimAdi]) VALUES (4, N'develepor', 25, 2, N'arge')
INSERT [dbo].[Departman] ([DepartmanNo], [DepartmanAdi], [CalisanSayisi], [BagliOlduguBirim], [BirimAdi]) VALUES (5, N'pazarlama', 54, 3, N'satış')
INSERT [dbo].[Departman] ([DepartmanNo], [DepartmanAdi], [CalisanSayisi], [BagliOlduguBirim], [BirimAdi]) VALUES (6, N'diğer', 4, 4, N'organizasyon')
SET IDENTITY_INSERT [dbo].[Departman] OFF
GO
SET IDENTITY_INSERT [dbo].[DerslerSet] ON 

INSERT [dbo].[DerslerSet] ([DersNo], [DersAdi], [DersKodu], [OgrenciNo]) VALUES (3, N'Matematik', N'M', 1)
INSERT [dbo].[DerslerSet] ([DersNo], [DersAdi], [DersKodu], [OgrenciNo]) VALUES (4, N'Türkçe', N'T', 2)
INSERT [dbo].[DerslerSet] ([DersNo], [DersAdi], [DersKodu], [OgrenciNo]) VALUES (5, N'Fizik', N'F', 1)
SET IDENTITY_INSERT [dbo].[DerslerSet] OFF
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTc], [DoktorUzmanlıkAlani], [DoktorUnvani], [DoktorTelefonNumarasi], [DoktorAdres], [DoktorDogumTarihi], [PoliklinikNo]) VALUES (1, N'Büşra Başsoy', N'12345678910', N'Kardiyoloji', N'Doç.', N'05551111111', N'Çakmak Mah.', N'10.07.1985', 1)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTc], [DoktorUzmanlıkAlani], [DoktorUnvani], [DoktorTelefonNumarasi], [DoktorAdres], [DoktorDogumTarihi], [PoliklinikNo]) VALUES (3, N'Büşra Aydın', N'14725836910', N'Fizyoloji', N'Doç.', N'(555) 555-5', N'Beşiktaş', N'08.09.1988', 5)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTc], [DoktorUzmanlıkAlani], [DoktorUnvani], [DoktorTelefonNumarasi], [DoktorAdres], [DoktorDogumTarihi], [PoliklinikNo]) VALUES (4, N'Ayşe Mutlu', N'85274136910', N'Kardiyoloji', N'Prof', N'5424222222 ', N'İnönü MAh.', N'10.08.1994', 1)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTcNo], [DogumTarihi], [HastaBoy], [HastaYas], [Reçete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (1, N'Merve Yıldız', N'98765432110', N'02.05.1989', 168, 33, N'A1872Df3', N'Raporsuz  ', N'10.10.2022', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTcNo], [DogumTarihi], [HastaBoy], [HastaYas], [Reçete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (2, N'Nazlı Akçay', N'98765432110', N'03.04.1998', 165, 24, N'ARG89H1ş', N'Raporlu', N'2.04.2022', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTcNo], [DogumTarihi], [HastaBoy], [HastaYas], [Reçete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (5, N'Ayşe Aksu', N'12345678910', N'04.11.2000', 149, 22, N'RT98PfTU', N'Raporsuz', N'20.08.2022', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTcNo], [DogumTarihi], [HastaBoy], [HastaYas], [Reçete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (6, N'Merve Bilir', N'54698732114', N'06.04.1978', 173, 44, N'NH8Kr77', N'Raporsuz', N'12.10.2021', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTcNo], [DogumTarihi], [HastaBoy], [HastaYas], [Reçete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (7, N'Merve Acar', N'52147896310', N'10.02.2000', 110, 22, N'MKl598l', N'Raporlu', N'14.10.2021', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTcNo], [DogumTarihi], [HastaBoy], [HastaYas], [Reçete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (8, N'Mehmet Başar', N'25814736988', N'14.05.1950', 154, 72, N'LK8PF31', N'Raporsuz', N'08.10.2022', 1)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Email], [Telefon]) VALUES (1, N'Admin', N'12345', N'admin@admin.com', N'05555555555')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Email], [Telefon]) VALUES (2, N'Gamze', N'98765', N'gmz@gmz.com', N'(551) 555-5555')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kutuphane] ON 

INSERT [dbo].[Kutuphane] ([KutuphaneNo], [KutuphaneAdi], [KitapSayisi], [Bolge], [UyeSayisi], [Adres]) VALUES (1, N'tryrt', 56, N'trrt', 56, N'tyrty')
INSERT [dbo].[Kutuphane] ([KutuphaneNo], [KutuphaneAdi], [KitapSayisi], [Bolge], [UyeSayisi], [Adres]) VALUES (3, N'İlHalk', 6878, N'Merkez', 725, N'İnönü Mah.')
INSERT [dbo].[Kutuphane] ([KutuphaneNo], [KutuphaneAdi], [KitapSayisi], [Bolge], [UyeSayisi], [Adres]) VALUES (4, N'Ana Bilim', 741, N'Sancaktepe', 124, N'Fevzipaşa Mah.')
SET IDENTITY_INSERT [dbo].[Kutuphane] OFF
GO
SET IDENTITY_INSERT [dbo].[Malzemeler] ON 

INSERT [dbo].[Malzemeler] ([MalzemeNo], [MalzemeAdi], [Mensei], [Fiyat], [Cins], [Sehir]) VALUES (2, N'metal', N'tr', 450, N'termos', NULL)
SET IDENTITY_INSERT [dbo].[Malzemeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriNo], [Banka], [AdSoyad], [Yas], [Maas], [Bakiye], [Adres], [Şube], [Gelir], [Gider], [KrediNotu], [VergiSicilNo]) VALUES (1, N'Garanti', N'Gamze', 30, 9800, 2000000, N'İnönü Mah', N'Ataşehir', 14000, 8000, 98, N'1234567890')
INSERT [dbo].[Musteriler] ([MusteriNo], [Banka], [AdSoyad], [Yas], [Maas], [Bakiye], [Adres], [Şube], [Gelir], [Gider], [KrediNotu], [VergiSicilNo]) VALUES (2, N'Ziraat', N'Ayşe', 25, 10000, 1500000, N'Fezvipaşa Mah', N'Kadıköy', 12000, 9000, 95, N'9876543210')
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogrenciler] ON 

INSERT [dbo].[Ogrenciler] ([OgrenciNo], [Adsoyad], [Yas], [TcNo], [Mail], [Sehir], [Puan], [DersKodu], [DersSayisi], [Memleket], [odeme]) VALUES (1, N'nihal öz', 29, N'11111112   ', N'nihal@gmail.com', N'İstanbul', 100, N'45788888', 7, NULL, NULL)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [Adsoyad], [Yas], [TcNo], [Mail], [Sehir], [Puan], [DersKodu], [DersSayisi], [Memleket], [odeme]) VALUES (2, N'ayse', 29, N'1111111    ', N'nihal2@gmail.com', NULL, 10, N'1458', 5, NULL, NULL)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [Adsoyad], [Yas], [TcNo], [Mail], [Sehir], [Puan], [DersKodu], [DersSayisi], [Memleket], [odeme]) VALUES (3, N'fatma', 25, N'47586      ', N'fatma@gmail.com', N'ankara', 50, N'5541', NULL, NULL, NULL)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [Adsoyad], [Yas], [TcNo], [Mail], [Sehir], [Puan], [DersKodu], [DersSayisi], [Memleket], [odeme]) VALUES (4, N'bahar', 14, N'454541     ', N'bahar1@hotmail.com', N'Ankara', 0, N'4545', NULL, NULL, NULL)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [Adsoyad], [Yas], [TcNo], [Mail], [Sehir], [Puan], [DersKodu], [DersSayisi], [Memleket], [odeme]) VALUES (5, N'bahar', 14, N'45454      ', N'bahar2@hotmail.com', N'Ankara', 0, N'4545', 3, NULL, NULL)
INSERT [dbo].[Ogrenciler] ([OgrenciNo], [Adsoyad], [Yas], [TcNo], [Mail], [Sehir], [Puan], [DersKodu], [DersSayisi], [Memleket], [odeme]) VALUES (6, N'bahar', 14, N'454542     ', N'bahar3@hotmail.com', N'Ankara', 0, N'4545', 3, N'Erzincan', 1000)
SET IDENTITY_INSERT [dbo].[Ogrenciler] OFF
GO
SET IDENTITY_INSERT [dbo].[OgrencilerSet] ON 

INSERT [dbo].[OgrencilerSet] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [OgrenciSubeNo], [OgrenciAdres]) VALUES (1, N'Esra', N'PALUT', 12, N'Pendik')
INSERT [dbo].[OgrencilerSet] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [OgrenciSubeNo], [OgrenciAdres]) VALUES (2, N'Merve', N'BAŞAR', 11, N'Kartal')
INSERT [dbo].[OgrencilerSet] ([OgrenciNo], [OgrenciAdi], [OgrenciSoyadi], [OgrenciSubeNo], [OgrenciAdres]) VALUES (3, N'Ahmet', N'Keleş', 11, N'Sarıyer')
SET IDENTITY_INSERT [dbo].[OgrencilerSet] OFF
GO
SET IDENTITY_INSERT [dbo].[OgretmenSet] ON 

INSERT [dbo].[OgretmenSet] ([OgretmenNo], [OgretmenAdi], [OgretmenBransi], [OgretmenAdresi], [DersNo]) VALUES (2, N'esra', N'Matematik', N'Pendik', 3)
INSERT [dbo].[OgretmenSet] ([OgretmenNo], [OgretmenAdi], [OgretmenBransi], [OgretmenAdresi], [DersNo]) VALUES (3, N'esra', N'matematik', N'pendik', 3)
INSERT [dbo].[OgretmenSet] ([OgretmenNo], [OgretmenAdi], [OgretmenBransi], [OgretmenAdresi], [DersNo]) VALUES (4, N'Tuğçe', N'Fizik', N'Başakşehir', 5)
INSERT [dbo].[OgretmenSet] ([OgretmenNo], [OgretmenAdi], [OgretmenBransi], [OgretmenAdresi], [DersNo]) VALUES (8, N'Mustafa', N'Matematik', N'Şile', 3)
SET IDENTITY_INSERT [dbo].[OgretmenSet] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (1, N'esralar', 25, 5000.0000, N'kız', 1)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (2, N'gamze', 24, 90000.0000, N'kız', 4)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (3, N'furkan', 25, 2000.0000, N'erkek', 3)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (4, N'ikizler', 26, 500000.0000, N'erkek', 2)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (5, N'berkcan', 26, 15000.0000, N'erkek', 2)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (6, N'nihal öz', 27, 2000.0000, N'kız', NULL)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (7, N'akın öz', 27, 2000.0000, N'erkek', NULL)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (8, N'sümeyye', 27, 4000.0000, N'kız', 5)
INSERT [dbo].[Personel] ([PersonelNo], [AdSoyad], [Yas], [Maas], [Cinsiyet], [DepartmanNo]) VALUES (9, N'alper emre', 27, 450000.0000, N'erkek', 5)
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinikler] ON 

INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdı], [PoliklinikUzmanSayısı], [PoliklinikBaskanı], [PoliklinikBasHemsire], [PoliklinikYatakSayısı]) VALUES (1, N'Kardiyoloji', 3, N'Ahmet Yılmaz', N'Ayşe Yılmaz', 32)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdı], [PoliklinikUzmanSayısı], [PoliklinikBaskanı], [PoliklinikBasHemsire], [PoliklinikYatakSayısı]) VALUES (5, N'Fizik Tedavi', 6, N'Merve Soydan', N'Ayşe Güler', 12)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdı], [PoliklinikUzmanSayısı], [PoliklinikBaskanı], [PoliklinikBasHemsire], [PoliklinikYatakSayısı]) VALUES (6, N'dahiliye', 5, N'erman', N'esra', 32)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdı], [PoliklinikUzmanSayısı], [PoliklinikBaskanı], [PoliklinikBasHemsire], [PoliklinikYatakSayısı]) VALUES (7, N'ortopedi', 11, N'Arslan Tunç', N'Sertap Eraslan', 25)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdı], [PoliklinikUzmanSayısı], [PoliklinikBaskanı], [PoliklinikBasHemsire], [PoliklinikYatakSayısı]) VALUES (8, N'Göğüs hastalıkları', 4, N'Mehmet Eryılmaz', N'Melik Akın', 54)
SET IDENTITY_INSERT [dbo].[Poliklinikler] OFF
GO
SET IDENTITY_INSERT [dbo].[Subeler] ON 

INSERT [dbo].[Subeler] ([SubeNo], [SubeAdi], [PersonelNo]) VALUES (1, N'ataşehir', 2)
INSERT [dbo].[Subeler] ([SubeNo], [SubeAdi], [PersonelNo]) VALUES (2, N'mecidiyeköy', 5)
INSERT [dbo].[Subeler] ([SubeNo], [SubeAdi], [PersonelNo]) VALUES (3, N'ümraniye', 1)
INSERT [dbo].[Subeler] ([SubeNo], [SubeAdi], [PersonelNo]) VALUES (4, N'kadıköy', 3)
INSERT [dbo].[Subeler] ([SubeNo], [SubeAdi], [PersonelNo]) VALUES (5, N'levent', 4)
SET IDENTITY_INSERT [dbo].[Subeler] OFF
GO
INSERT [dbo].[tarihler] ([g_date], [g_time], [g_datetime], [g_smalltime], [g_ofset]) VALUES (CAST(N'2022-10-20' AS Date), CAST(N'13:58:20.4900000' AS Time), CAST(N'2022-10-20T13:58:20.490' AS DateTime), CAST(N'2022-10-20T13:58:00' AS SmallDateTime), CAST(N'2022-10-20T13:58:20.4900000+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[Urunlerdnm] ON 

INSERT [dbo].[Urunlerdnm] ([UrunNo], [UrunAdi], [UrunMarka], [UrunFiyat], [UrunKod]) VALUES (1, N'Kolonya', N'Greenworld', 101.0000, N'asdfg')
INSERT [dbo].[Urunlerdnm] ([UrunNo], [UrunAdi], [UrunMarka], [UrunFiyat], [UrunKod]) VALUES (3, N'Termos', N'Stanley', 499.0000, N'asdfgh')
INSERT [dbo].[Urunlerdnm] ([UrunNo], [UrunAdi], [UrunMarka], [UrunFiyat], [UrunKod]) VALUES (6, N'Klavye', N'technopc', 498.0000, N'klmn')
SET IDENTITY_INSERT [dbo].[Urunlerdnm] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersSet] ON 

INSERT [dbo].[UsersSet] ([KullaniciNo], [KullaniciAdi], [Sifre]) VALUES (1, N'123', N'nihal')
INSERT [dbo].[UsersSet] ([KullaniciNo], [KullaniciAdi], [Sifre]) VALUES (2, N'gamze', N'1234')
INSERT [dbo].[UsersSet] ([KullaniciNo], [KullaniciAdi], [Sifre]) VALUES (3, N'esra', N'9876')
SET IDENTITY_INSERT [dbo].[UsersSet] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bankalar_BankaAdi]    Script Date: 13.12.2022 14:45:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bankalar_BankaAdi] ON [dbo].[Bankalar]
(
	[BankaAdi] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bankalar_VergiNo]    Script Date: 13.12.2022 14:45:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bankalar_VergiNo] ON [dbo].[Bankalar]
(
	[VergiNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Calisanlar_Sifre]    Script Date: 13.12.2022 14:45:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Calisanlar_Sifre] ON [dbo].[Calisanlar]
(
	[Sifre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OgrencilerDersler]    Script Date: 13.12.2022 14:45:11 ******/
CREATE NONCLUSTERED INDEX [IX_FK_OgrencilerDersler] ON [dbo].[DerslerSet]
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ceyizkategori]    Script Date: 13.12.2022 14:45:11 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ceyizkategori] ON [dbo].[kategoriSet]
(
	[malno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Musteriler_Banka]    Script Date: 13.12.2022 14:45:11 ******/
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [UQ_Musteriler_Banka] UNIQUE NONCLUSTERED 
(
	[Banka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Musteriler_VergiSicilNo]    Script Date: 13.12.2022 14:45:11 ******/
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [UQ_Musteriler_VergiSicilNo] UNIQUE NONCLUSTERED 
(
	[VergiSicilNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UG_Ogrenciler_TcNo]    Script Date: 13.12.2022 14:45:11 ******/
ALTER TABLE [dbo].[Ogrenciler] ADD  CONSTRAINT [UG_Ogrenciler_TcNo] UNIQUE NONCLUSTERED 
(
	[TcNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Ogrenciler]    Script Date: 13.12.2022 14:45:11 ******/
ALTER TABLE [dbo].[Ogrenciler] ADD  CONSTRAINT [UQ_Ogrenciler] UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DerslerOgretmen]    Script Date: 13.12.2022 14:45:11 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DerslerOgretmen] ON [dbo].[OgretmenSet]
(
	[DersNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [DF_Musteriler_Şube]  DEFAULT ('Şube Girişi Yapılmadı') FOR [Şube]
GO
ALTER TABLE [dbo].[Ogrenciler] ADD  CONSTRAINT [Df_Ogrenciler_Sehir]  DEFAULT ('Ankara') FOR [Sehir]
GO
ALTER TABLE [dbo].[Ogrenciler] ADD  CONSTRAINT [Df_Ogrenciler_DersSayisi]  DEFAULT ((3)) FOR [DersSayisi]
GO
ALTER TABLE [dbo].[Ogrenciler] ADD  CONSTRAINT [DF_Ogrenciler_Memleket]  DEFAULT ('Erzincan') FOR [Memleket]
GO
ALTER TABLE [dbo].[Ogrenciler] ADD  CONSTRAINT [DF_Ogrenciler_odeme]  DEFAULT ((1000)) FOR [odeme]
GO
ALTER TABLE [dbo].[Urunlerdnm] ADD  CONSTRAINT [DF_Urunlerdnm_UrunMarka]  DEFAULT ('ZARA') FOR [UrunMarka]
GO
ALTER TABLE [dbo].[Araçlar]  WITH CHECK ADD  CONSTRAINT [FK_Araçlar_Şubeler] FOREIGN KEY([SubeNo])
REFERENCES [dbo].[Şubeler] ([SubeNo])
GO
ALTER TABLE [dbo].[Araçlar] CHECK CONSTRAINT [FK_Araçlar_Şubeler]
GO
ALTER TABLE [dbo].[Calisanlar]  WITH CHECK ADD  CONSTRAINT [FK_Calisanlar_Kutuphane] FOREIGN KEY([KutuphaneNo])
REFERENCES [dbo].[Kutuphane] ([KutuphaneNo])
GO
ALTER TABLE [dbo].[Calisanlar] CHECK CONSTRAINT [FK_Calisanlar_Kutuphane]
GO
ALTER TABLE [dbo].[CSiparis]  WITH CHECK ADD  CONSTRAINT [FK_CSiparis_CKullanici] FOREIGN KEY([KullanıcıNo])
REFERENCES [dbo].[CKullanici] ([KullaniciNo])
GO
ALTER TABLE [dbo].[CSiparis] CHECK CONSTRAINT [FK_CSiparis_CKullanici]
GO
ALTER TABLE [dbo].[CSiparis]  WITH CHECK ADD  CONSTRAINT [FK_CSiparis_CUrunler1] FOREIGN KEY([UrunNo])
REFERENCES [dbo].[CUrunler] ([UrunNo])
GO
ALTER TABLE [dbo].[CSiparis] CHECK CONSTRAINT [FK_CSiparis_CUrunler1]
GO
ALTER TABLE [dbo].[CUrunler]  WITH CHECK ADD  CONSTRAINT [FK_CUrunler_CSaticilar1] FOREIGN KEY([SatıcıNo])
REFERENCES [dbo].[CSaticilar] ([SaticiNo])
GO
ALTER TABLE [dbo].[CUrunler] CHECK CONSTRAINT [FK_CUrunler_CSaticilar1]
GO
ALTER TABLE [dbo].[DerslerSet]  WITH CHECK ADD  CONSTRAINT [FK_OgrencilerDersler] FOREIGN KEY([OgrenciNo])
REFERENCES [dbo].[OgrencilerSet] ([OgrenciNo])
GO
ALTER TABLE [dbo].[DerslerSet] CHECK CONSTRAINT [FK_OgrencilerDersler]
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Poliklinikler] FOREIGN KEY([PoliklinikNo])
REFERENCES [dbo].[Poliklinikler] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Poliklinikler]
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalar_Doktorlar] FOREIGN KEY([DoktorNo])
REFERENCES [dbo].[Doktorlar] ([DoktorNo])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalar_Doktorlar]
GO
ALTER TABLE [dbo].[kategoriSet]  WITH CHECK ADD  CONSTRAINT [FK_ceyizkategori] FOREIGN KEY([malno])
REFERENCES [dbo].[ceyizSet] ([malno])
GO
ALTER TABLE [dbo].[kategoriSet] CHECK CONSTRAINT [FK_ceyizkategori]
GO
ALTER TABLE [dbo].[OgretmenSet]  WITH CHECK ADD  CONSTRAINT [FK_DerslerOgretmen] FOREIGN KEY([DersNo])
REFERENCES [dbo].[DerslerSet] ([DersNo])
GO
ALTER TABLE [dbo].[OgretmenSet] CHECK CONSTRAINT [FK_DerslerOgretmen]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Departman] FOREIGN KEY([DepartmanNo])
REFERENCES [dbo].[Departman] ([DepartmanNo])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK_Personel_Departman]
GO
ALTER TABLE [dbo].[Subeler]  WITH CHECK ADD  CONSTRAINT [FK_Subeler_Personel] FOREIGN KEY([PersonelNo])
REFERENCES [dbo].[Personel] ([PersonelNo])
GO
ALTER TABLE [dbo].[Subeler] CHECK CONSTRAINT [FK_Subeler_Personel]
GO
ALTER TABLE [dbo].[Şubeler]  WITH CHECK ADD  CONSTRAINT [FK_Şubeler_Müşteriler] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[Müşteriler] ([MusteriNo])
GO
ALTER TABLE [dbo].[Şubeler] CHECK CONSTRAINT [FK_Şubeler_Müşteriler]
GO
ALTER TABLE [dbo].[Musteriler]  WITH CHECK ADD  CONSTRAINT [Ck_Musteriler_Adres] CHECK  ((len([Adres])>(5)))
GO
ALTER TABLE [dbo].[Musteriler] CHECK CONSTRAINT [Ck_Musteriler_Adres]
GO
ALTER TABLE [dbo].[Musteriler]  WITH CHECK ADD  CONSTRAINT [CK_Musteriler_Gelir] CHECK  (([Gelir]>(0) AND [Gelir]<(80000000)))
GO
ALTER TABLE [dbo].[Musteriler] CHECK CONSTRAINT [CK_Musteriler_Gelir]
GO
ALTER TABLE [dbo].[Musteriler]  WITH CHECK ADD  CONSTRAINT [CK_Musteriler_KrediNotu] CHECK  (([KrediNotu]<(100)))
GO
ALTER TABLE [dbo].[Musteriler] CHECK CONSTRAINT [CK_Musteriler_KrediNotu]
GO
ALTER TABLE [dbo].[Ogrenciler]  WITH CHECK ADD  CONSTRAINT [Ck_Ogrenciler_DersKodu] CHECK  ((len([DersKodu])>(3)))
GO
ALTER TABLE [dbo].[Ogrenciler] CHECK CONSTRAINT [Ck_Ogrenciler_DersKodu]
GO
ALTER TABLE [dbo].[Ogrenciler]  WITH CHECK ADD  CONSTRAINT [Ck_Ogrenciler_Puan] CHECK  (([Puan]>=(0) AND [Puan]<=(100)))
GO
ALTER TABLE [dbo].[Ogrenciler] CHECK CONSTRAINT [Ck_Ogrenciler_Puan]
GO
ALTER TABLE [dbo].[Ogrenciler]  WITH CHECK ADD  CONSTRAINT [CK_Ogrenciler_Yas] CHECK  (([Yas]>(7) AND [Yas]<(30)))
GO
ALTER TABLE [dbo].[Ogrenciler] CHECK CONSTRAINT [CK_Ogrenciler_Yas]
GO
ALTER TABLE [dbo].[Urunlerdnm]  WITH CHECK ADD  CONSTRAINT [CK_Urunlerdnm_UrunAdi] CHECK  ((len([UrunAdi])>(5) AND len([UrunAdi])<(20)))
GO
ALTER TABLE [dbo].[Urunlerdnm] CHECK CONSTRAINT [CK_Urunlerdnm_UrunAdi]
GO
ALTER TABLE [dbo].[Urunlerdnm]  WITH CHECK ADD  CONSTRAINT [CK_Urunlerdnm_UrunFiyat] CHECK  (([UrunFiyat]>(100) AND [Urunfiyat]<(500)))
GO
ALTER TABLE [dbo].[Urunlerdnm] CHECK CONSTRAINT [CK_Urunlerdnm_UrunFiyat]
GO
/****** Object:  StoredProcedure [dbo].[DAra]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DAra]
(
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTc char(11)
)

as begin
select*from Doktorlar where DoktorNo=@DoktorNo or DoktorAdSoyad=@DoktorAdSoyad or DoktorTc=@DoktorTc end
GO
/****** Object:  StoredProcedure [dbo].[DBirlestirmeGrup]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DBirlestirmeGrup]
@DoktorNo int
as begin
select RaporDurumu, count(*) as 'Doktorun baktığı hasta sayısı ve bilgileri' from Hastalar 
h inner join Doktorlar d on h.DoktorNo=d.DoktorNo where h.DoktorNo=@DoktorNo group by RaporDurumu end
GO
/****** Object:  StoredProcedure [dbo].[DGuncelle]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DGuncelle](
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTc char(11),
@DoktorUzmanlıkAlani varchar(50),
@DoktorUnvani varchar(50),
@DoktorTelefonNumarasi char(11),
@DoktorAdres varchar(50),
@DoktorDogumTarihi varchar(50),
@PoliklinikNo int

)
as begin update Doktorlar set DoktorAdSoyad=@DoktorAdSoyad,DoktorTc=@DoktorTc,DoktorUzmanlıkAlani=@DoktorUzmanlıkAlani,DoktorUnvani=@DoktorUnvani,
DoktorTelefonNumarasi=@DoktorTelefonNumarasi,DoktorAdres=@DoktorAdres,DoktorDogumTarihi=@DoktorDogumTarihi,PoliklinikNo=@PoliklinikNo where DoktorNo=@DoktorNo end
GO
/****** Object:  StoredProcedure [dbo].[DKaydet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DKaydet]
(
@DoktorAdSoyad varchar(50),
@DoktorTc char(11),
@DoktorUzmanlıkAlani varchar(50),
@DoktorUnvani varchar(50),
@DoktorTelefonNumarasi char(11),
@DoktorAdres varchar(50),
@DoktorDogumTarihi varchar(50),
@PoliklinikNo int 

)
as begin insert into Doktorlar (DoktorAdSoyad,DoktorTc, DoktorUzmanlıkAlani ,DoktorUnvani,DoktorTelefonNumarasi,DoktorAdres,DoktorDogumTarihi,PoliklinikNo)
values (@DoktorAdSoyad,@DoktorTc, @DoktorUzmanlıkAlani ,@DoktorUnvani,@DoktorTelefonNumarasi,@DoktorAdres,@DoktorDogumTarihi,@PoliklinikNo) end
GO
/****** Object:  StoredProcedure [dbo].[DListele]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DListele]
as begin 
select*from Doktorlar end
GO
/****** Object:  StoredProcedure [dbo].[doktorno]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorno]
as begin
select*from Doktorlar end
GO
/****** Object:  StoredProcedure [dbo].[DUzmanlıkAlanı]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DUzmanlıkAlanı]
as begin
select DoktorAdSoyad, DoktorUzmanlıkAlani from Doktorlar end
GO
/****** Object:  StoredProcedure [dbo].[H_23yas]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[H_23yas]
as begin
select HastaAdSoyad,HastaYas,RaporDurumu from Hastalar where HastaYas>23 group by RaporDurumu,HastaYas,HastaAdSoyad order by HastaYas end
GO
/****** Object:  StoredProcedure [dbo].[H_BoyOrtalamasi]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[H_BoyOrtalamasi]
as begin
select  DogumTarihi, sum(HastaYas) as 'Boy ort 165den > yaş Top' from Hastalar group by DogumTarihi having avg(HastaBoy)>165 end 
GO
/****** Object:  StoredProcedure [dbo].[H_DBirlestirme]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[H_DBirlestirme]
as begin
select HastaAdSoyad, HastaTcNo, DoktorUzmanlıkAlani, DoktorTelefonNumarasi from Hastalar h inner join Doktorlar d on h.DoktorNo=d.DoktorNo end
GO
/****** Object:  StoredProcedure [dbo].[H_Hastaadi_HastaTc]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[H_Hastaadi_HastaTc]
as begin select HastaAdSoyad, HastaTcNo from Hastalar order by HastaTcNo desc end
exec H_Hastaadi_HastaTc
GO
/****** Object:  StoredProcedure [dbo].[HAra]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HAra]
(
@HastaNo int,
@HastaAdSoyad varchar(50),
@HastaTcNo char(11)
)
as begin
select*from Hastalar where HastaNo=@HastaNo or HastaAdSoyad=@HastaAdSoyad or HastaTcNo=@HastaTcNo end
GO
/****** Object:  StoredProcedure [dbo].[HGuncelle]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HGuncelle]
(
@HastaNo int,
@HastaAdSoyad varchar(50),
@HastaTcNo char(11),
@DogumTarihi varchar(50),
@HastaBoy int,
@HastaYas int,
@Reçete varchar(50),
@RaporDurumu nvarchar (50),
@RandevuTarihi varchar(50),
@DoktorNo int

)
as begin update Hastalar set HastaAdSoyad=@HastaAdSoyad, HastaTcNo=@HastaTcNo,DogumTarihi=@DogumTarihi,HastaBoy=@HastaBoy,HastaYas=@HastaYas,Reçete=@Reçete,
RaporDurumu=@RaporDurumu, RandevuTarihi=@RandevuTarihi,DoktorNo=@DoktorNo where HastaNo=@HastaNo end
GO
/****** Object:  StoredProcedure [dbo].[HKaydet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[HKaydet]
(
@HastaAdSoyad varchar(50),
@HastaTcNo char(11),
@DogumTarihi varchar(50),
@HastaBoy int,
@HastaYas int,
@Reçete varchar(50),
@RaporDurumu nvarchar (50),
@RandevuTarihi varchar(50),
@DoktorNo int

)
as begin insert into Hastalar (HastaAdSoyad,HastaTcNo,DogumTarihi,HastaBoy,HastaYas,Reçete,RaporDurumu,RandevuTarihi,DoktorNo)
values (@HastaAdSoyad,@HastaTcNo,@DogumTarihi,@HastaBoy,@HastaYas,@Reçete,@RaporDurumu,@RandevuTarihi,@DoktorNo) end
GO
/****** Object:  StoredProcedure [dbo].[HListele]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HListele]
as begin 
select*from Hastalar end
GO
/****** Object:  StoredProcedure [dbo].[HRandevuTarihi]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HRandevuTarihi]
as begin
select RandevuTarihi,count(*) as 'Randevu Adeti' from Hastalar group by RandevuTarihi order by RandevuTarihi asc end
GO
/****** Object:  StoredProcedure [dbo].[HYas65denbuyuk]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HYas65denbuyuk]
as begin
select HastaAdSoyad,HastaYas,RaporDurumu,Reçete from Hastalar where HastaYas>65 end 
GO
/****** Object:  StoredProcedure [dbo].[KEkle]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KEkle](

@KullaniciAdi varchar(50),
@Sifre varchar(50),
@Email varchar(50),
@Telefon varchar(50)
)
as begin insert into Kullanicilar (KullaniciAdi, Sifre,Email, Telefon) values (@KullaniciAdi, @Sifre,@Email, @Telefon) end 
GO
/****** Object:  StoredProcedure [dbo].[KGriris]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KGriris]

@KullaniciAdi varchar(50),
@Sifre varchar(50)

as begin select*from Kullanicilar where KullaniciAdi=@KullaniciAdi and Sifre=@Sifre end
GO
/****** Object:  StoredProcedure [dbo].[PAra]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[PAra]
(
@PoliklinikNo int,
@PoliklinikAdı varchar(50)

)
as begin
select*from Poliklinikler where PoliklinikNo=@PoliklinikNo or PoliklinikAdı=@PoliklinikAdı end
GO
/****** Object:  StoredProcedure [dbo].[PGuncelle]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PGuncelle](
@PoliklinikNo int,
@PoliklinikAdı varchar(50),
@PoliklinikUzmanSayısı int,
@PoliklinikBaskanı varchar(50),
@PoliklinikBashemsire varchar(50),
@PoliklinikYatakSayısı int
)

as begin update Poliklinikler set PoliklinikAdı=@PoliklinikAdı,PoliklinikUzmanSayısı=@PoliklinikUzmanSayısı,
PoliklinikBaskanı=@PoliklinikBaskanı,PoliklinikBashemsire=@PoliklinikBashemsire,PoliklinikYatakSayısı=@PoliklinikYatakSayısı where PoliklinikNo=@PoliklinikNo end 
GO
/****** Object:  StoredProcedure [dbo].[PKaydet]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PKaydet](

@PoliklinikAdı varchar(50),
@PoliklinikUzmanSayısı int,
@PoliklinikBaskanı varchar(50),
@PoliklinikBashemsire varchar(50),
@PoliklinikYatakSayısı int
)
as begin insert into Poliklinikler (PoliklinikAdı,PoliklinikUzmanSayısı,PoliklinikBaskanı,PoliklinikBashemsire,PoliklinikYatakSayısı)
values (@PoliklinikAdı,@PoliklinikUzmanSayısı,@PoliklinikBaskanı,@PoliklinikBashemsire,@PoliklinikYatakSayısı) end
GO
/****** Object:  StoredProcedure [dbo].[PListele]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PListele]
as begin 
select*from Poliklinikler end
GO
/****** Object:  StoredProcedure [dbo].[PSil]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PSil]
@PoliklinikNo int
as begin delete from Poliklinikler Where PoliklinikNo=@PoliklinikNo
end 
GO
/****** Object:  StoredProcedure [dbo].[PYatakSayısı]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PYatakSayısı]
as begin
select PoliklinikAdı,PoliklinikYatakSayısı from Poliklinikler end
GO
/****** Object:  StoredProcedure [dbo].[yasagoresirala]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yasagoresirala]
as begin
select*from Hastalar order by Hastayas desc
end
exec yasagoresirala
GO
/****** Object:  StoredProcedure [dbo].[yasagoresiralaartan]    Script Date: 13.12.2022 14:45:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yasagoresiralaartan]
as begin select*from Hastalar order by HastaYas asc end
GO
USE [master]
GO
ALTER DATABASE [M06] SET  READ_WRITE 
GO
