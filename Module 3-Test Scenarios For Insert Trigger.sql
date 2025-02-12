 
SELECT * FROM InventoryStock WHERE ItemLot = 105;

SELECT *
  FROM [dilek_denem].[dbo].[OrderDetail]
  WHERE SaleID = 1002 AND LineItem = 206

INSERT INTO OrderDetail (SaleID, LineItem, ItemLot, QtySold, SalesPrice)
VALUES (1002, 206, 105, 46, 699.99); --Insufficient Stock

INSERT INTO OrderDetail (SaleID, LineItem, ItemLot, QtySold, SalesPrice)
VALUES (1002, 206, 105, 41, 699.99); --Sufficient Stok

-- Check the updated stock quantity
SELECT * FROM InventoryStock WHERE ItemLot = 105;

SELECT *
  FROM [dilek_denem].[dbo].[OrderDetail]
  WHERE SaleID = 1002 AND LineItem = 206

 