USE [Campus6]
GO

--Use this if you implemented the AcademicKey table before RecruiterApplicationId column was added.
--Otherwise, use the main CREATE TABLE AcademicKey.sql script
ALTER TABLE [custom].[AcademicKey]
	ADD [RecruiterApplicationId] int NULL
	CONSTRAINT [fk_RecruiterApplicationId]
		FOREIGN KEY ([RecruiterApplicationId]) REFERENCES [dbo].[RecruiterApplication] ([RecruiterApplicationId])
		ON UPDATE CASCADE;
GO
