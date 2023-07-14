USE [projectDB]
GO

/****** Object:  Table [dbo].[CompetitionBoxRecordTbl]    Script Date: 2022-11-14 오후 1:12:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompetitionBoxRecordTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[BoxName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[Tlevel] [nvarchar](10) NOT NULL,
	[Record] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

