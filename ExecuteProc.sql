use [FoodSavi]
GO

EXEC manipulateFoodStock @FoodID = 999, @FoodTypeID = 5, @StoreID = 13, @SellByDate = 'Feb 23, 2023', @ExpirationDate = 'Apr 11, 2023', @Barcode = 154465622, @StatementType = 'Insert'
GO

EXEC manipulateFoodStock @FoodID = 20, @FoodTypeID = 8, @StoreID = 13, @SellByDate = 'Feb 23, 2023', @ExpirationDate = 'Apr 11, 2023', @Barcode = 154465622, @StatementType = 'Update'
GO

EXEC manipulateFoodStock @FoodID = 101, @FoodTypeID = 8, @StoreID = 13, @SellByDate = 'Feb 23, 2023', @ExpirationDate = 'Apr 11, 2023', @Barcode = 154465622, @StatementType = 'Delete'
GO