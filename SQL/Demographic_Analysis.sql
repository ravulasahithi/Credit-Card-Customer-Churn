/******************************************************************
Project : Bank Customer Churn Analysis
File    : 03_Demographic_Analysis.sql
Purpose : Analyze customer demographics
******************************************************************/

USE Customer_Churn_DB;

-- ==========================================================
-- 1. Gender Distribution
-- ==========================================================

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM BankChurners),2) AS Percentage
FROM BankChurners
GROUP BY Gender
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 2. Age Statistics
-- ==========================================================

SELECT
    MIN(Customer_Age) AS Minimum_Age,
    MAX(Customer_Age) AS Maximum_Age,
    ROUND(AVG(Customer_Age),2) AS Average_Age
FROM BankChurners;

-- ==========================================================
-- 3. Age Group Distribution
-- ==========================================================

SELECT
    CASE
        WHEN Customer_Age < 30 THEN 'Below 30'
        WHEN Customer_Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Customer_Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Customer_Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS Age_Group,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Age_Group
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 4. Education Level Distribution
-- ==========================================================

SELECT
    Education_Level,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Education_Level
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 5. Marital Status Distribution
-- ==========================================================

SELECT
    Marital_Status,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Marital_Status
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 6. Income Category Distribution
-- ==========================================================

SELECT
    Income_Category,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Income_Category
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 7. Card Category Distribution
-- ==========================================================

SELECT
    Card_Category,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Card_Category
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 8. Average Credit Limit by Gender
-- ==========================================================

SELECT
    Gender,
    ROUND(AVG(Credit_Limit),2) AS Average_Credit_Limit
FROM BankChurners
GROUP BY Gender
ORDER BY Average_Credit_Limit DESC;

-- ==========================================================
-- 9. Average Transaction Amount by Income Category
-- ==========================================================

SELECT
    Income_Category,
    ROUND(AVG(Total_Trans_Amt),2) AS Average_Transaction
FROM BankChurners
GROUP BY Income_Category
ORDER BY Average_Transaction DESC;

-- ==========================================================
-- 10. Churn Rate by Gender
-- ==========================================================

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS Churn_Rate
FROM BankChurners
GROUP BY Gender
ORDER BY Churn_Rate DESC;

-- ==========================================================
-- 11. Churn Rate by Education Level
-- ==========================================================

SELECT
    Education_Level,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS Churn_Rate
FROM BankChurners
GROUP BY Education_Level
ORDER BY Churn_Rate DESC;

-- ==========================================================
-- 12. Churn Rate by Income Category
-- ==========================================================

SELECT
    Income_Category,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS Churn_Rate
FROM BankChurners
GROUP BY Income_Category
ORDER BY Churn_Rate DESC;