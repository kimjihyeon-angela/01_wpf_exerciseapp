USE [projectDB]
GO

/****** Object:  View [dbo].[V_Box_Notice]    Script Date: 2022-11-14 오후 1:14:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Box_Notice] AS

SELECT A.BoxName, C.Name, B.NoticeTitle, B.NoticeContent, B.Tdate FROM BoxManagementTbl AS A
LEFT OUTER JOIN NoticeTbl AS B
	ON A.BoxName = B.BoxName
LEFT OUTER JOIN PersonManagementTbl AS C
	ON A.BoxNum = C.BoxNum
GO

