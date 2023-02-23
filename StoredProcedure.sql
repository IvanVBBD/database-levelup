USE FoodSavi;
GO

CREATE PROCEDURE  manipulateFoodStock	(@foodStockID		  INTEGER,
									                @foodTypeID     INTEGER,
                                  @storeID		  INTEGER,
                                  @sellByDate     DATE,
                                  @expirationDate DATE,
                                  @barcode        VARCHAR(30),
                                  @statementType NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO FoodStock
                        (foodTypeID,
                         storeID,
                         sellByDate ,
                         expirationDate ,
                         barcode )
            VALUES     ( @foodTypeID,
                         @storeID,
                         @sellByDate,
                         @expirationDate,
                         @barcode)
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE FoodStock
            SET    foodTypeID = @foodTypeID,
                   storeID = @storeID,
                   sellByDate = @sellByDate ,
                   expirationDate = @expirationDate ,
                   barcode = @barcode
            WHERE  foodStockID	 = @foodStockID
        END

      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM FoodStock
            WHERE  foodStockID	 = @foodStockID
        END
  END
GO


CREATE PROCEDURE  manipulateFoodStock	(@donationID    INTEGER,
									                    @foodStockID    INTEGER,
                                      @charityID		  INTEGER,
                                      @dateDonated    DATE,
                                      @statementType  NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO Donation
                        (foodStockID,
                         charityID ,
                         dateDonated)
            VALUES     (@foodStockID,
                        @charityID,
                        @dateDonated)
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE Donation
            SET    foodStockID = @foodStockID,
                   charityID = @charityID ,
                   dateDonated = @dateDonated
            WHERE  donationID = @donationID,
        END

      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Donation
            WHERE  donationID = @donationID,
        END
  END
  GO