USE [projectDB]
GO

/****** Object:  Table [dbo].[NoticeTbl]    Script Date: 2022-11-14 오후 1:12:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NoticeTbl](
	[BoxName] [nvarchar](50) NOT NULL,
	[NoticeTitle] [nvarchar](50) NOT NULL,
	[NoticeContent] [ntext] NOT NULL,
	[Tdate] [date] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

