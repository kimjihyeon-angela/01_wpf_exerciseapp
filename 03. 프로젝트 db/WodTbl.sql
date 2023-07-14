USE [projectDB]
GO

/****** Object:  Table [dbo].[WodTbl]    Script Date: 2022-11-14 오후 1:13:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WodTbl](
	[Tdate] [date] NOT NULL,
	[BoxName] [nvarchar](50) NULL,
	[Wod2] [nvarchar](100) NOT NULL,
	[Wod_Detail] [nvarchar](50) NOT NULL,
	[Round] [nvarchar](10) NULL,
	[Tlevel] [nvarchar](10) NULL,
	[Gender] [nvarchar](10) NULL,
	[Weight] [nvarchar](50) NULL,
	[Count] [nvarchar](30) NULL,
	[Timer] [nvarchar](20) NULL,
	[TimeCap] [nvarchar](50) NULL,
	[VideoLink] [nvarchar](max) NULL,
	[Record] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

