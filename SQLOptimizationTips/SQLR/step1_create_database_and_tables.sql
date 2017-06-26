USE master
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET NOCOUNT ON
GO


--Delete the database if it exists.
IF DB_ID('ResumeMatching') IS NOT NULL
	DROP DATABASE ResumeMatching
GO

--Create a new database called ResumeMatching
CREATE DATABASE ResumeMatching
GO

-- Enable Query Store before native module compilation  
ALTER DATABASE ResumeMatching SET QUERY_STORE = ON;  
GO 

--Create tables in RRA database
USE ResumeMatching
GO

ALTER DATABASE CURRENT SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON
GO
ALTER DATABASE CURRENT SET COMPATIBILITY_LEVEL = 130 
GO

ALTER DATABASE ResumeMatching ADD FILEGROUP imoltp_mod CONTAINS MEMORY_OPTIMIZED_DATA 
ALTER DATABASE ResumeMatching ADD FILE (name='imoltp_mod1', filename='F:\Data\imoltp_mod1') TO FILEGROUP imoltp_mod 

DROP TABLE IF EXISTS dbo.Resumes
GO

CREATE TABLE dbo.Resumes
(
	PersonId bigint NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT=100000),
	DocId bigint NOT NULL,
	RT1 float NOT NULL DEFAULT 0.0,
	RT2 float NOT NULL DEFAULT 0.0,
	RT3 float NOT NULL DEFAULT 0.0,
	RT4 float NOT NULL DEFAULT 0.0,
	RT5 float NOT NULL DEFAULT 0.0,
	RT6 float NOT NULL DEFAULT 0.0,
	RT7 float NOT NULL DEFAULT 0.0,
	RT8 float NOT NULL DEFAULT 0.0,
	RT9 float NOT NULL DEFAULT 0.0,
	RT10 float NOT NULL DEFAULT 0.0,
	RT11 float NOT NULL DEFAULT 0.0,
	RT12 float NOT NULL DEFAULT 0.0,
	RT13 float NOT NULL DEFAULT 0.0,
	RT14 float NOT NULL DEFAULT 0.0,
	RT15 float NOT NULL DEFAULT 0.0,
	RT16 float NOT NULL DEFAULT 0.0,
	RT17 float NOT NULL DEFAULT 0.0,
	RT18 float NOT NULL DEFAULT 0.0,
	RT19 float NOT NULL DEFAULT 0.0,
	RT20 float NOT NULL DEFAULT 0.0,
	RT21 float NOT NULL DEFAULT 0.0,
	RT22 float NOT NULL DEFAULT 0.0,
	RT23 float NOT NULL DEFAULT 0.0,
	RT24 float NOT NULL DEFAULT 0.0,
	RT25 float NOT NULL DEFAULT 0.0,
	RT26 float NOT NULL DEFAULT 0.0,
	RT27 float NOT NULL DEFAULT 0.0,
	RT28 float NOT NULL DEFAULT 0.0,
	RT29 float NOT NULL DEFAULT 0.0,
	RT30 float NOT NULL DEFAULT 0.0,
	RT31 float NOT NULL DEFAULT 0.0,
	RT32 float NOT NULL DEFAULT 0.0,
	RT33 float NOT NULL DEFAULT 0.0,
	RT34 float NOT NULL DEFAULT 0.0,
	RT35 float NOT NULL DEFAULT 0.0,
	RT36 float NOT NULL DEFAULT 0.0,
	RT37 float NOT NULL DEFAULT 0.0,
	RT38 float NOT NULL DEFAULT 0.0,
	RT39 float NOT NULL DEFAULT 0.0,
	RT40 float NOT NULL DEFAULT 0.0,
	RT41 float NOT NULL DEFAULT 0.0,
	RT42 float NOT NULL DEFAULT 0.0,
	RT43 float NOT NULL DEFAULT 0.0,
	RT44 float NOT NULL DEFAULT 0.0,
	RT45 float NOT NULL DEFAULT 0.0,
	RT46 float NOT NULL DEFAULT 0.0,
	RT47 float NOT NULL DEFAULT 0.0,
	RT48 float NOT NULL DEFAULT 0.0,
	RT49 float NOT NULL DEFAULT 0.0,
	RT50 float NOT NULL DEFAULT 0.0,

	INDEX IX_PersonId HASH (PersonId) with (BUCKET_COUNT=10000)
) WITH (MEMORY_OPTIMIZED=ON)
GO 


DROP TABLE IF EXISTS dbo.Projects
GO

CREATE TABLE dbo.Projects
(
	ProjectId bigint NOT NULL PRIMARY KEY NONCLUSTERED HASH WITH (BUCKET_COUNT=100000),
	PT1 float NOT NULL DEFAULT 0.0,
	PT2 float NOT NULL DEFAULT 0.0,
	PT3 float NOT NULL DEFAULT 0.0,
	PT4 float NOT NULL DEFAULT 0.0,
	PT5 float NOT NULL DEFAULT 0.0,
	PT6 float NOT NULL DEFAULT 0.0,
	PT7 float NOT NULL DEFAULT 0.0,
	PT8 float NOT NULL DEFAULT 0.0,
	PT9 float NOT NULL DEFAULT 0.0,
	PT10 float NOT NULL DEFAULT 0.0,
	PT11 float NOT NULL DEFAULT 0.0,
	PT12 float NOT NULL DEFAULT 0.0,
	PT13 float NOT NULL DEFAULT 0.0,
	PT14 float NOT NULL DEFAULT 0.0,
	PT15 float NOT NULL DEFAULT 0.0,
	PT16 float NOT NULL DEFAULT 0.0,
	PT17 float NOT NULL DEFAULT 0.0,
	PT18 float NOT NULL DEFAULT 0.0,
	PT19 float NOT NULL DEFAULT 0.0,
	PT20 float NOT NULL DEFAULT 0.0,
	PT21 float NOT NULL DEFAULT 0.0,
	PT22 float NOT NULL DEFAULT 0.0,
	PT23 float NOT NULL DEFAULT 0.0,
	PT24 float NOT NULL DEFAULT 0.0,
	PT25 float NOT NULL DEFAULT 0.0,
	PT26 float NOT NULL DEFAULT 0.0,
	PT27 float NOT NULL DEFAULT 0.0,
	PT28 float NOT NULL DEFAULT 0.0,
	PT29 float NOT NULL DEFAULT 0.0,
	PT30 float NOT NULL DEFAULT 0.0,
	PT31 float NOT NULL DEFAULT 0.0,
	PT32 float NOT NULL DEFAULT 0.0,
	PT33 float NOT NULL DEFAULT 0.0,
	PT34 float NOT NULL DEFAULT 0.0,
	PT35 float NOT NULL DEFAULT 0.0,
	PT36 float NOT NULL DEFAULT 0.0,
	PT37 float NOT NULL DEFAULT 0.0,
	PT38 float NOT NULL DEFAULT 0.0,
	PT39 float NOT NULL DEFAULT 0.0,
	PT40 float NOT NULL DEFAULT 0.0,
	PT41 float NOT NULL DEFAULT 0.0,
	PT42 float NOT NULL DEFAULT 0.0,
	PT43 float NOT NULL DEFAULT 0.0,
	PT44 float NOT NULL DEFAULT 0.0,
	PT45 float NOT NULL DEFAULT 0.0,
	PT46 float NOT NULL DEFAULT 0.0,
	PT47 float NOT NULL DEFAULT 0.0,
	PT48 float NOT NULL DEFAULT 0.0,
	PT49 float NOT NULL DEFAULT 0.0,
	PT50 float NOT NULL DEFAULT 0.0, 

	INDEX IX_ProjectId HASH (ProjectId) WITH (BUCKET_COUNT=10000)
) WITH (MEMORY_OPTIMIZED=ON)
GO 

DROP TABLE IF EXISTS dbo.LabeledData
GO

CREATE TABLE dbo.LabeledData
(
	Label tinyint NOT NULL,
	DocId bigint NOT NULL,
	ProjectId bigint NOT NULL
)
GO

DROP TABLE IF EXISTS dbo.ClassificationModelR
GO

CREATE TABLE dbo.ClassificationModelR
(
	modelName varchar(100) not null,
	model varbinary(max) not null
)
GO

DROP TABLE IF EXISTS dbo.PredictionsR
GO

CREATE TABLE dbo.PredictionsR
(
	[id] bigint IDENTITY(1,1) PRIMARY KEY NONCLUSTERED, 
	[PersonId] [bigint] NOT NULL,
	[DocId] [bigint] NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[Probability] [float] NOT NULL,
) WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA)
GO

DROP TABLE IF EXISTS dbo.scoring_stats
GO

CREATE TABLE dbo.scoring_stats
(
	project_id bigint NOT NULL,
	group_id int NOT NULL,
	match_row_count int NOT NULL,
	start_time datetime2 NOT NULL,
	end_time datetime2 NOT NULL,
	r_predict_duration float NOT NULL,
	total_duration float NOT NULL,
	rate_prediction float NOT NULL
)
GO