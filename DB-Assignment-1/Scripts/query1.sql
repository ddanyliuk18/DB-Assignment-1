USE bookstore02;


WITH totals AS(
SELECT 
c.customer_id,
c.name,
c.country,

SUM(b.price*oi.quantity) AS sum_books,
COUNT(DISTINCT o.orders_id) AS orders_count
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON o.orders_id = oi.order_id
LEFT JOIN books b ON oi.book_id = b.book_id
LEFT JOIN authors a ON b.author_id = a.author_id
GROUP BY c.customer_id, c.name, c.country
HAVING SUM(b.price*oi.quantity) > 100 AND COUNT(DISTINCT o.orders_id) >= 2
)
SELECT * FROM totals WHERE country = 'Ukraine'
UNION
SELECT * FROM totals WHERE country = 'United States'
ORDER BY sum_books ASC
LIMIT 10;

