USE FoodSavi;
GO

CREATE VIEW [dbo].[vFoodStockMinimal]
AS
	SELECT
		fType.FoodType,
		fStock.ExpirationDate
	FROM [dbo].[FoodType] AS fType, [dbo].[FoodStock] AS fStock
	WHERE fStock.FoodTypeID = fType.FoodTypeID;
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
		[dbo].[FoodStock] AS fStock,
		[dbo].[Store]
	WHERE
		fStock.FoodTypeID = fType.FoodTypeID and
		fStock.StoreID = [dbo].[Store].StoreID
GO