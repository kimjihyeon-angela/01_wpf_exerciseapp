USE [projectDB]
GO

/****** Object:  Table [dbo].[CompetitionIndiMakeTbl]    Script Date: 2022-11-14 오후 1:11:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompetitionIndiMakeTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[CompetitionType] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Mobile] [int] NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL
) ON [PRIMARY]
GO

