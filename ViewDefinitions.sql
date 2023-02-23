USE FoodSavi;
GO

CREATE VIEW [dbo].[vFoodStockMinimal]
AS
	SELECT
		fType.FoodType,
		fStock.ExpirationDate
	FROM [dbo].[FoodType] AS fType, [dbo].[FoodStock] AS fStock
	LEFT JOIN [dbo].[Donation]
	ON fStock.FoodStockID = [dbo].[Donation].FoodStockID
	WHERE 
		fStock.FoodTypeID = fType.FoodTypeID and
		fStock.ExpirationDate > GETDATE() and
		[dbo].[Donation].FoodStockID IS NULL;
GO

CREATE VIEW [dbo].[vFoodStockExtended]
AS
	SELECT
		fType.FoodType,
		fStock.ExpirationDate,
		fStock.SellByDate,
		fStock.Barcode,
		[dbo].[Store].StoreName
	FROM
		[dbo].[FoodType] AS fType,
		[dbo].[Store],
		[dbo].[FoodStock] AS fStock
	LEFT JOIN [dbo].[Donation]
	ON fStock.FoodStockID = [dbo].[Donation].FoodStockID
	WHERE
		fStock.FoodTypeID = fType.FoodTypeID and
		fStock.StoreID = [dbo].[Store].StoreID and
		fStock.ExpirationDate > GETDATE();
GO

CREATE VIEW [dbo].[vStoreDetails]
AS
	SELECT
		str.StoreName,
		addr.Number,
		addr.Street,
		addr.ZipCOde
	FROM [dbo].[Store] AS str
	INNER JOIN [dbo].[Address] AS addr
	ON str.AddressID = addr.AddressID
GO