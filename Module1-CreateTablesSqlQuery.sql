-- Create Customer Table
CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustAddress VARCHAR(255),
    CustPhNum VARCHAR(13)
);

-- Create OrderHeader Table
CREATE TABLE OrderHeader (
    SaleID INT PRIMARY KEY,
    SalesDate DATE,
    CustID INT,
    FOREIGN KEY (CustID) REFERENCES Customer(CustID)
);

-- Create Devices Table
CREATE TABLE Devices (
    DeviceID INT PRIMARY KEY,
    DeviceName VARCHAR(255),
    DeviceStashPrice DECIMAL(10, 2)
);
-- Create InventoryStock Table
CREATE TABLE InventoryStock (
    ItemLot INT PRIMARY KEY, 
    DeviceID INT,
    StockQuantity INT,
    ItemExpDate DATE,
    FOREIGN KEY (DeviceID) REFERENCES Devices(DeviceID)
);
-- Create OrderDetail Table
CREATE TABLE OrderDetail ( 
    SaleID INT,
    LineItem INT,
    ItemLot INT,
    QtySold INT,
    SalesPrice DECIMAL(10, 2),
    PRIMARY KEY (SaleID,LineItem),
    FOREIGN KEY (SaleID) REFERENCES OrderHeader(SaleID),
    FOREIGN KEY (ItemLot) REFERENCES InventoryStock(ItemLot)
);
 
-- Create Invoice Table
CREATE TABLE Invoice (
    Invoice INT PRIMARY KEY,
    SaleID INT,
    InvoiceTotal DECIMAL(10, 2),
    FOREIGN KEY (SaleID) REFERENCES OrderHeader(SaleID)
);	
-- Create Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CustID INT,
    Invoice INT,
    Amount DECIMAL(10, 2),
    PayMethod VARCHAR(50),
    FOREIGN KEY (CustID) REFERENCES Customer(CustID),
    FOREIGN KEY (Invoice) REFERENCES Invoice(Invoice)
); 


 
