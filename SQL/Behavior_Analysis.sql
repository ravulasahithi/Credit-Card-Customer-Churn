/******************************************************************
Project : Bank Customer Churn Analysis
File    : 04_Behavior_Analysis.sql
Purpose : Analyze customer behavior and engagement
******************************************************************/

USE Customer_Churn_DB;

-- ==========================================================
-- 1. Average Contacts
-- ==========================================================

SELECT
    ROUND(AVG(Contacts_Count_12_mon),2) AS Average_Contacts
FROM BankChurners;

-- ==========================================================
-- 2. Contact Frequency Distribution
-- ==========================================================

SELECT
    Contacts_Count_12_mon,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Contacts_Count_12_mon
ORDER BY Contacts_Count_12_mon;

-- ==========================================================
-- 3. Contact Category
-- ==========================================================

SELECT
    CASE
        WHEN Contacts_Count_12_mon <= 2 THEN 'Low Contact'
        WHEN Contacts_Count_12_mon <= 5 THEN 'Medium Contact'
        ELSE 'High Contact'
    END AS Contact_Category,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Contact_Category
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 4. Churn Rate by Contact Category
-- ==========================================================

SELECT
    CASE
        WHEN Contacts_Count_12_mon <= 2 THEN 'Low Contact'
        WHEN Contacts_Count_12_mon <= 5 THEN 'Medium Contact'
        ELSE 'High Contact'
    END AS Contact_Category,

    COUNT(*) AS Total_Customers,

    SUM(CASE
            WHEN Attrition_Flag='Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Churned_Customers,

    ROUND(
        SUM(CASE
                WHEN Attrition_Flag='Attrited Customer'
                THEN 1
                ELSE 0
            END)*100.0/COUNT(*),2
    ) AS Churn_Rate

FROM BankChurners
GROUP BY Contact_Category
ORDER BY Churn_Rate DESC;

-- ==========================================================
-- 5. Months Inactive Distribution
-- ==========================================================

SELECT
    Months_Inactive_12_mon,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Months_Inactive_12_mon
ORDER BY Months_Inactive_12_mon;

-- ==========================================================
-- 6. Churn by Inactive Months
-- ==========================================================

SELECT
    Months_Inactive_12_mon,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS Churn_Rate
FROM BankChurners
GROUP BY Months_Inactive_12_mon
ORDER BY Churn_Rate DESC;

-- ==========================================================
-- 7. Relationship Count
-- ==========================================================

SELECT
    Total_Relationship_Count,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Total_Relationship_Count
ORDER BY Total_Relationship_Count;

-- ==========================================================
-- 8. Average Transactions
-- ==========================================================

SELECT
    ROUND(AVG(Total_Trans_Ct),2) AS Average_Transactions
FROM BankChurners;

-- ==========================================================
-- 9. Utilization Category
-- ==========================================================

SELECT
    CASE
        WHEN Avg_Utilization_Ratio < 0.30 THEN 'Low'
        WHEN Avg_Utilization_Ratio < 0.70 THEN 'Medium'
        ELSE 'High'
    END AS Utilization_Level,
    COUNT(*) AS Total_Customers
FROM BankChurners
GROUP BY Utilization_Level
ORDER BY Total_Customers DESC;

-- ==========================================================
-- 10. Churn by Utilization Level
-- ==========================================================

SELECT
    CASE
        WHEN Avg_Utilization_Ratio < 0.30 THEN 'Low'
        WHEN Avg_Utilization_Ratio < 0.70 THEN 'Medium'
        ELSE 'High'
    END AS Utilization_Level,

    COUNT(*) AS Total_Customers,

    SUM(CASE
            WHEN Attrition_Flag='Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Churned_Customers,

    ROUND(
        SUM(CASE
                WHEN Attrition_Flag='Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Churn_Rate

FROM BankChurners
GROUP BY Utilization_Level
ORDER BY Churn_Rate DESC;
-- Top-N Analysis
SELECT
    Income_Category,
    AVG(Total_Trans_Amt) AS AvgSpend
FROM bankchurners
GROUP BY Income_Category
ORDER BY AvgSpend DESC;