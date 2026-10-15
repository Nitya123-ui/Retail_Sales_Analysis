-- Retail Sales Analysis
-- Tools: Excel, MySQL, Power BI

USE retail_sales_analysis;

-- 1. Total records
SELECT COUNT(*) AS total_records
FROM retail_sales;

-- 2. Total sales
SELECT ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales;

-- 3. Total profit
SELECT ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales;

-- 4. Total quantity sold
SELECT SUM(Quantity) AS total_quantity
FROM retail_sales;

-- 5. Sales and profit by category
SELECT
Category,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
SUM(Quantity) AS total_quantity
FROM retail_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- 6. Sales by region
SELECT
Region,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY Region
ORDER BY total_sales DESC;

-- 7. Sales by customer segment
SELECT
Segment,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY Segment
ORDER BY total_sales DESC;

-- 8. Top 10 cities by sales
SELECT
City,
ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 10;

-- 9. Profit by sub-category
SELECT
"Sub category",
ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY "Sub category"
ORDER BY total_profit DESC;

-- 10. Loss-making sub-categories
SELECT
Category,
"Sub category",
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY Category, "Sub category"
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;

-- 11. Average discount by category
SELECT
Category,
ROUND(AVG(Discount), 2) AS average_discount
FROM retail_sales
GROUP BY Category
ORDER BY average_discount DESC
