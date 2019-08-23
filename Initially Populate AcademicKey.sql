USE [PowerCampusModel]
GO


--Use if you want to populate all existing, non-rollup rows from ACADEMIC into [AcademicKey]

INSERT INTO [custom].[AcademicKey] (
	[PEOPLE_CODE_ID]
	,[ACADEMIC_YEAR]
	,[ACADEMIC_TERM]
	,[ACADEMIC_SESSION]
	,[PROGRAM]
	,[DEGREE]
	,[CURRICULUM]
	)
SELECT [PEOPLE_CODE_ID]
	,[ACADEMIC_YEAR]
	,[ACADEMIC_TERM]
	,[ACADEMIC_SESSION]
	,[PROGRAM]
	,[DEGREE]
	,[CURRICULUM]
FROM [dbo].[ACADEMIC]
WHERE [ACADEMIC_SESSION] <> ''
GO
