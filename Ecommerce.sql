use ecommerce;

-- Shows Total Rows in Dataset
SELECT 
  count(*) as total_rows,
  count(distinct `product id`) as Total_Products,
  count(distinct `Supplier id`) as Total_Suppliers
FROM sales_info; 

-- Table Information
desc sales_info;

-- Counting Null Values in rows
SELECT
	SUM(
		CASE 
		  WHEN `Product Name` IS NULL 
					THEN 1
					ELSE 0
		END
		)
        AS 'Null Count'
FROM sales_info;
-- [ by this we can check the missing value info of each column ]

-- Name of all Products
SELECT 
  DISTINCT `Product Name` 
FROM sales_info;

-- Name of all Category
SELECT
  DISTINCT `Category`
FROM sales_info;

-- List of Age Groups
SELECT 
  DISTINCT `Customer Age Group`
FROM sales_info;

-- List of Customers Location
SELECT 
  DISTINCT `Customer Location`
FROM sales_info;

-- Price Anslysis
SELECT 
  ROUND(SUM(Price) ,2)AS Total_Price,
  ROUND(AVG(Price),2) AS Average_Price,
  MIN(Price) AS Minimum_Price,
  MAX(Price) AS Maximum_Price
FROM sales_info;

-- Revienue Contrubution By Category
SELECT 
  Category,
  ROUND(SUM(Price),2) AS Total_Price,
  ROUND(AVG(Price),2) AS Average_Price
FROM SALES_INFO
GROUP BY Category
ORDER BY Average_Price DESC;

-- Popular Products
SELECT
  `Product Name`,
  `Category`,
  `Popularity Index`
FROM sales_info
ORDER BY `Popularity Index` DESC
LIMIT 10;

-- Pricing & Discount Analysis
SELECT 
  Discount,
  AVG(Price),
  AVG(`Popularity Index`)
FROM Sales_Info
GROUP BY discount
ORDER BY Discount DESC;

-- Low Stock Risk Product
SELECT 
  `Product Name`,
  `Category`,
  `Stock Level`
FROM Sales_Info
WHERE `Stock Level` < 50
ORDER BY `Stock Level` DESC;

-- Supplier Dependence
SELECT 
  `Supplier Id`,
  COUNT(*) AS Product_Supplied,
  AVG(`Stock Level`) AS Average_Stock
  FROM Sales_info
GROUP BY `Supplier Id`;

-- Age Group Distribution
SELECT 
  `Customer Age Group`,
   COUNT(*) AS Total_Customer
FROM Sales_Info
GROUP BY `Customer Age Group`
ORDER BY Total_Customer DESC;

-- Gender Wise Analysis
SELECT 
  `Customer Gender`,
   COUNT(*) AS Total_Customer,
   ROUND(AVG(Price),2) AS Average_Spendings
FROM Sales_Info
GROUP BY `Customer Gender`
ORDER BY Total_Customer DESC;

-- Geographical Analysis 
SELECT
  `Customer Location`,
   COUNT(*) AS Total_Orders,
   ROUND(AVG(`Shipping Cost`),2) AS Average_Shipping_Cost
FROM Sales_Info
GROUP BY `Customer Location`;

-- Shipping Methid Performance
SELECT 
  `Shipping Method`,
   ROUND(AVG(`Shipping Cost`),2) AS Average_Shipping_Cost
FROM Sales_Info
GROUP BY `Shipping Method`;

-- HIgh Retune Category
SELECT 
  `Category`,
   ROUND(AVG(`Return Rate`),2) AS Average_Return_Rate 
FROM Sales_Info
GROUP BY Category
ORDER BY Average_Return_Rate DESC ;

-- Seasonality Impact
SELECT 
  Seasonality,
  COUNT(*) AS Total_Sales,
  ROUND(AVG(`Popularity Index`),2)
FROM Sales_Info
GROUP BY Seasonality;


-- 
SELECT
  ROUND(AVG(Price),2) AS Average_Price,
  ROUND(AVG(`Return Rate`),2) AS Average_Return_Rate,
  ROUND(AVG(`Popularity Index`),2) AS Average_Popularity
FROM Sales_Info;

-- Price Sentiments
SELECT 
  CASE
    WHEN Price < 500 THEN 'Low Price'
    WHEN Price BETWEEN 500 AND 1500 THEN 'Mediun Price'
    ELSE 'High Price'
  END AS Price_Sentiments,
  ROUND(AVG(`Return Rate`),2) AS Average_Return_Rate
FROM Sales_Info
GROUP BY Price_Sentiments;

-- Discoubt Effect
SELECT 
  Discount,
  COUNT(*) AS Total_Products,
  ROUND(AVG(`Return Rate`),2) AS Average_Return_Rate
FROM Sales_Info
GROUP BY Discount;

SELECT 
  Price,
  Discount,
  `Tax Rate`,
  Price * (1-Discount / 100)*(1 +`Tax Rate` /100) AS Final_Price
FROM Sales_Info;




