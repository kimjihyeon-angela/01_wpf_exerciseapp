USE [projectDB]
GO

/****** Object:  View [dbo].[V_Record]    Script Date: 2022-11-14 오후 1:14:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Record] AS

SELECT B.Name, B.Gender, B.BirthYear, C.Tdate, C.Wod2, C.Tlevel, C.Record FROM PersonManagementTbl AS B
LEFT OUTER JOIN RecordTbl AS C
	ON B.Name = C.Name
GO

