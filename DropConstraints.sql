USE [FoodSavi];
GO

ALTER TABLE [dbo].[Store]
	DROP CONSTRAINT [FK_Store_Address_Address]
GO

ALTER TABLE [dbo].[Charity]
	DROP CONSTRAINT [FK_Charity_Address_Address]
GO

ALTER TABLE [dbo].[Donation]
	DROP CONSTRAINT [FK_Donation_FoodID_FoodStock]
GO

ALTER TABLE [dbo].[Donation]
	DROP CONSTRAINT [FK_Donation_CharityID_Charity]
GO

ALTER TABLE [dbo].[FoodStock]
	DROP CONSTRAINT [FK_FoodStock_FoodTypeID_FoodType]
GO

ALTER TABLE [dbo].[FoodStock]
	DROP CONSTRAINT [FK_FoodStock_StoreID_Store]
GO