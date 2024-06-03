USE ecommerce;
-- Role table
INSERT INTO Role (role_name, roleDescription) VALUES
('admin', 'All permissions to system: view, edit, delete, refund' ),
('customer', 'Limited permission to system: view, order, pay');

--  Location table
INSERT INTO Location (address, zipcode, country) VALUES
('123 Main St', '12345', 'USA'),
('456 Elm St', '67890', 'USA'),
('789 Oak St', '54321', 'USA'),
('101 Pine St', '98765', 'USA'),
('202 Maple St', '65432', 'USA'),
('303 Birch St', '32154', 'USA'),
('404 Cedar St', '13579', 'USA'),
('505 Spruce St', '24680', 'USA'),
('606 Fir St', '11223', 'USA'),
('707 Ash St', '44556', 'USA');

-- User table
INSERT INTO User (fullname, email, role_id, phone_number, date_of_birth, username, password) VALUES
('Aman Gyawali','aman.gyawali@gmail.com', 1, '123-456-7890', '1980-01-01', 'aman_gyawali', 'password1' ),
('Manita Regmi','manuregmi02@gmail.com', 2, '234-567-8901', '1990-02-02', 'manita_regmi', 'password2'),
('Amar Shrestha', 'amarshrestha14@gmail.com', 2, '345-678-9012', '2000-03-03', 'amar_shrestha', 'password3'),
('Rusha Khatri', 'rushakhatri16@gmail.com', 2, '456-789-0123', '1985-04-04', 'rusha_kjatri', 'password4'),
('Rija Koju', 'rijakoju24@gmail.com', 2, '567-890-1234', '1975-05-05', 'rija_koju', 'password5'),
('Puja Budhathoki', 'puja@gmail.com', 2, '678-901-2345', '1995-06-06', 'puja_budhathoki', 'password6'),
( 'Sujit Neupane', 'sujitneupane12@gmailcom',  2, '789-012-3456', '1988-07-07', 'sujit_neupane', 'password7'),
('Karen Hall', 'karen.hall@example.com',  2, '890-123-4567', '1978-08-08', 'karen_hall', 'password8'),
('Nancy King', 'nancy.king@example.com',  2, '901-234-5678', '1992-09-09', 'nancy_king', 'password9'),
('Peter Clark', 'peter.clark@example.com',  2, '012-345-6789', '1982-10-10', 'peter_clark', 'password10');


--  Catalog table
INSERT INTO Catalog (catalog_title, catalog_description) VALUES
('Men\'s Shirts', 'Collection of men\'s beaver shirts'),
('Women\'s Shirts', 'Collection of women\'s beaver shirts'),
('Kids\' Shirts', 'Collection of kids\' beaver shirts'),
('Unisex Shirts', 'Collection of unisex beaver shirts'),
('Sports Shirts', 'Collection of sports beaver shirts'),
('Formal Shirts', 'Collection of formal beaver shirts'),
('Casual Shirts', 'Collection of casual beaver shirts'),
('Vintage Shirts', 'Collection of vintage beaver shirts'),
('Graphic Shirts', 'Collection of graphic beaver shirts'),
('Customized Shirts', 'Collection of customized beaver shirts');

--  Product table
INSERT INTO Product (catalog_id,name, description, price) VALUES
('1','Classic Beaver Shirt', 'A classic beaver shirt for men', 29.99),
('2','Beaver T-Shirt', 'Casual beaver t-shirt for women', 19.99),
('3','Beaver Hoodie', 'Warm beaver hoodie for kids', 39.99),
('4','Beaver Polo', 'Stylish beaver polo shirt for men', 34.99),
('5','Beaver Tank Top', 'Comfortable beaver tank top for women', 24.99),
('6','Beaver Sports Shirt', 'High performance beaver sports shirt', 49.99),
('7','Beaver Formal Shirt', 'Elegant beaver formal shirt', 54.99),
('8','Beaver Casual Shirt', 'Relaxed fit beaver casual shirt', 22.99),
('9','Vintage Beaver Shirt', 'Classic vintage beaver shirt', 44.99),
('10','Graphic Beaver Shirt', 'Trendy graphic beaver shirt', 27.99);

--  Inventory table
INSERT INTO Inventory ( product_id, quantity) VALUES
(1, 100),
(2, 50),
(3, 20),
(4, 30),
(5, 200),
(6, 150),
(7, 100),
(8, 80),
(9, 60),
(10, 120);

--  Transaction table
INSERT INTO Transaction (date, method, status, total_amount) VALUES
('2024-05-01', 'Credit Card', 'Completed', 59.98),
('2024-05-02', 'PayPal', 'Pending', 74.98),
('2024-05-03', 'Credit Card', 'Completed', 39.99),
('2024-05-04', 'Credit Card', 'Completed', 34.99),
('2024-05-05', 'PayPal', 'Pending', 49.99),
('2024-05-06', 'Credit Card', 'Completed', 54.99),
('2024-05-07', 'PayPal', 'Pending', 22.99),
('2024-05-08', 'Credit Card', 'Completed', 44.99),
('2024-05-09', 'PayPal', 'Pending', 27.99),
('2024-05-10', 'Credit Card', 'Completed', 29.99);

-- OrderItem table
INSERT INTO OrderItem (transaction_id, product_id, quantity, date, status) VALUES
( 1, 1, 1, '2024-05-01', 'Delivered'),
( 1, 2, 1, '2024-05-01', 'Delivered'),
( 2, 4, 1, '2024-05-02', 'Shipped'),
( 3, 3, 1, '2024-05-03', 'Processing'),
( 4, 5, 1, '2024-05-04', 'Delivered'),
( 5, 6, 1, '2024-05-05', 'Shipped'),
( 6, 7, 1, '2024-05-06', 'Delivered'),
( 7, 8, 1, '2024-05-07', 'Processing'),
( 8, 9, 1, '2024-05-08', 'Delivered'),
( 9, 10, 1, '2024-05-09', 'Shipped'),
( 10, 1, 1, '2024-05-10', 'Processing');

--  Review table
INSERT INTO Review (order_id, rating) VALUES
(1, 5),
(2, 4),
(3, 3),
(4, 4),
(5, 5),
(6, 4),
(7, 3),
(8, 5),
(9, 4),
(10,3);



