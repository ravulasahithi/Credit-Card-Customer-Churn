--- DATA VALIDATION
USE Customer_Churn_DB;
-- 1. Total Number of Customers

SELECT
COUNT(*) AS Total_Customers
FROM BankChurners;

-- ==========================================================
-- 2. Check Duplicate Customer IDs
-- ==========================================================

SELECT
CLIENTNUM,
COUNT(*) AS Duplicate_Count
FROM BankChurners
GROUP BY CLIENTNUM
HAVING COUNT(*)>1;

-- ==========================================================
-- 3. Check Missing Values
-- ==========================================================

SELECT
SUM(CASE WHEN CLIENTNUM IS NULL THEN 1 ELSE 0 END) AS Missing_ClientNum,

SUM(CASE WHEN Attrition_Flag IS NULL THEN 1 ELSE 0 END) AS Missing_Attrition,

SUM(CASE WHEN Customer_Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,

SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,

SUM(CASE WHEN Education_Level IS NULL THEN 1 ELSE 0 END) AS Missing_Education,

SUM(CASE WHEN Marital_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Marital,

SUM(CASE WHEN Income_Category IS NULL THEN 1 ELSE 0 END) AS Missing_Income,

SUM(CASE WHEN Card_Category IS NULL THEN 1 ELSE 0 END) AS Missing_Card,

SUM(CASE WHEN Credit_Limit IS NULL THEN 1 ELSE 0 END) AS Missing_CreditLimit,

SUM(CASE WHEN Total_Trans_Amt IS NULL THEN 1 ELSE 0 END) AS Missing_TransactionAmount

FROM BankChurners;

-- ==========================================================
-- 4. Verify Gender Values
-- ==========================================================

SELECT DISTINCT Gender
FROM BankChurners;

-- ==========================================================
-- 5. Verify Card Categories
-- ==========================================================

SELECT DISTINCT Card_Category
FROM BankChurners;

-- ==========================================================
-- 6. Verify Income Categories
-- ==========================================================

SELECT DISTINCT Income_Category
FROM BankChurners;

-- ==========================================================
-- 7. Verify Education Levels
-- ==========================================================

SELECT DISTINCT Education_Level
FROM BankChurners;

-- ==========================================================
-- 8. Verify Attrition Values
-- ==========================================================

SELECT DISTINCT Attrition_Flag
FROM BankChurners;

-- ==========================================================
-- 9. Check Age Range
-- ==========================================================

SELECT

MIN(Customer_Age) AS Minimum_Age,

MAX(Customer_Age) AS Maximum_Age,

AVG(Customer_Age) AS Average_Age

FROM BankChurners;

-- ==========================================================
-- 10. Check Credit Limit Range
-- ==========================================================

SELECT

MIN(Credit_Limit) AS Minimum_Credit,

MAX(Credit_Limit) AS Maximum_Credit,

AVG(Credit_Limit) AS Average_Credit

FROM BankChurners;

-- ==========================================================
-- 11. Check Transaction Amount Range
-- ==========================================================

SELECT

MIN(Total_Trans_Amt) AS Minimum_Transaction,

MAX(Total_Trans_Amt) AS Maximum_Transaction,

AVG(Total_Trans_Amt) AS Average_Transaction

FROM BankChurners;

-- ==========================================================
-- 12. Check Utilization Ratio
-- ==========================================================

SELECT

MIN(Avg_Utilization_Ratio) AS Minimum_Utilization,

MAX(Avg_Utilization_Ratio) AS Maximum_Utilization,

AVG(Avg_Utilization_Ratio) AS Average_Utilization

FROM BankChurners;

-- ==========================================================
-- 13. Detect Invalid Age
-- ==========================================================

SELECT *
FROM BankChurners
WHERE Customer_Age <18
OR Customer_Age>100;

-- ==========================================================
-- 14. Detect Negative Credit Limit
-- ==========================================================

SELECT *
FROM BankChurners
WHERE Credit_Limit<0;

-- ==========================================================
-- 15. Detect Negative Transaction Amount
-- ==========================================================

SELECT *
FROM BankChurners
WHERE Total_Trans_Amt<0;

-- ==========================================================
-- 16. Detect Invalid Utilization Ratio
-- ==========================================================

SELECT *
FROM BankChurners
WHERE Avg_Utilization_Ratio<0
OR Avg_Utilization_Ratio>1;

-- ==========================================================
-- 17. Customer Distribution by Attrition
-- ==========================================================

SELECT

Attrition_Flag,

COUNT(*) AS Total_Customers

FROM BankChurners

GROUP BY Attrition_Flag;

-- ==========================================================
-- 18. Data Quality Summary
-- ==========================================================

SELECT

COUNT(*) AS Total_Customers,

COUNT(DISTINCT CLIENTNUM) AS Unique_Customers,

ROUND(AVG(Customer_Age),2) AS Average_Age,

ROUND(AVG(Credit_Limit),2) AS Average_Credit_Limit,

ROUND(AVG(Total_Trans_Amt),2) AS Average_Transaction_Amount

FROM BankChurners;