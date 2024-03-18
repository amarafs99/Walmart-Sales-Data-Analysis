-- Creating the database
CREATE database Walmart;

-- Using the created database
use Walmart;

-- Creating the sales table
CREATE TABLE IF NOT EXISTS sales(
invoice_id VARCHAR(50) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT(6,4) NOT NULL,
total DECIMAL(12,4) NOT NULL,
date DATETIME NOT NULL,
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL,
cogs DECIMAL(10,2) NOT NULL,
gross_margin_pct FLOAT(11,9),
gross_income DECIMAL(12,4) NOT NULL,
rating FLOAT(2,1)
);

-- Selecting all records from the sales table
select * from sales;

-- Selecting time and time_of_date from the sales table
SELECT 
    time, 
    (CASE
          WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
          WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
          ELSE 'Evening'   
          END
    ) AS time_of_date 
FROM sales;

-- Adding a new column time_of_day to the sales table
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- Updating the time_of_day column in the sales table
UPDATE sales
SET time_of_day =  (CASE
          WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
          WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
          ELSE 'Evening'   
          END
);

-- Selecting date and day_name from the sales table
SELECT
      date,
	  DAYNAME(date)
FROM sales;
   
-- Adding a new column day_name to the sales table
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

-- Updating the day_name column in the sales table
UPDATE sales
SET day_name = DAYNAME(date);

-- Selecting date and month_name from the sales table
SELECT
      date,
	  MONTHNAME(date)
FROM sales;

-- Adding a new column month_name to the sales table
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

-- Updating the month_name column in the sales table
UPDATE sales
SET month_name = MONTHNAME(date);

-- Selecting distinct city from the sales table
SELECT DISTINCT city FROM sales;

-- Selecting distinct branch from the sales table
SELECT DISTINCT branch FROM sales;

-- Selecting distinct city and branch from the sales table
SELECT DISTINCT city,branch FROM sales;

-- Selecting count of distinct product_line from the sales table
 SELECT COUNT(DISTINCT product_line) FROM sales;
 
-- Selecting max payment_method from the sales table
 SELECT MAX(payment_method) FROM sales;
 
-- Selecting payment_method and count of payment_method from the sales table
SELECT
       payment_method,
       COUNT(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC;

-- Selecting product_line and count of product_line from the sales table
SELECT
       product_line,
       COUNT(product_line) AS cnt
FROM sales
GROUP BY product_line
ORDER BY cnt DESC;

-- Selecting month_name and sum of total from the sales table
SELECT 
     month_name AS month,
     SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- Selecting month_name and sum of cogs from the sales table
SELECT
     month_name AS month,
     SUM(cogs) AS cogs
FROM sales
GROUP BY month_name
ORDER BY cogs DESC;

-- Selecting product_line and sum of total from the sales table
SELECT
     product_line,
     SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- Selecting branch, city and sum of total from the sales table
SELECT
     branch, city,
     SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;

-- Selecting product_line and sum of VAT from the sales table
SELECT
     product_line,
     SUM(VAT) AS total_vat
FROM sales
GROUP BY product_line
ORDER BY total_vat DESC;

-- Selecting branch and sum of quantity from the sales table
select branch, sum(quantity) as qty
from sales
group by branch
having sum(quantity) > (select avg(quantity) from sales);

-- Selecting gender, product_line and count of gender from the sales table
select gender, product_line, count(gender) as total_cnt
from sales
group by gender, product_line
order by total_cnt desc;

-- Selecting avg(rating) and product_line from the sales table
select
avg(rating), product_line
from sales
group by product_line
order by avg(rating) desc;

-- Selecting time_of_day, day_name and count of time_of_day from the sales table
SELECT time_of_day ,day_name, COUNT(time_of_day) as total_cnt FROM sales
GROUP BY time_of_day,day_name
ORDER BY time_of_day;

-- Selecting customer_type and sum of total from the sales table
SELECT customer_type,
       SUM(total) as total_rev 
FROM sales
GROUP BY customer_type
ORDER BY total_rev DESC;

-- Selecting city and avg of vat from the sales table
select city, avg(vat) as avg_vat
from sales
group by city
order by avg_vat desc;

-- Selecting customer_type and avg of vat from the sales table
select customer_type, avg(vat) as total_vat
from sales
group by customer_type
order by total_vat desc;

-- Selecting all records from the sales table
select * from sales;
