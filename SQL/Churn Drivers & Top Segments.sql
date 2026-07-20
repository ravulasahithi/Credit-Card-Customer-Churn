-- Combined risk segment: low balance + high contacts + declining spend
SELECT 
    COUNT(*) AS high_risk_customers,
    ROUND(SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate_pct
FROM bankchurners
WHERE Total_Revolving_Bal <= 425
  AND Contacts_Count_12_mon > 5
  AND Total_Amt_Chng_Q4_Q1 <= 0.251;
  -- Card category churn breakdown
SELECT Card_Category,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate_pct
FROM bankchurners
GROUP BY Card_Category
ORDER BY churn_rate_pct DESC;

-- Highest-risk customer segments (income x card category, filtered to avoid tiny/noisy samples)
SELECT Income_Category, Card_Category,
    COUNT(*) AS total,
    ROUND(SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate_pct
FROM bankchurners
GROUP BY Income_Category, Card_Category
HAVING total >= 30
ORDER BY churn_rate_pct DESC
LIMIT 10;
--- CustomerSegmentation
SELECT
    CLIENTNUM,
    Contacts_Count_12_mon,
    CASE
        WHEN Contacts_Count_12_mon <= 2 THEN 'Low Contact'
        WHEN Contacts_Count_12_mon <= 5 THEN 'Medium Contact'
        ELSE 'High Contact'
    END AS Contact_Category
FROM bankchurners;
