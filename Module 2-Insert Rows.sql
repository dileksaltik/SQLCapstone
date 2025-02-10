-- Insert into Customer Table
INSERT INTO Customer (CustID, CustomerName, CustAddress, CustPhNum)
VALUES
(1, 'John Doe', '123 Main St', '1234567890'),
(2, 'Jane Smith', '456 Elm St', '2345678901'),
(3, 'Alice Johnson', '789 Oak St', '3456789012'),
(4, 'Bob Brown', '101 Pine St', '4567890123'),
(5, 'Charlie Davis', '202 Maple St', '5678901234');

-- Insert into Devices Table
INSERT INTO Devices (DeviceID, DeviceName, DeviceStashPrice)
VALUES
(1, 'Smartphone X', 699.99),
(2, 'Laptop Pro', 1299.99),
(3, 'Tablet Mini', 399.99),
(4, 'Smartwatch 2', 199.99),
(5, 'Headphones Plus', 149.99);

-- Insert into InventoryStock Table
INSERT INTO InventoryStock (ItemLot, DeviceID, StockQuantity, ItemExpDate)
VALUES
(101, 1, 50, '2025-12-31'),
(102, 2, 30, '2025-11-30'),
(103, 3, 40, '2025-10-31'),
(104, 4, 60, '2025-09-30'),
(105, 5, 70, '2025-08-31');

-- Insert into OrderHeader Table
INSERT INTO OrderHeader (SaleID, SalesDate, CustID)
VALUES
(1001, '2023-10-01', 1),
(1002, '2023-10-02', 2),
(1003, '2023-10-03', 3),
(1004, '2023-10-04', 4),
(1005, '2023-10-05', 5);

-- Insert into OrderDetail Table
INSERT INTO OrderDetail (SaleID, LineItem, ItemLot, QtySold, SalesPrice)
VALUES
(1001, 1, 101, 2, 699.99),
(1001, 2, 105, 1, 149.99),
(1002, 1, 102, 1, 1299.99),
(1003, 1, 103, 3, 399.99),
(1004, 1, 104, 2, 199.99);

-- Insert into Invoice Table
INSERT INTO Invoice (Invoice, SaleID, InvoiceTotal)
VALUES
(5001, 1001, 1549.97),
(5002, 1002, 1299.99),
(5003, 1003, 1199.97),
(5004, 1004, 399.98),
(5005, 1005, 0.77); 

-- Insert into Payment Table
INSERT INTO Payment (PaymentID, CustID, Invoice, Amount, PayMethod)
VALUES
(7001, 1, 5001, 1549.97, 'Credit Card'),
(7002, 2, 5002, 1299.99, 'PayPal'),
(7003, 3, 5003, 1199.97, 'Credit Card'),
(7004, 4, 5004, 399.98, 'Cash'),
(7005, 5, 5005, 0.66, 'Credit Card');  