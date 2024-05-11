-- Create Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES ProductCategory(CategoryID)
);

-- Create Inventory table 
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Create User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL
);

-- Create Address table
CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    UserID INT,
    Street VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Transaction table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    UserID INT,
    TransactionDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create TransactionDetail table
CREATE TABLE TransactionDetail (
    TransactionID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (TransactionID, ProductID),
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Create Review table
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Rating INT NOT NULL,
    Comment TEXT,
    ReviewDate DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
-- Create ProductCategory table
CREATE TABLE ProductCategory (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);