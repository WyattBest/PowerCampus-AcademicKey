USE [PowerCampusModel]
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [custom].[AcademicKey] (
	[id] [uniqueidentifier] CONSTRAINT [df_AcademicKey_id] DEFAULT(NEWSEQUENTIALID())
	,[PEOPLE_CODE_ID] [nvarchar](10) NOT NULL
	,[ACADEMIC_YEAR] [nvarchar](4) NOT NULL
	,[ACADEMIC_TERM] [nvarchar](10) NOT NULL
	,[ACADEMIC_SESSION] [nvarchar](10) NOT NULL
	,[PROGRAM] [nvarchar](6) NOT NULL
	,[DEGREE] [nvarchar](6) NOT NULL
	,[CURRICULUM] [nvarchar](6) NOT NULL
	,[RecruiterApplicationId] int NULL
	,CONSTRAINT [pk_AcademicKey] PRIMARY KEY NONCLUSTERED ([id])
	,CONSTRAINT [ak_AcademicKey] UNIQUE CLUSTERED (
		[PEOPLE_CODE_ID]
		,[ACADEMIC_YEAR]
		,[ACADEMIC_TERM]
		,[ACADEMIC_SESSION]
		,[PROGRAM]
		,[DEGREE]
		,[CURRICULUM]
		)
	,CONSTRAINT [fk_AcademicKey_ACADEMIC] FOREIGN KEY (
		[PEOPLE_CODE_ID]
		,[ACADEMIC_YEAR]
		,[ACADEMIC_TERM]
		,[ACADEMIC_SESSION]
		,[PROGRAM]
		,[DEGREE]
		,[CURRICULUM]
		) REFERENCES [dbo].[ACADEMIC]([PEOPLE_CODE_ID], [ACADEMIC_YEAR], [ACADEMIC_TERM], [ACADEMIC_SESSION], [PROGRAM], [DEGREE], [CURRICULUM])
		ON UPDATE CASCADE
		ON DELETE CASCADE
	,CONSTRAINT [fk_RecruiterApplicationId]
		FOREIGN KEY ([RecruiterApplicationId])
		REFERENCES [dbo].[RecruiterApplication] ([RecruiterApplicationId])
		ON UPDATE CASCADE
		ON DELETE SET NULL
	)
GO

CREATE NONCLUSTERED INDEX [ix_AcademicKey] ON [custom].[AcademicKey]
(
	[RecruiterApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

