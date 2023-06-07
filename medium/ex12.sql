-- Assume you're given a table named "sales_data" with columns "date", "product_id", "quantity", and "revenue".

-- 1. Write a SQL query to show the total revenue for each product, sorted in descending order of revenue.

SELECT product_id, SUM(revenue) AS total_revenue
    FROM sales_data
    GROUP BY product_id
    ORDER BY total_revenue DESC;

-- 2. Write a SQL query to show the total revenue, quantity, and average revenue per quantity sold for each product, sorted by product_id.

WITH EX AS (
    SELECT 
    SUM(revenue) AS total_revenue, 
    SUM(quantity) AS total_quantity, 
    product_id,
    AVG(revenue/quantity) AS avg_revenue_per_quant
    FROM sales_data
    GROUP BY product_id
)


SELECT product_id, total_revenue, total_quantity, avg_revenue_per_quant
    FROM EX
    ORDER BY product_id


-- 3. Write a SQL query to show the top 5 products by total revenue for the current month (assume current month is February 2023), and include the total revenue and the percent of revenue it represents out of the total revenue for all products in that month.

--This query should return the total revenue for each product in the current month, along with the month and year in which the revenue was accrued

WITH CTE_1 AS (
    SELECT 
    product_id,
    SUM(revenue) AS total_revenue,
    DATE_TRUNC('month', date) as acc_month
    FROM sales_data
    WHERE acc_month = DATE_TRUNC('month', CURRENT_DATE)
    GROUP BY product_id
), CTE_2 AS (
    SELECT 
    SUM(revenue) AS total_monthly_revenue
    FROM sales_data
    WHERE DATE_TRUNC('month', date) = DATE_TRUNC('month', CURRENT_DATE)
)
SELECT product_id, H.total_monthly_revenue, ROUND(K.total_revenue/H.total_monthly_revenue * 100, 2) AS revenue_percent
FROM CTE_1 AS K
JOIN CTE_2 AS H
ON 1 = 1
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5;

-- 4. Write a SQL query to show the date with the highest total revenue in the "sales_data" table, along with the total revenue for that date.

SELECT 
    date, 
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY date
ORDER BY total_revenue DESC
LIMIT 1;

-- 5. Write a SQL query to show the average revenue per day for the past 30 days, including the date and the average revenue.

SELECT date, AVG(revenue),
    FROM sales_data
    WHERE date >= CURRENT_TIMESTAMP -30
    group by date
