USE [master]
GO
/****** Object:  Database [projectDB]    Script Date: 2022-11-14 오후 1:17:01 ******/
CREATE DATABASE [projectDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [projectDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [projectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [projectDB] SET  MULTI_USER 
GO
ALTER DATABASE [projectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [projectDB] SET QUERY_STORE = OFF
GO
USE [projectDB]
GO
/****** Object:  Table [dbo].[PersonManagementTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonManagementTbl](
	[Id] [nvarchar](30) NOT NULL,
	[Pw] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[BoxNum] [nvarchar](10) NOT NULL,
	[Mobile] [nvarchar](20) NULL,
 CONSTRAINT [PK_PersonManagementTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoxManagementTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoxManagementTbl](
	[BoxNum] [nvarchar](10) NOT NULL,
	[BoxName] [nvarchar](50) NOT NULL,
	[BoxMaster] [nvarchar](50) NOT NULL,
	[BoxMobile] [nvarchar](50) NOT NULL,
	[BoxId] [nvarchar](30) NOT NULL,
	[BoxPw] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_BoxManagementTbl] PRIMARY KEY CLUSTERED 
(
	[BoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Find_Id]    Script Date: 2022-11-14 오후 1:17:01 ******/
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
/****** Object:  View [dbo].[V_Box_Mem]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[V_Box_Mem] AS

select A.BoxName, b.Name, b.BirthYear, b.Gender, b.Mobile from  BoxManagementTbl as A
left outer join PersonManagementTbl  as B
	on a.BoxNum = b.BoxNum
GO
/****** Object:  Table [dbo].[CompetitionMakeTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionMakeTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[CompetitionType] [int] NOT NULL,
	[BoxName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetitionIndiMakeTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionIndiMakeTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[CompetitionType] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Mobile] [int] NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Competition]    Script Date: 2022-11-14 오후 1:17:01 ******/
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
/****** Object:  View [dbo].[V_Login]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Login] AS

SELECT A.BoxNum, A.BoxName, A.BoxId, A.BoxPw, B.Name, B.Id, B.Pw FROM BoxManagementTbl AS A
LEFT OUTER JOIN PersonManagementTbl AS B
	ON A.BoxNum = B.BoxNum
GO
/****** Object:  Table [dbo].[RecordTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordTbl](
	[Name] [nvarchar](50) NOT NULL,
	[Wod2] [nvarchar](50) NOT NULL,
	[Tlevel] [nvarchar](10) NOT NULL,
	[Record] [nvarchar](50) NOT NULL,
	[Tdate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Record]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Record] AS

SELECT B.Name, B.Gender, B.BirthYear, C.Tdate, C.Wod2, C.Tlevel, C.Record FROM PersonManagementTbl AS B
LEFT OUTER JOIN RecordTbl AS C
	ON B.Name = C.Name
GO
/****** Object:  Table [dbo].[ReservationTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
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
/****** Object:  Table [dbo].[WodTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WodTbl](
	[Tdate] [date] NOT NULL,
	[BoxName] [nvarchar](50) NULL,
	[Wod2] [nvarchar](100) NOT NULL,
	[Wod_Detail] [nvarchar](50) NOT NULL,
	[Round] [nvarchar](10) NULL,
	[Tlevel] [nvarchar](10) NULL,
	[Gender] [nvarchar](10) NULL,
	[Weight] [nvarchar](50) NULL,
	[Count] [nvarchar](30) NULL,
	[Timer] [nvarchar](20) NULL,
	[TimeCap] [nvarchar](50) NULL,
	[VideoLink] [nvarchar](max) NULL,
	[Record] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerReservationTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
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
/****** Object:  View [dbo].[V_Wod_Reservation]    Script Date: 2022-11-14 오후 1:17:01 ******/
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
/****** Object:  View [dbo].[V_Box_Reservation]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Box_Reservation] AS

SELECT A.Tdate, A.Ttime, A.Name, B.BoxName FROM ReservationTbl as A
inner join V_Box_Mem as B
	on A.Name = B.Name
GO
/****** Object:  Table [dbo].[NoticeTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticeTbl](
	[BoxName] [nvarchar](50) NOT NULL,
	[NoticeTitle] [nvarchar](50) NOT NULL,
	[NoticeContent] [ntext] NOT NULL,
	[Tdate] [date] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Box_Notice]    Script Date: 2022-11-14 오후 1:17:01 ******/
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
/****** Object:  Table [dbo].[CompetitionBoxRecordTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionBoxRecordTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[BoxName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
	[Tlevel] [nvarchar](10) NOT NULL,
	[Record] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetitionIndiRecordTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionIndiRecordTbl](
	[CompetitionName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[BirthYear] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[Mobile] [int] NOT NULL,
	[Tlevel] [nvarchar](10) NOT NULL,
	[Record] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wod_SummaryTbl]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wod_SummaryTbl](
	[Wod1] [nvarchar](50) NULL,
	[Wod2] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_Project]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_Project]  
  

/*매개변수 선언*/
	 @Option		char(1)			= null		
	,@BoxNum		nvarchar(10)		= null
	,@BoxNAME		nvarchar(50)	= null
	,@BoxMaster		nvarchar(50)	= null
	,@BoxMobile		nvarchar(50)	= null
	,@BoxId			nvarchar(50) 	= null
	,@BoxPw			nvarchar(1)		= null

	,@Id			nvarchar(30)	= null
	,@Pw			nvarchar(30)	= null
	,@Name			nvarchar(10)		= null
	,@BirthYear		date			= null
	,@Gender		int				= null

	,@NoticeTitle	nvarchar(50)	= null
	,@NoticeContent	ntext			= null
	,@Tdate			date			= null
	as 	
		
	IF		@Option	= 'A'	GOTO Searc_Proc			-- 폼 생성될 때 박스 관리 db 열어보기
	ELSE IF @Option	= 'B'	GOTO NewCode_Proc		-- 박스 번호 부여
	ELSE IF @Option = 'C'	GOTO Searc2_Proc		-- 박스 아이디 중복확인
	ELSE IF @Option = 'D'	GOTO Insert_Proc		-- 박스 회원 정보 입력
	ELSE IF @Option = 'E'	GOTO Searc3_Proc		-- 박스 번호 확인
	ELSE IF @Option = 'F'	GOTO Searc4_Proc		-- 회원 아이디 중복 확인
	ELSE IF @Option = 'G'	GOTO Insert2_Proc		-- 회원 정보 입력
	ELSE IF @Option = 'H'	GOTO Searc5_Proc		-- 로그인 정보 확인

	ELSE IF @Option = 'I'	GOTO Searc6_Proc		-- 공지사항 제목 보여주기
	ELSE IF @Option = 'J'	GOTO Searc7_Proc		-- 공지사항 내용 보여주기

	

	
--return 
-- 폼 생성될때 박스관리 db 한번 열어보기
Searc_Proc:

	SELECT * FROM BoxManagementTbl

return


-- 박스 번호 부여하기
NewCode_Proc:

	DECLARE @CNT INT
	SELECT  @CNT = COUNT(*) FROM BoxManagementTbl

	IF @CNT = 0
	BEGIN
		SET @BoxNum = 'S00001'
	END
	ELSE
	BEGIN
		SELECT @BoxNum = 'S' + FORMAT((RIGHT(TRIM(MAX(BoxNum)), 5)+1), 'D5')
		FROM BoxManagementTbl
	END

	SELECT @BoxNum AS NEWCODE

return


-- 박스 아이디 중복확인하기
Searc2_Proc:

	SELECT * FROM BoxManagementTbl
	WHERE BoxId = @BoxId

return


-- 박스 회원가입 정보 입력하기
Insert_Proc:

	DECLARE @BOXNUMCNT INT
	SELECT @BOXNUMCNT = COUNT(*) FROM BoxManagementTbl
	WHERE BoxNum = @BoxNum

	IF @BOXNUMCNT = 0
	BEGIN
		INSERT INTO BoxManagementTbl (BoxNum, BoxId, BoxMaster, BoxMobile, BoxName, BoxPw)
		VALUES (@BoxNum, @BoxId, @BoxMaster, @BoxMobile, @BoxNAME, @BoxPw)
	END

return


-- 박스 번호 확인하기
Searc3_Proc:

	SELECT * FROM BoxManagementTbl
	WHERE BoxNum = @BoxNum

return


-- 회원 아이디 중복 확인하기
Searc4_Proc:

	SELECT * FROM PersonManagementTbl
	WHERE Id = @Id

return



-- 회원 회원가입 정보 입력하기
Insert2_Proc:

	DECLARE @IdCNT INT
	SELECT @IdCNT = COUNT(*) FROM PersonManagementTbl
	WHERE Id = @Id

	IF @IdCNT = 0
	BEGIN
		INSERT INTO PersonManagementTbl (BoxNum,Id, Pw, Name, BirthYear,Gender)
		VALUES (@BoxNum,@Id, @Pw, @Name, @BirthYear,@Gender)
	END

return


-- 로그인 정보 확인
Searc5_Proc:

	SELECT A.BoxId, A.BoxPw, B.Id, B.Pw FROM BoxManagementTbl as A
	left outer join PersonManagementTbl as B
		on A.BoxNum = B.BoxNum
	WHERE A.BoxId = @BoxId
	OR	  B.Id = @Id

return

-- 공지사항제목 보여주기
Searc6_Proc:

	SELECT NoticeTitle FROM NoticeTbl
	ORDER BY Tdate

return


-- 공지사항 내용 보여주기
Searc7_Proc:

	SELECT NoticeContent =@NoticeContent FROM NoticeTbl
	WHERE NoticeTitle = @NoticeTitle

return
GO
/****** Object:  StoredProcedure [dbo].[usp_Project_Competition]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Project_Competition]  
  

/*매개변수 선언*/
	 @Option			char(1)			= null		
	,@CompetitionName	nvarchar(50)	= null
	,@CompetitionType	int				= null
	,@BoxName			nvarchar(50)	= null
	,@Name				nvarchar(10)	= null

	,@Mobile			int				= null
	,@BirthYear			date			= null


	
	as 	
		
	IF		@Option	= 'A'	GOTO Insert_Proc		-- 대회 입력하기
	ELSE IF @Option = 'B'	GOTO Searc_Proc			-- 대회 조회하기
	ELSE IF @Option = 'C'	GOTO Searc2_Proc		-- 대회 이름 별 박스 조회하기
	


--	ELSE IF @Option = 'B'	GOTO Insert_Proc		-- Wod 입력하기
--	ELSE IF @Option = 'C'	GOTO Searc2_Proc		-- Wod 출력하기 (날짜, Wod2기준 -> 회원들에게 보여주기)
--	ELSE IF @Option = 'D'   GOTO Searc3_Proc		-- Manager_Wod 확인용 출력
--	ELSE IF @Option = 'E'	GOTO Searc4_Proc		-- Wod 찾기
	

	
--return 
-- 대회 입력하기
Insert_Proc:

	INSERT INTO CompetitionMakeTbl(CompetitionName, CompetitionType, BoxName, Name)
	VALUES (@CompetitionName, @CompetitionType, @BoxName, @Name)

return


-- 대회 조회하기
Searc_Proc:

	SELECT CompetitionName, CompetitionType, BoxName, Name FROM CompetitionMakeTbl
	WHERE CompetitionName like '%@CompetitionName%'

return


-- 대회 별 박스 조회하기
Searc2_Proc:

	SELECT CompetitionName, BoxName FROM CompetitionMakeTbl
	WHERE CompetitionName like '%' + @CompetitionName + '%'

return
GO
/****** Object:  StoredProcedure [dbo].[usp_Project_Wod]    Script Date: 2022-11-14 오후 1:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Project_Wod]  
  

/*매개변수 선언*/
	 @Option		char(1)			= null		
	,@Tdate			date			= null
	,@Wod2			nvarchar(50)	= null
	,@Wod_Detail	nvarchar(50)	= null
	,@Round			nvarchar(10)		= null
	,@Tlevel		nvarchar(10)	= null
	,@Gender		nvarchar(10)	= null
	,@weight		nvarchar(10)		= null
	,@Count			nvarchar(30)	= null
	,@Timer			nvarchar(10)		= null
	,@TimeCap		nvarchar(10)		= null

	,@Wod1			nvarchar(50)	= null

	
	as 	
		
	IF		@Option	= 'A'	GOTO Searc_Proc			-- 폼 생성될 때 Wod db 열어보기
	ELSE IF @Option = 'B'	GOTO Insert_Proc		-- Wod 입력하기
	ELSE IF @Option = 'C'	GOTO Searc2_Proc		-- Wod 출력하기 (날짜, Wod2기준 -> 회원들에게 보여주기)
	ELSE IF @Option = 'D'   GOTO Searc3_Proc		-- Manager_Wod 확인용 출력
	ELSE IF @Option = 'E'	GOTO Searc4_Proc		-- Wod 찾기
	

	
--return 
-- 폼 생성될때 박스관리 db 한번 열어보기
Searc_Proc:

	SELECT * FROM WodTbl

return


-- Wod 입력
Insert_Proc:

	INSERT INTO WodTbl(Tdate, Wod2, Wod_Detail, Round, Tlevel, Gender, Weight, Count, Timer, TimeCap)
	VALUES (@Tdate, @Wod2, @Wod_Detail, @Round, @Tlevel, @Gender, @weight, @Count, @Timer, @TimeCap)

return


-- Wod 출력하기
Searc2_Proc:

	SELECT * FROM WodTbl
	WHERE Tdate = @Tdate
	AND   Tlevel = @Tlevel

return

-- Manager_Wod 확인용 출력
Searc3_Proc:

	SELECT Wod_Detail, Tlevel, Gender, Weight, Count FROM WodTbl
	WHERE Wod2  = @Wod2

return


-- Wod 찾기
Searc4_Proc:

	SELECT Wod2 = @Wod2 FROM Wod_SummaryTbl
	WHERE Wod2 LIKE '% @Wod2 %' 

return
GO
USE [master]
GO
ALTER DATABASE [projectDB] SET  READ_WRITE 
GO
