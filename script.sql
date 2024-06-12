
-- Drop database if it exists
DROP DATABASE IF EXISTS ecommerce_marketplace;

-- Create database
CREATE DATABASE ecommerce_marketplace;

-- Use the created database
USE ecommerce_marketplace;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS ProductCategoryMapping;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS ProductCategories;
DROP TABLE IF EXISTS Users;

-- Create Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);

-- Create Products Table with auto-incrementing ProductID
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Stock INT
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create OrderDetails Table with ON DELETE CASCADE
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Create ProductCategories Table
CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Create ProductCategoryMapping Table
CREATE TABLE ProductCategoryMapping (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID)
);

-- Insert Users
INSERT INTO Users (UserID, Name, Email, Address) VALUES 
(1, 'John Doe', 'john@example.com', '123 Elm St'),
(2, 'Jane Smith', 'jane@example.com', '456 Oak St'),
(3, 'Alice Johnson', 'alice@example.com', '789 Pine St'),
(4, 'Bob Brown', 'bob@example.com', '321 Maple St'),
(5, 'Charlie Davis', 'charlie@example.com', '654 Birch St');

-- Insert Products
INSERT INTO Products (Name, Description, Price, Stock) VALUES 
('Laptop', 'High performance laptop', 999.99, 50),
('Phone', 'Latest smartphone', 799.99, 100),
('Tablet', 'High resolution tablet', 499.99, 150),
('Headphones', 'Noise cancelling headphones', 199.99, 200),
('Smartwatch', 'Feature-rich smartwatch', 299.99, 75);

-- Insert Orders
INSERT INTO Orders (OrderID, UserID, OrderDate) VALUES 
(1, 1, '2023-01-01'),
(2, 2, '2023-02-01'),
(3, 3, '2023-03-01'),
(4, 4, '2023-04-01'),
(5, 5, '2023-05-01');

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES 
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 5, 2);

-- Insert ProductCategories
INSERT INTO ProductCategories (CategoryID, CategoryName) VALUES 
(1, 'Electronics'),
(2, 'Computers'),
(3, 'Accessories');

-- Insert ProductCategoryMapping
INSERT INTO ProductCategoryMapping (ProductID, CategoryID) VALUES 
(1, 2),
(2, 1),
(3, 1),
(4, 3),
(5, 1);

-- Delete a product
DELETE FROM Products WHERE ProductID = 2;

-- Verify the deletion
SELECT * FROM Products;
SELECT * FROM OrderDetails;
