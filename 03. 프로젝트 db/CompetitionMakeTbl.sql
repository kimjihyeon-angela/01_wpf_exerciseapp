USE [projectDB]
GO

/****** Object:  Table [dbo].[CompetitionMakeTbl]    Script Date: 2022-11-14 오후 1:12:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompetitionMakeTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[CompetitionType] [int] NOT NULL,
	[BoxName] [nvarchar](50) NULL
) ON [PRIMARY]
GO

