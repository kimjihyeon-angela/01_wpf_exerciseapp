USE [projectDB]
GO

/****** Object:  Table [dbo].[CompetitionIndiRecordTbl]    Script Date: 2022-11-14 오후 1:12:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompetitionIndiRecordTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[Mobile] [int] NOT NULL,
	[Tlevel] [nvarchar](10) NOT NULL,
	[Record] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

