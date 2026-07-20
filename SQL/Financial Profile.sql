-- Churn rate by utilization band
SELECT 
    CASE 
        WHEN Avg_Utilization_Ratio = 0 THEN 'No Utilization'
        WHEN Avg_Utilization_Ratio <= 0.3 THEN 'Low (0-30%)'
        WHEN Avg_Utilization_Ratio <= 0.7 THEN 'Medium (30-70%)'
        ELSE 'High (70%+)'
    END AS utilization_band,
    COUNT(*) AS total,
    ROUND(SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate_pct
FROM bankchurners
GROUP BY utilization_band
ORDER BY churn_rate_pct DESC;
-- Revolving balance: churned vs existing
SELECT Attrition_Flag,
    ROUND(AVG(Total_Revolving_Bal),2) AS avg_revolving_balance,
    ROUND(SUM(Total_Revolving_Bal),2) AS total_revolving_balance
FROM bankchurners
GROUP BY Attrition_Flag;
-- Revolving balance by card category
SELECT Card_Category,
    ROUND(SUM(Total_Revolving_Bal),2) AS total_revolving_balance,
    ROUND(AVG(Credit_Limit),2) AS avg_credit_limit
FROM bankchurners
GROUP BY Card_Category
ORDER BY total_revolving_balance DESC;