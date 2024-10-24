-- Create database
CREATE DATABASE QuanLyBanHangCongNghe;

-- Use the newly created database
USE QuanLyBanHangCongNghe;

-- Create ProductsManagement table
CREATE TABLE ProductsManagement (
    ProductCode NVARCHAR(10) PRIMARY KEY,  
    ProductName NVARCHAR(100) NOT NULL,
    SellingPrice DECIMAL(10, 2) NOT NULL,
    InventoryQuantity INT NOT NULL
);

-- Create EmployeesManagement table
CREATE TABLE EmployeesManagement (
    EmployeeCode NVARCHAR(10) PRIMARY KEY,  
    EmployeeName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50) NOT NULL,
    Authority NVARCHAR(50) NOT NULL
);

-- Create CustomersManagement table
CREATE TABLE CustomersManagement (
    CustomerCode NVARCHAR(10) PRIMARY KEY,  
    CustomerName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(15) NOT NULL,
    Address NVARCHAR(255) NOT NULL
);

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    ProductCode NVARCHAR(10) FOREIGN KEY REFERENCES ProductsManagement(ProductCode),  
    EmployeeCode NVARCHAR(10) FOREIGN KEY REFERENCES EmployeesManagement(EmployeeCode),  
    CustomerCode NVARCHAR(10) FOREIGN KEY REFERENCES CustomersManagement(CustomerCode),  
    SaleDate DATETIME NOT NULL,
    QuantitySold INT NOT NULL
);


-- Insert data into CustomersManagement
INSERT INTO CustomersManagement (CustomerCode, CustomerName, PhoneNumber, Address) VALUES
('C001', 'John Doe', '123-456-7890', '123 Elm Street'),
('C002', 'Jane Smith', '987-654-3210', '456 Oak Avenue'),
('C003', 'Mike Johnson', '555-123-4567', '789 Pine Road'),
('C004', 'Sara Connor', '555-765-4321', '321 Maple Drive'),
('C005', 'Tom Hanks', '555-987-6543', '654 Birch Lane');

-- Insert data into EmployeesManagement
INSERT INTO EmployeesManagement (EmployeeCode, EmployeeName, Position, Authority) VALUES
('E001', 'Alice Johnson', 'admin', 'Admin'),
('E002', 'Bob Smith', 'sales', 'User'),
('E003', 'Charlie Brown', 'warehouse', 'User'),
('E004', 'Diana Prince', 'employee', 'User'),
('E005', 'Ethan Hunt', 'sales', 'User');

-- Insert data into ProductsManagement
INSERT INTO ProductsManagement (ProductCode, ProductName, SellingPrice, InventoryQuantity) VALUES
('P001', 'Laptop', 1200.00, 50),
('P002', 'Smartphone', 800.00, 100),
('P003', 'Wireless Mouse', 25.00, 200),
('P004', 'External Hard Drive', 150.00, 75),
('P005', 'Monitor', 300.00, 40);

-- Insert data into Sales table
INSERT INTO Sales (ProductCode, EmployeeCode, CustomerCode, SaleDate, QuantitySold) VALUES
('P001', 'E002', 'C001', '2024-10-10', 1),  -- A Laptop sold by Bob Smith to John Doe
('P003', 'E002', 'C002', '2024-10-11', 2),     -- Two Wireless Mice sold by Bob Smith to Jane Smith
('P002', 'E001', 'C003', '2024-10-12', 1),    -- A Smartphone sold by Alice Johnson to Mike Johnson
('P004', 'E003', 'C004', '2024-10-13', 1),    -- External Hard Drive sold by Charlie Brown to Sara Connor
('P005', 'E005', 'C005', '2024-10-14', 1);    -- A Monitor sold by Ethan Hunt to Tom Hanks


SELECT * FROM CustomersManagement;
SELECT * FROM EmployeesManagement;
SELECT * FROM ProductsManagement;
SELECT * FROM Sales;