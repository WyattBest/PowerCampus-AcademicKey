USE [PowerCampusModel]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[Academic_CreateAcademicKey] ON [dbo].[ACADEMIC]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [custom].[AcademicKey] (
		[PEOPLE_CODE_ID]
		,[ACADEMIC_YEAR]
		,[ACADEMIC_TERM]
		,[ACADEMIC_SESSION]
		,[PROGRAM]
		,[DEGREE]
		,[CURRICULUM]
		)
	SELECT PEOPLE_CODE_ID [PEOPLE_CODE_ID]
		,[ACADEMIC_YEAR]
		,[ACADEMIC_TERM]
		,[ACADEMIC_SESSION]
		,[PROGRAM]
		,[DEGREE]
		,[CURRICULUM]
	FROM inserted
	WHERE [ACADEMIC_SESSION] <> '';
END
GO

ALTER TABLE [dbo].[ACADEMIC] ENABLE TRIGGER [Academic_CreateAcademicKey]
GO


