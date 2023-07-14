USE [projectDB]
GO

/****** Object:  Table [dbo].[RecordTbl]    Script Date: 2022-11-14 오후 1:13:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordTbl](
	[Name] [nvarchar](50) NOT NULL,
	[Wod2] [nvarchar](50) NOT NULL,
	[Tlevel] [nvarchar](10) NOT NULL,
	[Record] [nvarchar](50) NOT NULL,
	[Tdate] [date] NOT NULL
) ON [PRIMARY]
GO

