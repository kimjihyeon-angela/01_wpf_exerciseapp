USE [projectDB]
GO

/****** Object:  View [dbo].[V_Find_Id]    Script Date: 2022-11-14 오후 1:14:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Find_Id] AS
SELECT A.BoxNum, A.BoxName, A.BoxId, A.BoxMaster, A.BoxMobile
	 , B.Name, B.Id, B.BirthYear, B.Gender 
FROM BoxManagementTbl AS A
LEFT OUTER JOIN PersonManagementTbl AS B
	ON A.BoxNum = B.BoxNum
GO

