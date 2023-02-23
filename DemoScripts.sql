-- Upload FoodStock

SELECT * FROM [dbo].[FoodType];
GO

EXEC manipulateFoodStock @FoodID = 999, @FoodTypeID = 5, @StoreID = 13, @SellByDate = 'Feb 23, 2023', @ExpirationDate = 'Apr 11, 2023', @Barcode = 154465622, @StatementType = 'Insert'
GO

-- Before Update and Remove below

SELECT * FROM [dbo].[FoodStock]
WHERE StoreID = 13;
GO


-- Update FoodStock

EXEC manipulateFoodStock @FoodID = 101, @FoodTypeID = 8, @StoreID = 13, @SellByDate = 'Feb 23, 2023', @ExpirationDate = 'Apr 11, 2023', @Barcode = 154465622, @StatementType = 'Update'
GO

-- Remove FoodStock

EXEC manipulateFoodStock @FoodID = 101, @FoodTypeID = 8, @StoreID = 13, @SellByDate = 'Feb 23, 2023', @ExpirationDate = 'Apr 11, 2023', @Barcode = 154465622, @StatementType = 'Delete'
GO

-- Get FoodStock Catalogue

SELECT * FROM [dbo].[vFoodStockExtended];

-- Claim Donated Food

DECLARE @curDate date = GETDATE()
EXEC manipulateDonation @DonationID = 999, @FoodStockID = 1, @CharityID = 5, @DateDonated = @curDate, @StatementType = 'INSERT'
GO

