CREATE DATABASE SALESANDCUSTOMER;

USE SALESANDCUSTOMER;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Bangalore', '2023-01-10'),
(2, 'Neha Verma', 'neha@gmail.com', 'Delhi', '2023-02-15'),
(3, 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai', '2023-03-20'),
(4, 'Ananya Iyer', 'ananya@gmail.com', 'Chennai', '2023-04-05'),
(5, 'Kunal Singh', 'kunal@gmail.com', 'Pune', '2023-05-18');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 30000.00),
(103, 'Headphones', 'Accessories', 2500.00),
(104, 'Office Chair', 'Furniture', 8000.00),
(105, 'Notebook', 'Stationery', 150.00);

INSERT INTO orders VALUES
(1001, 1, '2023-06-01', 57500.00),
(1002, 2, '2023-06-05', 30000.00),
(1003, 1, '2023-07-10', 2500.00),
(1004, 3, '2023-07-15', 8000.00),
(1005, 4, '2023-08-01', 150.00),
(1006, 5, '2023-08-10', 55000.00);

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 55000.00),
(2, 1001, 103, 1, 2500.00),
(3, 1002, 102, 1, 30000.00),
(4, 1003, 103, 1, 2500.00),
(5, 1004, 104, 1, 8000.00),
(6, 1005, 105, 1, 150.00),
(7, 1006, 101, 1, 55000.00);

INSERT INTO payments VALUES
(201, 1001, 'Credit Card', 'Success'),
(202, 1002, 'UPI', 'Success'),
(203, 1003, 'Debit Card', 'Failed'),
(204, 1004, 'Net Banking', 'Success'),
(205, 1005, 'UPI', 'Success'),
(206, 1006, 'Credit Card', 'Success');

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;





