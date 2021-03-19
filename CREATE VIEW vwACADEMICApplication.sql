USE [Campus6]
GO

/****** Object:  View [custom].[vwACADEMICApplication]    Script Date: 2021-03-19 09:13:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [custom].[vwACADEMICApplication]
AS
/***********************************************************************
Description:
	Returns ACADEMIC session rows with a unique identifier plus some columns from the Application tables.
Usage: 
	

Revision History:
2021-03-17 Wyatt Best:	Created
************************************************************************/
SELECT [id]
	,vOT.TermId
	,RA.ApplicationId
	,ApC.OrganizationId [AppOrganizationId]
	,A.*
FROM [dbo].[ACADEMIC] A
INNER JOIN [custom].[AcademicKey] AK
	ON A.[PEOPLE_CODE_ID] = AK.[PEOPLE_CODE_ID]
		AND A.[ACADEMIC_YEAR] = AK.[ACADEMIC_YEAR]
		AND A.[ACADEMIC_TERM] = AK.[ACADEMIC_TERM]
		AND A.[ACADEMIC_SESSION] = AK.[ACADEMIC_SESSION]
		AND A.[PROGRAM] = AK.[PROGRAM]
		AND A.[DEGREE] = AK.[DEGREE]
		AND A.[CURRICULUM] = AK.[CURRICULUM]
LEFT JOIN [custom].[vwOrderedTerms] vOT
	ON vOT.ACADEMIC_YEAR = A.ACADEMIC_YEAR
		AND vOT.ACADEMIC_TERM = A.ACADEMIC_TERM
LEFT JOIN [RecruiterApplication] RA
	ON RA.RecruiterApplicationId = AK.RecruiterApplicationId
LEFT JOIN [ApplicationCampus] ApC
	ON ApC.ApplicationId = RA.ApplicationId
GO

