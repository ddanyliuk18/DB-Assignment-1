CREATE DATABASE bookstore02;
USE bookstore02;

CREATE TABLE authors (
author_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
au_country  VARCHAR(100) NOT NULL,
birth_year INT
);

CREATE TABLE books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author_id  INT,
price INT,
published_year INT,
FOREIGN KEY (author_id) REFERENCES authors(author_id)
);


CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
orders_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id  INT,
order_date DATE,
total_amount INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
orders_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(orders_id),
FOREIGN KEY (book_id) REFERENCES books(book_id)
);




