USE [Campus6]
GO

/****** Object:  UserDefinedFunction [custom].[fnGetCurrentTermId]    Script Date: 2021-04-15 11:39:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Wyatt Best
-- Create date: 2021-04-15
-- Description:	Return the current TermId (int) according to [custom].vwOrderedTerms
-- =============================================
CREATE FUNCTION [custom].[fnGetCurrentTermId] ()
RETURNS INT
AS
BEGIN
	DECLARE @TermId INT

	SELECT @TermId = (
			SELECT TermId
			FROM [custom].[vwOrderedTerms]
			WHERE ACADEMIC_YEAR = dbo.fnGetAbtSetting('ACA_RECORDS', 'CURRENT_YT', 'CURRENT_YEAR')
				AND ACADEMIC_TERM = dbo.fnGetAbtSetting('ACA_RECORDS', 'CURRENT_YT', 'CURRENT_TERM')
			)

	RETURN @TermId
END
GO

