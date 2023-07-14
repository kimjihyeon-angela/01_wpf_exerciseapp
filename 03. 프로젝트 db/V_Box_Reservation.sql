USE [projectDB]
GO

/****** Object:  View [dbo].[V_Box_Reservation]    Script Date: 2022-11-14 오후 1:14:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Box_Reservation] AS

SELECT A.Tdate, A.Ttime, A.Name, B.BoxName FROM ReservationTbl as A
inner join V_Box_Mem as B
	on A.Name = B.Name
GO

