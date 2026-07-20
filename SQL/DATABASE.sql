CREATE DATABASE Customer_Churn_DB;
USE Customer_Churn_DB;
 --- STEP 2 : Create Table

CREATE TABLE BankChurners (

CLIENTNUM BIGINT PRIMARY KEY,

Attrition_Flag VARCHAR(50),

Customer_Age INT,

Gender VARCHAR(10),

Dependent_count INT,

Education_Level VARCHAR(50),

Marital_Status VARCHAR(50),

Income_Category VARCHAR(50),

Card_Category VARCHAR(30),

Months_on_book INT,

Total_Relationship_Count INT,

Months_Inactive_12_mon INT,

Contacts_Count_12_mon INT,

Credit_Limit DECIMAL(12,2),

Total_Revolving_Bal DECIMAL(12,2),

Avg_Open_To_Buy DECIMAL(12,2),

Total_Amt_Chng_Q4_Q1 DECIMAL(10,2),

Total_Trans_Amt DECIMAL(12,2),

Total_Trans_Ct INT,

Total_Ct_Chng_Q4_Q1 DECIMAL(10,2),

Avg_Utilization_Ratio DECIMAL(10,3)

);
SELECT *
FROM BankChurners
LIMIT 10;

SELECT COUNT(*) AS Total_Rows
FROM BankChurners;


