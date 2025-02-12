-- Call the function to calculate total revenue
SELECT dbo.CalculateTotalRevenue() AS TotalRevenue;

INSERT INTO OrderDetail (SaleID, LineItem, ItemLot, QtySold, SalesPrice)
VALUES
(1001, 100, 105, 1, 100),  
(1001, 200, 105, 1, 200)

SELECT dbo.CalculateTotalRevenue() AS TotalRevenue;