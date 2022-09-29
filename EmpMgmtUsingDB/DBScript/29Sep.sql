USE [EmpDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_View]    Script Date: 29-09-2022 14:40:39 ******/
DROP PROCEDURE [dbo].[sp_EmpDetail_View]
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_Update]    Script Date: 29-09-2022 14:40:39 ******/
DROP PROCEDURE [dbo].[sp_EmpDetail_Update]
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_Delete]    Script Date: 29-09-2022 14:40:39 ******/
DROP PROCEDURE [dbo].[sp_EmpDetail_Delete]
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_ADD]    Script Date: 29-09-2022 14:40:39 ******/
DROP PROCEDURE [dbo].[sp_EmpDetail_ADD]
GO
/****** Object:  StoredProcedure [dbo].[sp_DummyAPIData_ADD]    Script Date: 29-09-2022 14:40:39 ******/
DROP PROCEDURE [dbo].[sp_DummyAPIData_ADD]
GO
ALTER TABLE [dbo].[EmpDetail] DROP CONSTRAINT [DF__EmpDetail__IsDel__38996AB5]
GO
ALTER TABLE [dbo].[EmpDetail] DROP CONSTRAINT [DF__EmpDetail__IsAct__37A5467C]
GO
ALTER TABLE [dbo].[EmpDetail] DROP CONSTRAINT [DF__EmpDetail__Added__36B12243]
GO
ALTER TABLE [dbo].[DummyAPIData] DROP CONSTRAINT [DF__DummyAPID__Added__49C3F6B7]
GO
/****** Object:  Table [dbo].[EmpDetail]    Script Date: 29-09-2022 14:40:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmpDetail]') AND type in (N'U'))
DROP TABLE [dbo].[EmpDetail]
GO
/****** Object:  Table [dbo].[DummyAPIData]    Script Date: 29-09-2022 14:40:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DummyAPIData]') AND type in (N'U'))
DROP TABLE [dbo].[DummyAPIData]
GO
USE [master]
GO
/****** Object:  Database [EmpDB]    Script Date: 29-09-2022 14:40:39 ******/
DROP DATABASE [EmpDB]
GO
/****** Object:  Database [EmpDB]    Script Date: 29-09-2022 14:40:39 ******/
CREATE DATABASE [EmpDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmpDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmpDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmpDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EmpDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmpDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmpDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmpDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmpDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmpDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmpDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmpDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmpDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmpDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmpDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmpDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmpDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmpDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmpDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmpDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmpDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmpDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmpDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmpDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmpDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmpDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmpDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmpDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmpDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmpDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmpDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmpDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmpDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmpDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmpDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmpDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmpDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EmpDB] SET QUERY_STORE = OFF
GO
USE [EmpDB]
GO
/****** Object:  Table [dbo].[DummyAPIData]    Script Date: 29-09-2022 14:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DummyAPIData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ResponseData] [nvarchar](max) NOT NULL,
	[APIHitStartTime] [datetime] NULL,
	[APIHitEndTime] [datetime] NULL,
	[TotalTimeTakenByAPIHit] [time](7) NULL,
	[AddedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpDetail]    Script Date: 29-09-2022 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Mob] [nvarchar](200) NOT NULL,
	[DOB] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[Salary] [decimal](10, 2) NULL,
	[DOJ] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DummyAPIData] ON 
GO
INSERT [dbo].[DummyAPIData] ([ID], [ResponseData], [APIHitStartTime], [APIHitEndTime], [TotalTimeTakenByAPIHit], [AddedOn]) VALUES (1, N'[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
  {
    "id": 2,
    "name": "Ervin Howell",
    "username": "Antonette",
    "email": "Shanna@melissa.tv",
    "address": {
      "street": "Victor Plains",
      "suite": "Suite 879",
      "city": "Wisokyburgh",
      "zipcode": "90566-7771",
      "geo": {
        "lat": "-43.9509",
        "lng": "-34.4618"
      }
    },
    "phone": "010-692-6593 x09125",
    "website": "anastasia.net",
    "company": {
      "name": "Deckow-Crist",
      "catchPhrase": "Proactive didactic contingency",
      "bs": "synergize scalable supply-chains"
    }
  },
  {
    "id": 3,
    "name": "Clementine Bauch",
    "username": "Samantha",
    "email": "Nathan@yesenia.net",
    "address": {
      "street": "Douglas Extension",
      "suite": "Suite 847",
      "city": "McKenziehaven",
      "zipcode": "59590-4157",
      "geo": {
        "lat": "-68.6102",
        "lng": "-47.0653"
      }
    },
    "phone": "1-463-123-4447",
    "website": "ramiro.info",
    "company": {
      "name": "Romaguera-Jacobson",
      "catchPhrase": "Face to face bifurcated interface",
      "bs": "e-enable strategic applications"
    }
  },
  {
    "id": 4,
    "name": "Patricia Lebsack",
    "username": "Karianne",
    "email": "Julianne.OConner@kory.org",
    "address": {
      "street": "Hoeger Mall",
      "suite": "Apt. 692",
      "city": "South Elvis",
      "zipcode": "53919-4257",
      "geo": {
        "lat": "29.4572",
        "lng": "-164.2990"
      }
    },
    "phone": "493-170-9623 x156",
    "website": "kale.biz",
    "company": {
      "name": "Robel-Corkery",
      "catchPhrase": "Multi-tiered zero tolerance productivity",
      "bs": "transition cutting-edge web services"
    }
  },
  {
    "id": 5,
    "name": "Chelsey Dietrich",
    "username": "Kamren",
    "email": "Lucio_Hettinger@annie.ca",
    "address": {
      "street": "Skiles Walks",
      "suite": "Suite 351",
      "city": "Roscoeview",
      "zipcode": "33263",
      "geo": {
        "lat": "-31.8129",
        "lng": "62.5342"
      }
    },
    "phone": "(254)954-1289",
    "website": "demarco.info",
    "company": {
      "name": "Keebler LLC",
      "catchPhrase": "User-centric fault-tolerant solution",
      "bs": "revolutionize end-to-end systems"
    }
  },
  {
    "id": 6,
    "name": "Mrs. Dennis Schulist",
    "username": "Leopoldo_Corkery",
    "email": "Karley_Dach@jasper.info",
    "address": {
      "street": "Norberto Crossing",
      "suite": "Apt. 950",
      "city": "South Christy",
      "zipcode": "23505-1337",
      "geo": {
        "lat": "-71.4197",
        "lng": "71.7478"
      }
    },
    "phone": "1-477-935-8478 x6430",
    "website": "ola.org",
    "company": {
      "name": "Considine-Lockman",
      "catchPhrase": "Synchronised bottom-line interface",
      "bs": "e-enable innovative applications"
    }
  },
  {
    "id": 7,
    "name": "Kurtis Weissnat",
    "username": "Elwyn.Skiles",
    "email": "Telly.Hoeger@billy.biz",
    "address": {
      "street": "Rex Trail",
      "suite": "Suite 280",
      "city": "Howemouth",
      "zipcode": "58804-1099",
      "geo": {
        "lat": "24.8918",
        "lng": "21.8984"
      }
    },
    "phone": "210.067.6132",
    "website": "elvis.io",
    "company": {
      "name": "Johns Group",
      "catchPhrase": "Configurable multimedia task-force",
      "bs": "generate enterprise e-tailers"
    }
  },
  {
    "id": 8,
    "name": "Nicholas Runolfsdottir V",
    "username": "Maxime_Nienow",
    "email": "Sherwood@rosamond.me",
    "address": {
      "street": "Ellsworth Summit",
      "suite": "Suite 729",
      "city": "Aliyaview",
      "zipcode": "45169",
      "geo": {
        "lat": "-14.3990",
        "lng": "-120.7677"
      }
    },
    "phone": "586.493.6943 x140",
    "website": "jacynthe.com",
    "company": {
      "name": "Abernathy Group",
      "catchPhrase": "Implemented secondary concept",
      "bs": "e-enable extensible e-tailers"
    }
  },
  {
    "id": 9,
    "name": "Glenna Reichert",
    "username": "Delphine",
    "email": "Chaim_McDermott@dana.io",
    "address": {
      "street": "Dayna Park",
      "suite": "Suite 449",
      "city": "Bartholomebury",
      "zipcode": "76495-3109",
      "geo": {
        "lat": "24.6463",
        "lng": "-168.8889"
      }
    },
    "phone": "(775)976-6794 x41206",
    "website": "conrad.com",
    "company": {
      "name": "Yost and Sons",
      "catchPhrase": "Switchable contextually-based project",
      "bs": "aggregate real-time technologies"
    }
  },
  {
    "id": 10,
    "name": "Clementina DuBuque",
    "username": "Moriah.Stanton",
    "email": "Rey.Padberg@karina.biz",
    "address": {
      "street": "Kattie Turnpike",
      "suite": "Suite 198",
      "city": "Lebsackbury",
      "zipcode": "31428-2261",
      "geo": {
        "lat": "-38.2386",
        "lng": "57.2232"
      }
    },
    "phone": "024-648-3804",
    "website": "ambrose.net",
    "company": {
      "name": "Hoeger LLC",
      "catchPhrase": "Centralized empowering task-force",
      "bs": "target end-to-end models"
    }
  }
]', CAST(N'2022-09-28T16:48:07.047' AS DateTime), CAST(N'2022-09-28T16:48:11.380' AS DateTime), CAST(N'00:00:04.3338136' AS Time), CAST(N'2022-09-28T16:49:12.810' AS DateTime))
GO
INSERT [dbo].[DummyAPIData] ([ID], [ResponseData], [APIHitStartTime], [APIHitEndTime], [TotalTimeTakenByAPIHit], [AddedOn]) VALUES (2, N'[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
  {
    "id": 2,
    "name": "Ervin Howell",
    "username": "Antonette",
    "email": "Shanna@melissa.tv",
    "address": {
      "street": "Victor Plains",
      "suite": "Suite 879",
      "city": "Wisokyburgh",
      "zipcode": "90566-7771",
      "geo": {
        "lat": "-43.9509",
        "lng": "-34.4618"
      }
    },
    "phone": "010-692-6593 x09125",
    "website": "anastasia.net",
    "company": {
      "name": "Deckow-Crist",
      "catchPhrase": "Proactive didactic contingency",
      "bs": "synergize scalable supply-chains"
    }
  },
  {
    "id": 3,
    "name": "Clementine Bauch",
    "username": "Samantha",
    "email": "Nathan@yesenia.net",
    "address": {
      "street": "Douglas Extension",
      "suite": "Suite 847",
      "city": "McKenziehaven",
      "zipcode": "59590-4157",
      "geo": {
        "lat": "-68.6102",
        "lng": "-47.0653"
      }
    },
    "phone": "1-463-123-4447",
    "website": "ramiro.info",
    "company": {
      "name": "Romaguera-Jacobson",
      "catchPhrase": "Face to face bifurcated interface",
      "bs": "e-enable strategic applications"
    }
  },
  {
    "id": 4,
    "name": "Patricia Lebsack",
    "username": "Karianne",
    "email": "Julianne.OConner@kory.org",
    "address": {
      "street": "Hoeger Mall",
      "suite": "Apt. 692",
      "city": "South Elvis",
      "zipcode": "53919-4257",
      "geo": {
        "lat": "29.4572",
        "lng": "-164.2990"
      }
    },
    "phone": "493-170-9623 x156",
    "website": "kale.biz",
    "company": {
      "name": "Robel-Corkery",
      "catchPhrase": "Multi-tiered zero tolerance productivity",
      "bs": "transition cutting-edge web services"
    }
  },
  {
    "id": 5,
    "name": "Chelsey Dietrich",
    "username": "Kamren",
    "email": "Lucio_Hettinger@annie.ca",
    "address": {
      "street": "Skiles Walks",
      "suite": "Suite 351",
      "city": "Roscoeview",
      "zipcode": "33263",
      "geo": {
        "lat": "-31.8129",
        "lng": "62.5342"
      }
    },
    "phone": "(254)954-1289",
    "website": "demarco.info",
    "company": {
      "name": "Keebler LLC",
      "catchPhrase": "User-centric fault-tolerant solution",
      "bs": "revolutionize end-to-end systems"
    }
  },
  {
    "id": 6,
    "name": "Mrs. Dennis Schulist",
    "username": "Leopoldo_Corkery",
    "email": "Karley_Dach@jasper.info",
    "address": {
      "street": "Norberto Crossing",
      "suite": "Apt. 950",
      "city": "South Christy",
      "zipcode": "23505-1337",
      "geo": {
        "lat": "-71.4197",
        "lng": "71.7478"
      }
    },
    "phone": "1-477-935-8478 x6430",
    "website": "ola.org",
    "company": {
      "name": "Considine-Lockman",
      "catchPhrase": "Synchronised bottom-line interface",
      "bs": "e-enable innovative applications"
    }
  },
  {
    "id": 7,
    "name": "Kurtis Weissnat",
    "username": "Elwyn.Skiles",
    "email": "Telly.Hoeger@billy.biz",
    "address": {
      "street": "Rex Trail",
      "suite": "Suite 280",
      "city": "Howemouth",
      "zipcode": "58804-1099",
      "geo": {
        "lat": "24.8918",
        "lng": "21.8984"
      }
    },
    "phone": "210.067.6132",
    "website": "elvis.io",
    "company": {
      "name": "Johns Group",
      "catchPhrase": "Configurable multimedia task-force",
      "bs": "generate enterprise e-tailers"
    }
  },
  {
    "id": 8,
    "name": "Nicholas Runolfsdottir V",
    "username": "Maxime_Nienow",
    "email": "Sherwood@rosamond.me",
    "address": {
      "street": "Ellsworth Summit",
      "suite": "Suite 729",
      "city": "Aliyaview",
      "zipcode": "45169",
      "geo": {
        "lat": "-14.3990",
        "lng": "-120.7677"
      }
    },
    "phone": "586.493.6943 x140",
    "website": "jacynthe.com",
    "company": {
      "name": "Abernathy Group",
      "catchPhrase": "Implemented secondary concept",
      "bs": "e-enable extensible e-tailers"
    }
  },
  {
    "id": 9,
    "name": "Glenna Reichert",
    "username": "Delphine",
    "email": "Chaim_McDermott@dana.io",
    "address": {
      "street": "Dayna Park",
      "suite": "Suite 449",
      "city": "Bartholomebury",
      "zipcode": "76495-3109",
      "geo": {
        "lat": "24.6463",
        "lng": "-168.8889"
      }
    },
    "phone": "(775)976-6794 x41206",
    "website": "conrad.com",
    "company": {
      "name": "Yost and Sons",
      "catchPhrase": "Switchable contextually-based project",
      "bs": "aggregate real-time technologies"
    }
  },
  {
    "id": 10,
    "name": "Clementina DuBuque",
    "username": "Moriah.Stanton",
    "email": "Rey.Padberg@karina.biz",
    "address": {
      "street": "Kattie Turnpike",
      "suite": "Suite 198",
      "city": "Lebsackbury",
      "zipcode": "31428-2261",
      "geo": {
        "lat": "-38.2386",
        "lng": "57.2232"
      }
    },
    "phone": "024-648-3804",
    "website": "ambrose.net",
    "company": {
      "name": "Hoeger LLC",
      "catchPhrase": "Centralized empowering task-force",
      "bs": "target end-to-end models"
    }
  }
]', CAST(N'2022-09-28T16:50:20.880' AS DateTime), CAST(N'2022-09-28T16:50:22.080' AS DateTime), CAST(N'00:00:01.2006674' AS Time), CAST(N'2022-09-28T16:50:22.617' AS DateTime))
GO
INSERT [dbo].[DummyAPIData] ([ID], [ResponseData], [APIHitStartTime], [APIHitEndTime], [TotalTimeTakenByAPIHit], [AddedOn]) VALUES (3, N'[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  },
  {
    "id": 2,
    "name": "Ervin Howell",
    "username": "Antonette",
    "email": "Shanna@melissa.tv",
    "address": {
      "street": "Victor Plains",
      "suite": "Suite 879",
      "city": "Wisokyburgh",
      "zipcode": "90566-7771",
      "geo": {
        "lat": "-43.9509",
        "lng": "-34.4618"
      }
    },
    "phone": "010-692-6593 x09125",
    "website": "anastasia.net",
    "company": {
      "name": "Deckow-Crist",
      "catchPhrase": "Proactive didactic contingency",
      "bs": "synergize scalable supply-chains"
    }
  },
  {
    "id": 3,
    "name": "Clementine Bauch",
    "username": "Samantha",
    "email": "Nathan@yesenia.net",
    "address": {
      "street": "Douglas Extension",
      "suite": "Suite 847",
      "city": "McKenziehaven",
      "zipcode": "59590-4157",
      "geo": {
        "lat": "-68.6102",
        "lng": "-47.0653"
      }
    },
    "phone": "1-463-123-4447",
    "website": "ramiro.info",
    "company": {
      "name": "Romaguera-Jacobson",
      "catchPhrase": "Face to face bifurcated interface",
      "bs": "e-enable strategic applications"
    }
  },
  {
    "id": 4,
    "name": "Patricia Lebsack",
    "username": "Karianne",
    "email": "Julianne.OConner@kory.org",
    "address": {
      "street": "Hoeger Mall",
      "suite": "Apt. 692",
      "city": "South Elvis",
      "zipcode": "53919-4257",
      "geo": {
        "lat": "29.4572",
        "lng": "-164.2990"
      }
    },
    "phone": "493-170-9623 x156",
    "website": "kale.biz",
    "company": {
      "name": "Robel-Corkery",
      "catchPhrase": "Multi-tiered zero tolerance productivity",
      "bs": "transition cutting-edge web services"
    }
  },
  {
    "id": 5,
    "name": "Chelsey Dietrich",
    "username": "Kamren",
    "email": "Lucio_Hettinger@annie.ca",
    "address": {
      "street": "Skiles Walks",
      "suite": "Suite 351",
      "city": "Roscoeview",
      "zipcode": "33263",
      "geo": {
        "lat": "-31.8129",
        "lng": "62.5342"
      }
    },
    "phone": "(254)954-1289",
    "website": "demarco.info",
    "company": {
      "name": "Keebler LLC",
      "catchPhrase": "User-centric fault-tolerant solution",
      "bs": "revolutionize end-to-end systems"
    }
  },
  {
    "id": 6,
    "name": "Mrs. Dennis Schulist",
    "username": "Leopoldo_Corkery",
    "email": "Karley_Dach@jasper.info",
    "address": {
      "street": "Norberto Crossing",
      "suite": "Apt. 950",
      "city": "South Christy",
      "zipcode": "23505-1337",
      "geo": {
        "lat": "-71.4197",
        "lng": "71.7478"
      }
    },
    "phone": "1-477-935-8478 x6430",
    "website": "ola.org",
    "company": {
      "name": "Considine-Lockman",
      "catchPhrase": "Synchronised bottom-line interface",
      "bs": "e-enable innovative applications"
    }
  },
  {
    "id": 7,
    "name": "Kurtis Weissnat",
    "username": "Elwyn.Skiles",
    "email": "Telly.Hoeger@billy.biz",
    "address": {
      "street": "Rex Trail",
      "suite": "Suite 280",
      "city": "Howemouth",
      "zipcode": "58804-1099",
      "geo": {
        "lat": "24.8918",
        "lng": "21.8984"
      }
    },
    "phone": "210.067.6132",
    "website": "elvis.io",
    "company": {
      "name": "Johns Group",
      "catchPhrase": "Configurable multimedia task-force",
      "bs": "generate enterprise e-tailers"
    }
  },
  {
    "id": 8,
    "name": "Nicholas Runolfsdottir V",
    "username": "Maxime_Nienow",
    "email": "Sherwood@rosamond.me",
    "address": {
      "street": "Ellsworth Summit",
      "suite": "Suite 729",
      "city": "Aliyaview",
      "zipcode": "45169",
      "geo": {
        "lat": "-14.3990",
        "lng": "-120.7677"
      }
    },
    "phone": "586.493.6943 x140",
    "website": "jacynthe.com",
    "company": {
      "name": "Abernathy Group",
      "catchPhrase": "Implemented secondary concept",
      "bs": "e-enable extensible e-tailers"
    }
  },
  {
    "id": 9,
    "name": "Glenna Reichert",
    "username": "Delphine",
    "email": "Chaim_McDermott@dana.io",
    "address": {
      "street": "Dayna Park",
      "suite": "Suite 449",
      "city": "Bartholomebury",
      "zipcode": "76495-3109",
      "geo": {
        "lat": "24.6463",
        "lng": "-168.8889"
      }
    },
    "phone": "(775)976-6794 x41206",
    "website": "conrad.com",
    "company": {
      "name": "Yost and Sons",
      "catchPhrase": "Switchable contextually-based project",
      "bs": "aggregate real-time technologies"
    }
  },
  {
    "id": 10,
    "name": "Clementina DuBuque",
    "username": "Moriah.Stanton",
    "email": "Rey.Padberg@karina.biz",
    "address": {
      "street": "Kattie Turnpike",
      "suite": "Suite 198",
      "city": "Lebsackbury",
      "zipcode": "31428-2261",
      "geo": {
        "lat": "-38.2386",
        "lng": "57.2232"
      }
    },
    "phone": "024-648-3804",
    "website": "ambrose.net",
    "company": {
      "name": "Hoeger LLC",
      "catchPhrase": "Centralized empowering task-force",
      "bs": "target end-to-end models"
    }
  }
]', CAST(N'2022-09-29T14:24:23.277' AS DateTime), CAST(N'2022-09-29T14:24:25.530' AS DateTime), CAST(N'00:00:02.2533752' AS Time), CAST(N'2022-09-29T14:24:29.203' AS DateTime))
GO
INSERT [dbo].[DummyAPIData] ([ID], [ResponseData], [APIHitStartTime], [APIHitEndTime], [TotalTimeTakenByAPIHit], [AddedOn]) VALUES (4, N'[{"Id":1,"Name":"Leanne Graham","CreatedBy":"Vishal Kumar","UserName":"Bret","Email":"Sincere@april.biz","address":{"Street":"Kulas Light","Suite":"Apt. 556","City":"Gwenborough","Zipcode":"92998-3874","geo":{"Lat":"-37.3159","Lng":"81.1496"}},"Phone":"1-770-736-8031 x56442","Website":"hildegard.org","company":{"Name":"Romaguera-Crona","CatchPhrase":"Multi-layered client-server neural-net"}},{"Id":2,"Name":"Ervin Howell","CreatedBy":"Vishal Kumar","UserName":"Antonette","Email":"Shanna@melissa.tv","address":{"Street":"Victor Plains","Suite":"Suite 879","City":"Wisokyburgh","Zipcode":"90566-7771","geo":{"Lat":"-43.9509","Lng":"-34.4618"}},"Phone":"010-692-6593 x09125","Website":"anastasia.net","company":{"Name":"Deckow-Crist","CatchPhrase":"Proactive didactic contingency"}},{"Id":3,"Name":"Clementine Bauch","CreatedBy":"Vishal Kumar","UserName":"Samantha","Email":"Nathan@yesenia.net","address":{"Street":"Douglas Extension","Suite":"Suite 847","City":"McKenziehaven","Zipcode":"59590-4157","geo":{"Lat":"-68.6102","Lng":"-47.0653"}},"Phone":"1-463-123-4447","Website":"ramiro.info","company":{"Name":"Romaguera-Jacobson","CatchPhrase":"Face to face bifurcated interface"}},{"Id":4,"Name":"Patricia Lebsack","CreatedBy":"Vishal Kumar","UserName":"Karianne","Email":"Julianne.OConner@kory.org","address":{"Street":"Hoeger Mall","Suite":"Apt. 692","City":"South Elvis","Zipcode":"53919-4257","geo":{"Lat":"29.4572","Lng":"-164.2990"}},"Phone":"493-170-9623 x156","Website":"kale.biz","company":{"Name":"Robel-Corkery","CatchPhrase":"Multi-tiered zero tolerance productivity"}},{"Id":5,"Name":"Chelsey Dietrich","CreatedBy":"Vishal Kumar","UserName":"Kamren","Email":"Lucio_Hettinger@annie.ca","address":{"Street":"Skiles Walks","Suite":"Suite 351","City":"Roscoeview","Zipcode":"33263","geo":{"Lat":"-31.8129","Lng":"62.5342"}},"Phone":"(254)954-1289","Website":"demarco.info","company":{"Name":"Keebler LLC","CatchPhrase":"User-centric fault-tolerant solution"}},{"Id":6,"Name":"Mrs. Dennis Schulist","CreatedBy":"Vishal Kumar","UserName":"Leopoldo_Corkery","Email":"Karley_Dach@jasper.info","address":{"Street":"Norberto Crossing","Suite":"Apt. 950","City":"South Christy","Zipcode":"23505-1337","geo":{"Lat":"-71.4197","Lng":"71.7478"}},"Phone":"1-477-935-8478 x6430","Website":"ola.org","company":{"Name":"Considine-Lockman","CatchPhrase":"Synchronised bottom-line interface"}},{"Id":7,"Name":"Kurtis Weissnat","CreatedBy":"Vishal Kumar","UserName":"Elwyn.Skiles","Email":"Telly.Hoeger@billy.biz","address":{"Street":"Rex Trail","Suite":"Suite 280","City":"Howemouth","Zipcode":"58804-1099","geo":{"Lat":"24.8918","Lng":"21.8984"}},"Phone":"210.067.6132","Website":"elvis.io","company":{"Name":"Johns Group","CatchPhrase":"Configurable multimedia task-force"}},{"Id":8,"Name":"Nicholas Runolfsdottir V","CreatedBy":"Vishal Kumar","UserName":"Maxime_Nienow","Email":"Sherwood@rosamond.me","address":{"Street":"Ellsworth Summit","Suite":"Suite 729","City":"Aliyaview","Zipcode":"45169","geo":{"Lat":"-14.3990","Lng":"-120.7677"}},"Phone":"586.493.6943 x140","Website":"jacynthe.com","company":{"Name":"Abernathy Group","CatchPhrase":"Implemented secondary concept"}},{"Id":9,"Name":"Glenna Reichert","CreatedBy":"Vishal Kumar","UserName":"Delphine","Email":"Chaim_McDermott@dana.io","address":{"Street":"Dayna Park","Suite":"Suite 449","City":"Bartholomebury","Zipcode":"76495-3109","geo":{"Lat":"24.6463","Lng":"-168.8889"}},"Phone":"(775)976-6794 x41206","Website":"conrad.com","company":{"Name":"Yost and Sons","CatchPhrase":"Switchable contextually-based project"}},{"Id":10,"Name":"Clementina DuBuque","CreatedBy":"Vishal Kumar","UserName":"Moriah.Stanton","Email":"Rey.Padberg@karina.biz","address":{"Street":"Kattie Turnpike","Suite":"Suite 198","City":"Lebsackbury","Zipcode":"31428-2261","geo":{"Lat":"-38.2386","Lng":"57.2232"}},"Phone":"024-648-3804","Website":"ambrose.net","company":{"Name":"Hoeger LLC","CatchPhrase":"Centralized empowering task-force"}}]', CAST(N'2022-09-29T14:33:22.307' AS DateTime), CAST(N'2022-09-29T14:33:23.233' AS DateTime), CAST(N'00:00:00.9262054' AS Time), CAST(N'2022-09-29T14:34:55.767' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DummyAPIData] OFF
GO
SET IDENTITY_INSERT [dbo].[EmpDetail] ON 
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (1, N'Vishal', N'Kumar', N'kumar.vishal@thinksys.com', N'8294628952', CAST(N'2001-03-15' AS Date), 21, CAST(N'2022-09-23T17:12:24.970' AS DateTime), NULL, 1, 0, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2022-09-23' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (2, N'vikash', N'kumar', N'kumar.vikash@thinksys.com', N'6299686563', CAST(N'1999-09-15' AS Date), 23, CAST(N'2022-09-26T16:31:54.270' AS DateTime), NULL, 1, 1, CAST(39999.00 AS Decimal(10, 2)), CAST(N'2020-05-15' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (3, N'Manash', N'Kumar', N'asd@jwgd.com', N'8294628953', CAST(N'1994-05-15' AS Date), 28, CAST(N'2022-09-26T18:36:44.563' AS DateTime), CAST(N'2022-09-27T12:56:27.733' AS DateTime), 1, 0, CAST(87424.00 AS Decimal(10, 2)), CAST(N'2003-05-15' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (4, N'Golden', N'Singh', N'kumar.visha@thinksys.com', N'2323322323', CAST(N'1998-09-20' AS Date), 24, CAST(N'2022-09-27T13:02:04.510' AS DateTime), CAST(N'2022-09-27T13:17:42.820' AS DateTime), 0, 0, CAST(250000.00 AS Decimal(10, 2)), CAST(N'2021-05-23' AS Date))
GO
INSERT [dbo].[EmpDetail] ([ID], [FirstName], [LastName], [Email], [Mob], [DOB], [Age], [AddedOn], [UpdatedOn], [IsActive], [IsDelete], [Salary], [DOJ]) VALUES (5, N'Ram', N'Kumar', N'Ram@gmail.com', N'5656565656', CAST(N'1996-02-15' AS Date), 26, CAST(N'2022-09-27T14:14:04.230' AS DateTime), CAST(N'2022-09-27T14:18:25.497' AS DateTime), 1, 0, CAST(6566.00 AS Decimal(10, 2)), CAST(N'2020-08-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[EmpDetail] OFF
GO
ALTER TABLE [dbo].[DummyAPIData] ADD  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[EmpDetail] ADD  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[EmpDetail] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EmpDetail] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  StoredProcedure [dbo].[sp_DummyAPIData_ADD]    Script Date: 29-09-2022 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_DummyAPIData_ADD]
	@ResponseData nvarchar(max),
	@APIHitStartTime datetime,
	@APIHitEndTime datetime,
	@TotalTimeTakenByAPIHit time
As
Begin
	Insert into DummyAPIData(ResponseData,APIHitStartTime,APIHitEndTime,TotalTimeTakenByAPIHit,AddedOn)
	Values(@ResponseData,@APIHitStartTime,@APIHitEndTime,@TotalTimeTakenByAPIHit,GETDATE())
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_ADD]    Script Date: 29-09-2022 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_EmpDetail_ADD]
	@FirstName nvarchar(200),
	@LastName nvarchar(200),
	@Email nvarchar(200),
	@Mob nvarchar(200),
	@DOB Date,
	@Salary decimal(10,2),
	@DOJ Date	
As
Begin
	if not Exists(Select * from EmpDetail where (Mob=@Mob or Email=@Email) and IsDelete=0 )
	Begin
		Insert into EmpDetail(FirstName,LastName,Email,Mob,DOB,Age,DOJ,Salary)
		Values(@FirstName,@LastName,@Email,@Mob,@DOB,DATEDIFF(MM,@DOB, getdate())/12,@DOJ,@Salary)

	Select 'Employee detail added successfully.' as StatusMessage
	End
	Else
	Begin
		Select 'Mobile No. or Email Id already exist in the database!' as StatusMessage
	End
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_Delete]    Script Date: 29-09-2022 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_EmpDetail_Delete]
	@EmpID int	
As
Begin
	Update EmpDetail
		set IsDelete=1
		Where ID=@EmpID and IsDelete=0
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_Update]    Script Date: 29-09-2022 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EmpDetail_Update]
	@EmpID int,
	@FirstName nvarchar(200),
	@LastName nvarchar(200),
	@Email nvarchar(200),
	@Mob nvarchar(200),
	@DOB Date,
	@Salary decimal(10,2),
	@DOJ Date,
	@IsActive bit
As
Begin
	if not Exists(Select * from EmpDetail where ID<>@EmpID and IsDelete=0 and  (Mob=@Mob or Email=@Email) )
	Begin
	Update EmpDetail
		set FirstName=@FirstName,
			LastName=@LastName,
			Email=@Email,
			Mob=@Mob,
			DOB=@DOB,
			Age=DATEDIFF(MM,@DOB, getdate())/12,
			Salary =@Salary,
			DOJ=@DOJ,
			UpdatedOn=GETDATE(),
			IsActive=@IsActive
		Where ID=@EmpID and IsDelete=0

		Select 'Employee detail updated successfully.' as StatusMessage
	End
	Else
	Begin
		Select 'Mobile No. or Email Id already exist in the database!' as StatusMessage
	End
End
GO
/****** Object:  StoredProcedure [dbo].[sp_EmpDetail_View]    Script Date: 29-09-2022 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_EmpDetail_View]
@EmpID int=null
As
Begin
	if(ISNULL(@EmpID,0)=0)
	Begin
		Select ID,FirstName,LastName,Email,Mob,DOB,Age,DOJ,Salary,IsActive from EmpDetail where IsDelete=0
	End
	else
	Begin
		Select ID,FirstName,LastName,Email,Mob,DOB,Age,DOJ,Salary,IsActive from EmpDetail where IsDelete=0 and ID=@EmpID
	End
End
GO
USE [master]
GO
ALTER DATABASE [EmpDB] SET  READ_WRITE 
GO
