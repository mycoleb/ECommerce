import mysql.connector
from datetime import datetime, timedelta
import tkinter as tk
from tkinter import ttk, messagebox

# Database connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="eric",
    database="ecommerce_marketplace"
)
cursor = db.cursor()

# Function to display menu and get user choice
def display_menu():
    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="E-commerce Marketplace Application", font=("Helvetica", 16)).pack(pady=10)
    ttk.Button(root, text="List products in inventory", command=list_products).pack(pady=5)
    ttk.Button(root, text="Create new product", command=create_product).pack(pady=5)
    ttk.Button(root, text="Modify product stock", command=modify_product_stock).pack(pady=5)
    ttk.Button(root, text="Delete product", command=delete_product).pack(pady=5)
    ttk.Button(root, text="Get popular products for a time range", command=get_popular_products).pack(pady=5)
    ttk.Button(root, text="Get unpopular products for a time range", command=get_unpopular_products).pack(pady=5)
    ttk.Button(root, text="Get users who haven't ordered in a few months", command=get_inactive_users).pack(pady=5)
    ttk.Button(root, text="Exit", command=root.quit).pack(pady=20)

# List products in inventory
def list_products():
    cursor.execute("SELECT Name, Description, Price, Stock FROM Products")
    products = cursor.fetchall()
    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="Products in inventory:", font=("Helvetica", 16)).pack(pady=10)
    for product in products:
        ttk.Label(root, text=f"Name: {product[0]}, Description: {product[1]}, Price: {product[2]}, Stock: {product[3]}").pack()
    ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

# Create new product
def create_product():
    def submit():
        name = name_entry.get()
        description = description_entry.get()
        price = float(price_entry.get())
        stock = int(stock_entry.get())
        categories = category_entry.get().split(",")
        
        # Insert product into Products table
        cursor.execute("INSERT INTO Products (Name, Description, Price, Stock) VALUES (%s, %s, %s, %s)",
                       (name, description, price, stock))
        db.commit()
        product_id = cursor.lastrowid

        # Check and insert categories
        valid_categories = []
        for category_id in categories:
            cursor.execute("SELECT CategoryID FROM ProductCategories WHERE CategoryID = %s", (int(category_id.strip()),))
            if cursor.fetchone():
                valid_categories.append(int(category_id.strip()))
            else:
                messagebox.showerror("Error", f"Category ID {category_id.strip()} does not exist.")
                return
        
        for category_id in valid_categories:
            cursor.execute("INSERT INTO ProductCategoryMapping (ProductID, CategoryID) VALUES (%s, %s)",
                           (product_id, category_id))
        db.commit()
        messagebox.showinfo("Success", "Product created successfully.")
        display_menu()

    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="Create new product", font=("Helvetica", 16)).pack(pady=10)
    ttk.Label(root, text="Name:").pack()
    name_entry = ttk.Entry(root)
    name_entry.pack()
    ttk.Label(root, text="Description:").pack()
    description_entry = ttk.Entry(root)
    description_entry.pack()
    ttk.Label(root, text="Price:").pack()
    price_entry = ttk.Entry(root)
    price_entry.pack()
    ttk.Label(root, text="Stock:").pack()
    stock_entry = ttk.Entry(root)
    stock_entry.pack()
    ttk.Label(root, text="Category IDs (comma-separated):").pack()
    category_entry = ttk.Entry(root)
    category_entry.pack()
    ttk.Button(root, text="Submit", command=submit).pack(pady=10)
    ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

# Modify product stock
def modify_product_stock():
    def submit():
        product_id = int(product_id_entry.get())
        new_stock = int(stock_entry.get())
        cursor.execute("UPDATE Products SET Stock = %s WHERE ProductID = %s", (new_stock, product_id))
        db.commit()
        messagebox.showinfo("Success", "Product stock updated successfully.")
        display_menu()

    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="Modify product stock", font=("Helvetica", 16)).pack(pady=10)
    ttk.Label(root, text="Product ID:").pack()
    product_id_entry = ttk.Entry(root)
    product_id_entry.pack()
    ttk.Label(root, text="New Stock:").pack()
    stock_entry = ttk.Entry(root)
    stock_entry.pack()
    ttk.Button(root, text="Submit", command=submit).pack(pady=10)
    ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

# Delete product
def delete_product():
    def submit():
        product_id = int(product_id_entry.get())
        cursor.execute("DELETE FROM Products WHERE ProductID = %s", (product_id,))
        db.commit()
        messagebox.showinfo("Success", "Product deleted successfully.")
        display_menu()

    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="Delete product", font=("Helvetica", 16)).pack(pady=10)
    ttk.Label(root, text="Product ID:").pack()
    product_id_entry = ttk.Entry(root)
    product_id_entry.pack()
    ttk.Button(root, text="Submit", command=submit).pack(pady=10)
    ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

# Get popular products for a time range
def get_popular_products():
    def submit():
        start_date = start_date_entry.get()
        end_date = end_date_entry.get()
        cursor.execute("""
            SELECT p.Name, SUM(od.Quantity) AS TotalQuantity
            FROM OrderDetails od
            JOIN Products p ON od.ProductID = p.ProductID
            JOIN Orders o ON od.OrderID = o.OrderID
            WHERE o.OrderDate BETWEEN %s AND %s
            GROUP BY p.ProductID
            ORDER BY TotalQuantity DESC
            LIMIT 3;
        """, (start_date, end_date))
        popular_products = cursor.fetchall()
        for widget in root.winfo_children():
            widget.destroy()
        ttk.Label(root, text="Popular products for the given time range:", font=("Helvetica", 16)).pack(pady=10)
        for product in popular_products:
            ttk.Label(root, text=f"Name: {product[0]}, Total Quantity: {product[1]}").pack()
        ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="Get popular products for a time range", font=("Helvetica", 16)).pack(pady=10)
    ttk.Label(root, text="Start Date (YYYY-MM-DD):").pack()
    start_date_entry = ttk.Entry(root)
    start_date_entry.pack()
    ttk.Label(root, text="End Date (YYYY-MM-DD):").pack()
    end_date_entry = ttk.Entry(root)
    end_date_entry.pack()
    ttk.Button(root, text="Submit", command=submit).pack(pady=10)
    ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

# Get unpopular products for a time range
def get_unpopular_products():
    def submit():
        start_date = start_date_entry.get()
        end_date = end_date_entry.get()
        cursor.execute("""
            SELECT p.Name, COALESCE(SUM(od.Quantity), 0) AS TotalQuantity
            FROM Products p
            LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
            LEFT JOIN Orders o ON od.OrderID = o.OrderID AND o.OrderDate BETWEEN %s AND %s
            GROUP BY p.ProductID
            ORDER BY TotalQuantity ASC
            LIMIT 3;
        """, (start_date, end_date))
        unpopular_products = cursor.fetchall()
        for widget in root.winfo_children():
            widget.destroy()
        ttk.Label(root, text="Unpopular products for the given time range:", font=("Helvetica", 16)).pack(pady=10)
        for product in unpopular_products:
            ttk.Label(root, text=f"Name: {product[0]}, Total Quantity: {product[1]}").pack()
        ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="Get unpopular products for a time range", font=("Helvetica", 16)).pack(pady=10)
    ttk.Label(root, text="Start Date (YYYY-MM-DD):").pack()
    start_date_entry = ttk.Entry(root)
    start_date_entry.pack()
    ttk.Label(root, text="End Date (YYYY-MM-DD):").pack()
    end_date_entry = ttk.Entry(root)
    end_date_entry.pack()
    ttk.Button(root, text="Submit", command=submit).pack(pady=10)
    ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

# Get users who haven't ordered in a few months
def get_inactive_users():
    def submit():
        months = int(months_entry.get())
        cursor.execute("""
            SELECT u.Name, u.Email
            FROM Users u
            LEFT JOIN Orders o ON u.UserID = o.UserID AND o.OrderDate >= DATE_SUB(CURDATE(), INTERVAL %s MONTH)
            WHERE o.OrderID IS NULL
            GROUP BY u.UserID;
        """, (months,))
        inactive_users = cursor.fetchall()
        for widget in root.winfo_children():
            widget.destroy()
        ttk.Label(root, text=f"Users who haven't ordered in the last {months} months:", font=("Helvetica", 16)).pack(pady=10)
        for user in inactive_users:
            ttk.Label(root, text=f"Name: {user[0]}, Email: {user[1]}").pack()
        ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

    for widget in root.winfo_children():
        widget.destroy()
    ttk.Label(root, text="Get users who haven't ordered in a few months", font=("Helvetica", 16)).pack(pady=10)
    ttk.Label(root, text="Number of months:").pack()
    months_entry = ttk.Entry(root)
    months_entry.pack()
    ttk.Button(root, text="Submit", command=submit).pack(pady=10)
    ttk.Button(root, text="Back", command=display_menu).pack(pady=20)

# Main loop
root = tk.Tk()
root.title("E-commerce Marketplace Application")
display_menu()
root.mainloop()

# Close the database connection
cursor.close()
db.close()
