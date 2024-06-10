DROP DATABASE IF EXISTS ecommerce; 
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Role(
role_id INT AUTO_INCREMENT,
role_name VARCHAR(100) NOT NULL UNIQUE,
roleDescription TEXT,
PRIMARY KEY(role_id)
);

CREATE TABLE Location(
location_id INT PRIMARY KEY AUTO_INCREMENT,
address VARCHAR(255) NOT NULL,
zipcode VARCHAR(20) NOT NULL,
country VARCHAR(50) NOT NULL
);

CREATE TABLE User(
user_id INT NOT NULL AUTO_INCREMENT,
fullname VARCHAR(255) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
location_id INT,
role_id INT,
phone_number VARCHAR(20),
date_of_birth DATE,
username VARCHAR(255) UNIQUE NOT NULL,
password VARCHAR(255) UNIQUE NOT NULL,
FOREIGN KEY(location_id) REFERENCES Location(location_id),
FOREIGN KEY(role_id) REFERENCES Role(role_id),
PRIMARY KEY(user_id)
);

CREATE TABLE Catalog(
catalog_id INT NOT NULL AUTO_INCREMENT,
catalog_title VARCHAR(100),
catalog_description TEXT,
PRIMARY KEY(catalog_id)

);

CREATE TABLE Product(
product_id INT PRIMARY KEY AUTO_INCREMENT ,
catalog_id INT,
name VARCHAR(255) NOT NULL,
description TEXT,
price DECIMAL(10,2) NOT NULL,
UNIQUE(product_id),
FOREIGN KEY(catalog_id) REFERENCES Catalog(catalog_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Inventory (
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );
    
    
CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    method VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderItem (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    transaction_id INT,
    product_id INT,
    quantity INT NOT NULL,
    date DATE NOT NULL,
    UNIQUE(order_id),
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (transaction_id) REFERENCES Transaction(transaction_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    rating INT NOT NULL,
    order_id INT NOT NULL,
    UNIQUE(review_id),
    FOREIGN KEY (order_id) REFERENCES Orderitem(order_id)
   );




    

	



