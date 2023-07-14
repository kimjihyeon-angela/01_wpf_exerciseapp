USE [projectDB]
GO

/****** Object:  Table [dbo].[ReservationTbl]    Script Date: 2022-11-14 오후 1:13:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ReservationTbl](
	[Tdate] [date] NOT NULL,
	[Ttime] [time](7) NOT NULL,
	[Name] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO

