USE [Campus6]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [custom].[vwOrderedTerms]
AS
/***********************************************************************
Description:
	Return a gapless list of terms in order. This may require customization for your institution's academic calendar.
Usage: 
	

Revision History:
2023-10-02 Wyatt Best: Created

************************************************************************/
SELECT ACADEMIC_YEAR
	,ACADEMIC_TERM
	,RANK() OVER (
		ORDER BY [START_DATE]
		) [TermId] --Rank Terms
FROM (
	SELECT --Get the earliest row for each ACADEMIC_TERM
		ACADEMIC_YEAR
		,ACADEMIC_TERM
		,MIN(START_DATE) [START_DATE]
	FROM ACADEMICCALENDAR
	GROUP BY ACADEMIC_YEAR
		,ACADEMIC_TERM
	) [MinTerms]

/*
--Alternate example method
SELECT ACADEMIC_YEAR
	,ACADEMIC_TERM
	,RANK() OVER (
		ORDER BY ACADEMIC_YEAR
			,CAT.SORT_ORDER
		) [TermId]
FROM ACADEMICCALENDAR ACAL
INNER JOIN CODE_ACATERM CAT
	ON CAT.CODE_VALUE_KEY = ACAL.ACADEMIC_TERM
GROUP BY ACADEMIC_YEAR
	,ACADEMIC_TERM
	,CAT.SORT_ORDER
*/

GO


