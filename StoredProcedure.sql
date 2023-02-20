USE FoodSavi;
GO

CREATE PROCEDURE  manipulateTable	(@FoodID		  INTEGER,
									 @FoodTypeID     INTEGER,
                                     @StoreID		  INTEGER,
                                     @SellByDate     DATE,
                                     @ExpirationDate DATE,
                                     @Barcode        VARCHAR(30),
                                     @StatementType NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO FoodStock
                        (FoodTypeID,
                         StoreID,
                         SellByDate ,
                         ExpirationDate ,
                         Barcode )
            VALUES     ( @FoodTypeID,
                         @StoreID,
                         @SellByDate,
                         @ExpirationDate,
                         @Barcode)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   FoodStock
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE FoodStock
            SET    FoodTypeID = @FoodTypeID,
                   StoreID = @StoreID,
                   SellByDate = @SellByDate ,
                   ExpirationDate = @ExpirationDate ,
                   Barcode = @Barcode
            WHERE  FoodID = @FoodID
        END

      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM FoodStock
            WHERE  FoodID = @FoodID
        END
  END