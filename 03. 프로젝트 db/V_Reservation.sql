USE [projectDB]
GO

/****** Object:  View [dbo].[V_Wod_Reservation]    Script Date: 2022-11-14 오후 1:14:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[V_Wod_Reservation] AS
SELECT A.Tdate, A.Ttime,B.Wod2, C.Name FROM ManagerReservationTbl AS A
LEFT OUTER JOIN WodTbl AS B
	ON A.Tdate = B.Tdate
LEFT OUTER JOIN ReservationTbl AS C
	ON A.Tdate = C.Tdate

GO

