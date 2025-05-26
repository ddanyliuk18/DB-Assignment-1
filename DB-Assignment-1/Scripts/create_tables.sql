CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE authors (
author_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
country  VARCHAR(100) NOT NULL,
birth_year INT
);

INSERT INTO authors (name, country, birth_year) VALUES
('George Orwell', 'UK',	1903),
('Margaret Atwood', 'Canada', 1939),
('Haruki Murakami', 'Japan', 1949),
('J.K. Rowling', 'UK', 1965),
('Stephen King', 'USA',	1947),
('Chimamanda Adichie', 'Nigeria', 1977),
('Neil Gaiman', 'UK', 1960),
('Paulo Coelho', 'Brazil', 1947),
('Ernest Hemingway', 'USA', 1899),
('Franz Kafka', 'Austria', 1883);

CREATE TABLE books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author_id  INT,
price INT,
published_year INT,
FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO books (title, author_id, price, published_year) VALUES
('1984', 1, 250, 1949),
('The Handmaid''s Tale', 2, 300, 1985),
('Norwegian Wood', 3, 320, 1987),
('Harry Potter 1', 4, 270, 1997),
('IT', 5, 350, 1986),
('Half of a Yellow Sun', 6, 290, 2006),
('American Gods', 7, 310, 2001),
('The Alchemist', 8, 280, 1988),
('The Old Man and the Sea', 9, 260, 1952),
('The Trial', 10, 240, 1925);


CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL
);

INSERT INTO customers (name, email, country) VALUES
('Anna Petrenko', 'anna.petrenko@email.com', 'Ukraine'),
('John Smith', 'jsmith@gmail.com', 'United Kingdom'),
('Maria Gonzalez', 'maria.gonz@mail.com', 'Spain'),
('Ivan Kovalenko', 'kovalenko@ukr.net', 'Ukraine'),
('Sarah Johnson', 'sarahj@aol.com', 'United States'),
('Dmytro Hrytsenko', 'd.hryts@ukr.net', 'Ukraine'),
('Emily Zhang', 'emilyz@gmail.com', 'Korea'),
('Roberto Mancini', 'rmancini@italy.it', 'Italy'),
('Lena Kravets', 'lena.k@gmail.com', 'Ukraine'),
('Tom Walker', 'tom.walker@yahoo.com', 'United States');

CREATE TABLE orders (
orders_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id  INT,
order_date DATE,
total_amount INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-05-01', 570),
(2, '2024-05-03', 250),
(3, '2024-05-07', 620),
(1, '2024-05-10', 330),
(5, '2024-05-12', 290),
(4, '2024-05-15', 580),
(7, '2024-05-16', 530),
(6, '2024-05-17', 280),
(10, '2024-05-18', 310),
(9, '2024-05-19', 240);


CREATE TABLE order_items (
orders_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(orders_id),
FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO order_items (order_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1),
(3, 5, 1),
(3, 8, 1),
(4, 7, 1),
(5, 6, 1),
(6, 9, 2),
(7, 4, 1),
(8, 10, 1);



