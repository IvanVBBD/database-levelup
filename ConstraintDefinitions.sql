USE [FoodSavi];
GO

ALTER TABLE [dbo].[Store]
	ADD CONSTRAINT [FK_Store_Address_Address] FOREIGN KEY ([Address]) REFERENCES [dbo].[Address] ([AddressID]);
GO

ALTER TABLE [dbo].[Charity]
	ADD CONSTRAINT [FK_Charity_Address_Address] FOREIGN KEY ([Address]) REFERENCES [dbo].[Address] ([AddressID]);
GO

ALTER TABLE [dbo].[Donation]
	ADD CONSTRAINT [FK_Donation_FoodID_FoodStock] FOREIGN KEY ([FoodID]) REFERENCES [dbo].[FoodStock] ([FoodID]);
GO

ALTER TABLE [dbo].[Donation]
	ADD CONSTRAINT [FK_Donation_CharityID_Charity] FOREIGN KEY ([CharityID]) REFERENCES [dbo].[Charity] ([CharityID]);
GO

ALTER TABLE [dbo].[FoodStock]
	ADD CONSTRAINT [FK_FoodStock_FoodTypeID_FoodType] FOREIGN KEY ([FoodTypeID]) REFERENCES [dbo].[FoodType] ([FoodTypeID]);
GO

ALTER TABLE [dbo].[FoodStock]
	ADD CONSTRAINT [FK_FoodStock_StoreID_Store] FOREIGN KEY ([StoreID]) REFERENCES [dbo].[Store] ([StoreID]);
GO