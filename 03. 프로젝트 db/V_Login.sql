USE [projectDB]
GO

/****** Object:  View [dbo].[V_Login]    Script Date: 2022-11-14 오후 1:14:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_Login] AS

SELECT A.BoxNum, A.BoxName, A.BoxId, A.BoxPw, B.Name, B.Id, B.Pw FROM BoxManagementTbl AS A
LEFT OUTER JOIN PersonManagementTbl AS B
	ON A.BoxNum = B.BoxNum
GO

