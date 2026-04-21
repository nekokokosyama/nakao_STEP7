設問１：
SELECT * FROM users;

設問２：
SELECT * 
FROM users
WHERE YEAR(created_at) = 2024;

設問３：
SELECT *
FROM users
WHERE age < 30 AND gender = 'female';

設問４：
SELECT product_name, price
FROM products;

設問５：
SELECT u.name, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.id;

設問６：
SELECT 
  p.product_name,
  oi.quantity,
  p.price,
  (p.price * oi.quantity) AS total_price
FROM order_items oi
JOIN products p ON oi.product_id = p.id;

設問７：
SELECT 
  u.name,
  COUNT(o.id) AS order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;

設問８：
SELECT 
  u.name,
  SUM(p.price * oi.quantity) AS total_amount
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY u.id, u.name;

設問９：
SELECT 
  u.name,
  SUM(p.price * oi.quantity) AS total_amount
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY u.id, u.name
ORDER BY total_amount DESC
LIMIT 1;

設問１０：
SELECT 
  p.product_name,
  SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.id, p.product_name;

設問１１：
SELECT u.name
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.id IS NULL;

設問１２：
SELECT order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(DISTINCT product_id) >= 2;

設問１３：
SELECT DISTINCT u.name
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.product_name = 'テレビ';

設問１４：
SELECT 
  o.order_date,
  u.name,
  p.product_name,
  oi.quantity,
  (p.price * oi.quantity) AS total_price
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

設問１５：
SELECT 
  p.product_name,
  SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.id, p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

設問１６：
SELECT COUNT(*) AS order_count
FROM orders
WHERE MONTH(order_date) = 8;

設問１７：
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
WHERE oi.id IS NULL;

設問１８：
CREATE INDEX idx_product_id
ON order_items(product_id);

設問１９：
SELECT 
  u.name,
  AVG(order_total) AS avg_amount
FROM (
  SELECT 
    o.id,
    o.user_id,
    SUM(p.price * oi.quantity) AS order_total
  FROM orders o
  JOIN order_items oi ON o.id = oi.order_id
  JOIN products p ON oi.product_id = p.id
  GROUP BY o.id, o.user_id
) t
JOIN users u ON t.user_id = u.id
GROUP BY u.id, u.name;

設問２０：
SELECT 
  u.name,
  MAX(o.order_date) AS latest_order
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;

設問２１：
INSERT INTO users (id, name, age, gender, created_at)
VALUES (6, '中村愛', 25, 'female', '2025-06-01');

設問２２：
INSERT INTO products (id, product_name, price)
VALUES (6, 'エアコン', 60000);

設問２３：
INSERT INTO orders (id, user_id, order_date)
VALUES (10, 1, '2025-06-10');

設問２４：
INSERT INTO order_items (id, order_id, product_id, quantity)
VALUES (10, 10, 6, 1);

設問２５：
UPDATE users
SET age = 24
WHERE name = '田中美咲';

設問２６：
UPDATE products
SET price = price * 1.10;

設問２７：
UPDATE orders
SET order_date = '2024-05-01'
WHERE order_date < '2024-05-01';

設問２８：
DELETE FROM users
WHERE name = '高橋健一';

設問２９：
DELETE FROM order_items
WHERE order_id = 5;

設問３０：
DELETE FROM products
WHERE id NOT IN (
  SELECT DISTINCT product_id FROM order_items
);