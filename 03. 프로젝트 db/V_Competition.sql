USE [projectDB]
GO

/****** Object:  View [dbo].[V_Competition]    Script Date: 2022-11-14 오후 1:14:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_Competition] AS

SELECT distinct A.CompetitionName as '박스참여 대회명'
	 , A.CompetitionType AS '참여 형태 번호 0'
	 , B.CompetitionName as '개인참여 대회명'
	 , B.CompetitionType as '참여 형태 번호 1'
FROM CompetitionMakeTbl AS A, competitionIndiMakeTbl AS B
GROUP BY A.CompetitionName, B.CompetitionName, A.CompetitionType, B.CompetitionType
GO

