CREATE DATABASE RetailSalesDB;
USE RetailSalesDB;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM shipping;

SHOW TABLES;

SELECT DATABASE();


USE RetailSalesDB;

SELECT DATABASE();



SELECT * FROM customers LIMIT 10;

SELECT * FROM products LIMIT 10;

SELECT * FROM orders LIMIT 10;

SELECT * FROM order_items LIMIT 10;

SELECT * FROM shipping LIMIT 10;


DESCRIBE customers;


SELECT COUNT(*) AS Total_Customers
FROM customers;

SELECT COUNT(*) AS Total_Products
FROM products;

SELECT COUNT(*) AS Total_Orders
FROM orders;

SELECT COUNT(*) AS Total_Order_Items
FROM order_items;

SELECT COUNT(*) AS Total_Shipping
FROM shipping;



SELECT *
FROM customers
LIMIT 10;

SELECT *
FROM products
LIMIT 10;

SELECT *
FROM orders
LIMIT 10;

SELECT *
FROM order_items
LIMIT 10;

SELECT *
FROM shipping
LIMIT 10;


SELECT COUNT(*) AS Total_Customers
FROM customers;

SELECT *
FROM customers;
SELECT COUNT(*)
FROM customers;


USE retailsalesdb;

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM shipping;


SHOW TABLES;
SHOW CREATE TABLE customers;



DROP TABLE customers;
DROP TABLE orders;
DROP TABLE order_items;
DROP TABLE products;
DROP TABLE shipping;

SELECT COUNT(*) FROM customers;








-- Q2. Most Frequently Ordered Products
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS Total_Quantity
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY Total_Quantity DESC;


-- Q3. Average Order Value (AOV)
SELECT
ROUND(
SUM(
oi.quantity * p.unit_price * (1 - oi.discount)
)
/ COUNT(DISTINCT oi.order_id),2) AS Average_Order_Value
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;


-- Q4. Revenue Over Time (Monthly)
SELECT
DATE_FORMAT(o.order_date,'%Y-%m') AS Month,
ROUND(SUM(
oi.quantity*p.unit_price*(1-oi.discount)
),2) AS Revenue
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id
GROUP BY Month
ORDER BY Month;



-- Q5. Revenue Over Time (Yearly)
SELECT
YEAR(o.order_date) AS Year,
ROUND(SUM(
oi.quantity*p.unit_price*(1-oi.discount)
),2) AS Revenue
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id
GROUP BY Year
ORDER BY Year;



-- Q6. Top 5 States by Revenue
explain
SELECT
c.state,
ROUND(
SUM(
oi.quantity*p.unit_price*(1-oi.discount)
),2) AS Revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id
GROUP BY c.state
ORDER BY Revenue DESC
LIMIT 5;


-- 2. Customer Analysis 
-- Q1. New vs Returning Customers (Monthly)

SELECT
DATE_FORMAT(order_date,'%Y-%m') AS Month,
COUNT(DISTINCT customer_id) AS Customers
FROM orders
GROUP BY Month
ORDER BY Month;


-- Q2. Top 10 Customers by Lifetime Value
explain
SELECT
c.customer_id,
CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
ROUND(
SUM(
oi.quantity*p.unit_price*(1-oi.discount)
),2) AS Lifetime_Value
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id
GROUP BY c.customer_id,Customer_Name
ORDER BY Lifetime_Value DESC
LIMIT 10;


-- Q3. Gender-wise Spending
SELECT
c.gender,
ROUND(
SUM(
oi.quantity*p.unit_price*(1-oi.discount)
),2) AS Total_Spending
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id
GROUP BY c.gender;


-- Q4. Churn Prediction (Simple)
SELECT
customer_id,
MAX(order_date) AS Last_Order
FROM orders
GROUP BY customer_id
ORDER BY Last_Order;


-- 3. Product Analysis
-- Q1. Best Selling Products by Quantity

SELECT
p.product_name,
SUM(oi.quantity) AS Quantity_Sold
FROM order_items oi
JOIN products p
ON oi.product_id=p.product_id
GROUP BY p.product_name
ORDER BY Quantity_Sold DESC;


-- Q2. Best Selling Products by Revenue
SELECT
p.product_name,
ROUND(
SUM(
oi.quantity*p.unit_price*(1-oi.discount)
),2) AS Revenue
FROM order_items oi
JOIN products p
ON oi.product_id=p.product_id
GROUP BY p.product_name
ORDER BY Revenue DESC;

-- Q3. Product Category Revenue
SELECT
p.category,
ROUND(
SUM(
oi.quantity*p.unit_price*(1-oi.discount)
),2) AS Revenue
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.category
ORDER BY Revenue DESC;

-- Q4. Profit Margin Analysis
SELECT
product_name,
unit_price,
cost_price,
(unit_price-cost_price) AS Profit
FROM products
ORDER BY Profit DESC;


-- Q5. Underperforming Products
SELECT
p.product_name,
SUM(oi.quantity) AS Total_Sold
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name
ORDER BY Total_Sold ASC;


-- 4. Shipping & Fulfillment
-- Q1. Average Shipping Time
SELECT
ROUND(
AVG(
DATEDIFF(s.shipping_date,o.order_date)
),2) AS Average_Days
FROM shipping s
JOIN orders o
ON s.order_id=o.order_id;


-- Q2. Shipping Cost Analysis
SELECT
shipping_method,
ROUND(AVG(shipping_cost),2) AS Average_Cost
FROM shipping
GROUP BY shipping_method;

-- Q3. Delayed vs On-Time Deliveries
SELECT
shipping_status,
COUNT(*) AS Total
FROM shipping
GROUP BY shipping_status;



-- 5. Advanced SQL
-- Q1. RANK()
SELECT
product_name,
unit_price,
RANK() OVER(ORDER BY unit_price DESC) AS Price_Rank
FROM products;

-- Q2. ROW_NUMBER()
SELECT
product_name,
ROW_NUMBER() OVER(ORDER BY product_name) AS Row_Num
FROM products;

-- Q3. LAG()
SELECT
order_date,
LAG(order_date) OVER(ORDER BY order_date) AS Previous_Order
FROM orders;


-- Q4. LEAD()
SELECT
order_date,
LEAD(order_date) OVER(ORDER BY order_date) AS Next_Order
FROM orders;

-- Q5. CASE WHEN
SELECT
customer_id,
CASE
WHEN order_status='Delivered' THEN 'Completed'
WHEN order_status='Shipped' THEN 'On The Way'
ELSE 'Pending'
END AS Order_Status
FROM orders;


-- Q6. JOIN Across Multiple Tables
SELECT
o.order_id,
CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
p.product_name,
oi.quantity,
s.shipping_status
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id
JOIN shipping s
ON o.order_id=s.order_id;