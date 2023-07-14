USE [projectDB]
GO

/****** Object:  Table [dbo].[ManagerReservationTbl]    Script Date: 2022-11-14 오후 1:12:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ManagerReservationTbl](
	[Tdate] [date] NOT NULL,
	[ReserveCount] [int] NOT NULL,
	[Ttime] [time](7) NOT NULL
) ON [PRIMARY]
GO

