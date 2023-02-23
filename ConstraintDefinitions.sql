USE [FoodSavi];
GO

-- Foreign Keys

ALTER TABLE [dbo].[Store]
	ADD CONSTRAINT [FK_Store_AddressID_Address] FOREIGN KEY ([AddressID]) REFERENCES [dbo].[Address] ([AddressID]);
GO

ALTER TABLE [dbo].[Charity]
	ADD CONSTRAINT [FK_Charity_AddressID_Address] FOREIGN KEY ([AddressID]) REFERENCES [dbo].[Address] ([AddressID]);
GO

ALTER TABLE [dbo].[Donation]
	ADD CONSTRAINT [FK_Donation_FoodStockID_FoodStock] FOREIGN KEY ([FoodStockID]) REFERENCES [dbo].[FoodStock] ([FoodStockID]);
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

-- Expiry Date Checks

ALTER TABLE [dbo].[FoodStock] WITH NOCHECK
	ADD CONSTRAINT [CHK_FoodStock_ExpiryDate_Before_Today] CHECK (ExpirationDate > GETDATE())
GO