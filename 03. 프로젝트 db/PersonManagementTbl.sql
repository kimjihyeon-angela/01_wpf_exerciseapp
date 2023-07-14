USE [projectDB]
GO

/****** Object:  Table [dbo].[PersonManagementTbl]    Script Date: 2022-11-14 오후 1:13:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PersonManagementTbl](
	[Id] [nvarchar](30) NOT NULL,
	[Pw] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[BoxNum] [nvarchar](10) NOT NULL,
	[Mobile] [nvarchar](20) NULL,
 CONSTRAINT [PK_PersonManagementTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

