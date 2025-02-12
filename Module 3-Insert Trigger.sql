CREATE TRIGGER trg_UpdateStockQuantity
ON OrderDetail
AFTER INSERT
AS
BEGIN
    -- Declare variables 
    DECLARE @ItemLot INT;
    DECLARE @QtySold INT;
	DECLARE @CurrentStock iNT;

    -- Get ItemLot ve QtySold from the inserted row
    SELECT @ItemLot = ItemLot ,  @QtySold = QtySold
    FROM inserted;
	-- Start a transaction 
	--This is needed to lock the row and avoid for wrong calculations if there are many inserts related to same itemlot at the same time.
	BEGIN TRANSACTION;
	
	-- Get the current stock quantity with UPDLOCK to lock the row
	SELECT @CurrentStock = StockQuantity
    FROM InventoryStock WITH (UPDLOCK)
    WHERE ItemLot = @ItemLot;

	WAITFOR DELAY '00:00:15'

	IF (@CurrentStock - @QtySold < 0)
    BEGIN
        -- If stock is insufficient, raise an error and rollback the transaction
        RAISERROR('Insufficient stock! Stock quantity cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
		-- -- If stock is sufficient, update the stock quantity
        UPDATE InventoryStock
        SET StockQuantity = StockQuantity - @QtySold
        WHERE ItemLot = @ItemLot;

        -- Commit the transaction
        COMMIT TRANSACTION;
    END
END;