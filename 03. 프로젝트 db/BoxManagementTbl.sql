USE [projectDB]
GO

/****** Object:  Table [dbo].[BoxManagementTbl]    Script Date: 2022-11-14 오후 1:11:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BoxManagementTbl](
	[BoxNum] [nvarchar](10) NOT NULL,
	[BoxName] [nvarchar](50) NOT NULL,
	[BoxMaster] [nvarchar](50) NOT NULL,
	[BoxMobile] [nvarchar](50) NOT NULL,
	[BoxId] [nvarchar](30) NOT NULL,
	[BoxPw] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_BoxManagementTbl] PRIMARY KEY CLUSTERED 
(
	[BoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

