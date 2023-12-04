--KPI--

--1.Total Revenue--
SELECT SUM(total_price) AS [Total Revenue] FROM pizza_sales

--2.Average Order Value--
SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) AS [Average Order Value] 
FROM pizza_sales;

--3.Total Pizzas Sold-
SELECT SUM(quantity) AS [Total Pizzas Sold] FROM pizza_sales;

--4.Total Orders--
SELECT SUM(DISTINCT order_id) AS [Total Orders] FROM pizza_sales;

--5.Average Pizzas Per Order--

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS [Average Pizza Per Order] FROM pizza_sales;

--Daily Trend For Orders--

SELECT DATENAME(DW,order_date) AS [Days],COUNT(DISTINCT order_id) 
AS [Total Orders] 
FROM PIZZA_SALES GROUP BY DATENAME(DW,order_date);

--Monthly Trend For Orders--

SELECT DATENAME(MM,order_date) AS [Days],COUNT(DISTINCT order_id) 
AS [Total Orders] FROM PIZZA_SALES GROUP BY DATENAME(MM,order_date);

--% of Sales By Pizza Category--

SELECT pizza_category,CAST(SUM(total_price) 
AS DECIMAL(10,2)) AS [Total Revenue],CAST(SUM(total_price)*100/(SELECT SUM(total_price) 
FROM pizza_sales) AS DECIMAL(10,2)) AS PCT FROM pizza_sales GROUP BY pizza_category 
ORDER BY pizza_category;

--% of Sales By Pizza Size

SELECT pizza_size,CAST(SUM(total_price) 
AS DECIMAL(10,2)) AS [Total Revenue],CAST(SUM(total_price)*100/(SELECT SUM(total_price) 
FROM pizza_sales) AS DECIMAL(10,2)) AS PCT FROM pizza_sales GROUP BY pizza_size 
ORDER BY pizza_size;

--Total Pizza Sold by Category--
SELECT pizza_category,SUM(quantity) as [Total Quantity Sales] from pizza_sales 
GROUP BY pizza_category ORDER BY [Total Quantity Sales];

--Top 5 Pizza by Revenue--
SELECT TOP 5 pizza_name ,SUM(total_price) as [Total Revenue] 
FROM pizza_sales GROUP BY pizza_name ORDER BY [Total Revenue] ASC;

--Bottom 5 Pizza by Revenue--
SELECT TOP 5 pizza_name ,SUM(total_price) as [Total Revenue] 
FROM pizza_sales GROUP BY pizza_name ORDER BY [Total Revenue] DESC;

--Top 5 Pizza by Quantity--
SELECT TOP 5 pizza_name ,SUM(quantity) as [Total Pizzas Sold] 
FROM pizza_sales GROUP BY pizza_name ORDER BY [Total Pizzas Sold] ASC;

--Bottom 5 Pizza by Quantity
SELECT TOP 5 pizza_name ,SUM(quantity) as [Total Pizzas Sold] 
FROM pizza_sales GROUP BY pizza_name ORDER BY [Total Pizzas Sold] DESC;

--Top 5 Pizzas by Total Orders--
SELECT TOP 5 pizza_name ,COUNT(DISTINCT order_id) as [Total Orders] 
FROM pizza_sales GROUP BY pizza_name ORDER BY [Total Orders] ASC;

--L.Bottom 5 Pizzas by Total Orders--
SELECT TOP 5 pizza_name ,COUNT(DISTINCT order_id) as [Total Orders] 
FROM pizza_sales GROUP BY pizza_name ORDER BY [Total Orders] DESC;