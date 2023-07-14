USE [projectDB]
GO

/****** Object:  View [dbo].[V_Box_Mem]    Script Date: 2022-11-14 오후 1:13:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[V_Box_Mem] AS

select A.BoxName, b.Name, b.BirthYear, b.Gender, b.Mobile from  BoxManagementTbl as A
left outer join PersonManagementTbl  as B
	on a.BoxNum = b.BoxNum
GO

