USE FoodSavi;

GO

CREATE FUNCTION count_donations_to_charity (
	@CharityID int
)
RETURNS int
AS
BEGIN
	DECLARE @donationCount int
	SELECT @donationCount = COUNT(*) FROM [dbo].Donation
	WHERE CharityID = @CharityID
	RETURN @donationCount
END
GO

CREATE FUNCTION food_type_donated(
	@DonationID int
)
RETURNS VARCHAR(max)
AS
BEGIN
	DECLARE @retreivedFoodID int
	SELECT @retreivedFoodID = FoodStockID FROM [dbo].Donation
	WHERE DonationID = @DonationID

	DECLARE @FoodtypeID int
	SELECT @FoodtypeID = FoodTypeID FROM [dbo].FoodStock
	WHERE FoodStockID = @retreivedFoodID 

	DECLARE @ReturnValue varchar(MAX)
	SELECT @ReturnValue = FoodType FROM [dbo].FoodType
	WHERE FoodTypeID = @FoodtypeID

	RETURN @ReturnValue
END
GO

CREATE FUNCTION find_store_from_donation(
	@DonationID int
)
RETURNS INT
AS
BEGIN
	DECLARE @retreivedFoodID int
	SELECT @retreivedFoodID = FoodStockID FROM [dbo].Donation
	WHERE DonationID = @DonationID

	DECLARE @StoreID int
	SELECT @StoreID = StoreID FROM [dbo].FoodStock
	WHERE FoodStockID = @retreivedFoodID 

	RETURN @StoreID
END
GO

CREATE FUNCTION count_store_donations(
	@StoreID int
)
RETURNS INT
AS
BEGIN
	DECLARE @ReturnValue int
	DECLARE @TempHolder int
	SELECT @TempHolder = DonationID FROM [dbo].Donation
	SELECT @ReturnValue = COUNT(*) FROM [dbo].Donation WHERE [dbo].find_store_from_donation(@TempHolder) = @StoreID
	RETURN @ReturnValue
END
GO






