import mysql.connector

def execute_sql_file(filename):
    with open(filename, 'r') as file:
        sql = file.read()

    conn = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )
    cursor = conn.cursor()
    for result in cursor.execute(sql, multi=True):
        pass
    conn.commit()
    cursor.close()
    conn.close()

execute_sql_file('/mnt/data/Ecommerce create table.sql')

execute_sql_file('/mnt/data/Ecommerce insert data.sql')
def list_products():
    conn = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Products")
    for row in cursor.fetchall():
        print(row)
    cursor.close()
    conn.close()
def create_product(name, price, quantity):
    conn = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Products (name, price, quantity) VALUES (%s, %s, %s)", (name, price, quantity))
    conn.commit()
    cursor.close()
    conn.close()
def modify_product_quantity(product_id, new_quantity):
    conn = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )
    cursor = conn.cursor()
    cursor.execute("UPDATE Products SET quantity = %s WHERE product_id = %s", (new_quantity, product_id))
    conn.commit()
    cursor.close()
    conn.close()
def delete_product(product_id):
    conn = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password",
        database="your_database"
    )
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Products WHERE product_id = %s", (product_id,))
    conn.commit()
    cursor.close()
    conn.close()
DELIMITER //
CREATE PROCEDURE GetPopularProducts(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT product_id, name, SUM(quantity) AS total_sold
    FROM Sales
    WHERE sale_date BETWEEN start_date AND end_date
    GROUP BY product_id
    ORDER BY total_sold DESC;
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER UpdateInventory AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE Products
    SET quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/products', methods=['GET'])
def api_list_products():
    # Call list_products() and return the results as JSON
    pass

@app.route('/products', methods=['POST'])
def api_create_product():
    # Get data from request and call create_product()
    pass

# Add routes for other operations

if __name__ == '__main__':
    app.run(debug=True)
