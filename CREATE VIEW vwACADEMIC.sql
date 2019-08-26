

USE [Powercampusmodel]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwACADEMIC]
AS
/***********************************************************************
Description:
	Returns the ACADEMIC table plus a uniquiedentifer key. Rollup records are not included.
Usage: 
	

Revision History:
2019-08-23 Wyatt Best: Created

************************************************************************/
SELECT [id]
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
GO