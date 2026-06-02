SELECT * FROM `financial transaction_analysis`.`financial transactions`;
#Data Cleaning & Preparation

##1 — Missing Values Check
SELECT 
  SUM(TransactionID IS NULL) AS Missing_TransactionID,
  SUM(AccountID IS NULL) AS Missing_AccountID,
  SUM(TransactionAmount IS NULL) AS Missing_Amount,
  SUM(AccountBalance IS NULL) AS Missing_Balance
FROM `financial transaction_analysis`.`financial transactions`;
#2 — Data Consistency Check
SELECT 
    COUNT(*) AS TotalRecords,
    COUNT(DISTINCT TransactionID) AS UniqueRecords,
    ROUND((COUNT(DISTINCT TransactionID) / COUNT(*)) * 100, 2) AS DataConsistency_Percent
FROM `financial transaction_analysis`.`financial transactions`;
#3 — Duplicate Account Behavior
SELECT 
  AccountID,
  COUNT(*) AS total_transactions,
  COUNT(DISTINCT TransactionAmount) AS unique_amounts
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY AccountID
HAVING COUNT(*) > 1;
#3. Exploratory Data Analysis (EDA)
#4 — Transaction Count by Type
SELECT TransactionType, COUNT(*) AS Count
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
#5 — Transaction Share by Type (%)
SELECT 
    TransactionType,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `financial transaction_analysis`.`financial transactions`), 2) AS Percentage
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
#6 — Top 5 Active Accounts
SELECT AccountID, COUNT(*) AS TransactionCount
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY AccountID
ORDER BY TransactionCount DESC
LIMIT 5;
#7 — Top Account Contribution %
SELECT 
    AccountID,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `financial transaction_analysis`.`financial transactions`), 2) AS Contribution_Percent
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY AccountID
ORDER BY Contribution_Percent DESC
LIMIT 5;
#8 — Average Transaction Amount by Type
SELECT TransactionType, ROUND(AVG(TransactionAmount), 2) AS AvgAmount
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
#9 — Monthly Transaction Volume
SELECT 
  DATE_FORMAT(Timestamp, '%Y-%m') AS Month,
  COUNT(*) AS Transactions
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY Month
ORDER BY Month;
#10 — Account Balance Analysis
SELECT 
  MAX(AccountBalance) AS MaxBalance,
  MIN(AccountBalance) AS MinBalance,
  ROUND(AVG(AccountBalance), 2) AS AvgBalance
FROM `financial transaction_analysis`.`financial transactions`;
#4. Statistical Analysis
# 11 — Transaction Amount Variability
SELECT 
    ROUND(AVG(TransactionAmount), 2) AS Mean,
    ROUND(STDDEV(TransactionAmount), 2) AS StdDev
FROM `financial transaction_analysis`.`financial transactions`;
#12 — Statistical Summary
SELECT 
    ROUND(AVG(TransactionAmount), 2) AS AvgTransaction,
    ROUND(AVG(AccountBalance), 2) AS AvgBalance,
    ROUND(STDDEV(TransactionAmount), 2) AS StdTransaction,
    ROUND(STDDEV(AccountBalance), 2) AS StdBalance
FROM `financial transaction_analysis`.`financial transactions`;
#13 — Average Balance by Transaction Type
SELECT TransactionType, ROUND(AVG(AccountBalance), 2) AS AvgBalance
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
#14 — Transaction Amount Segmentation
SELECT 
    CASE 
        WHEN TransactionAmount < 1000 THEN 'Low'
        WHEN TransactionAmount BETWEEN 1000 AND 4000 THEN 'Medium'
        ELSE 'High'
    END AS AmountSegment,
    COUNT(*) AS Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `financial transaction_analysis`.`financial transactions`), 2) AS Percentage
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY AmountSegment;
#15 — Anomaly Segmentation
SELECT 
    CASE 
        WHEN TransactionAmount > 4000 THEN 'High Value'
        WHEN TransactionAmount < 10 THEN 'Low Value'
        ELSE 'Normal'
    END AS Category,
    COUNT(*) AS Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `financial transaction_analysis`.`financial transactions`), 2) AS Percentage
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY Category;
#5. Advanced SQL Analysis
#16 — JOIN + Aggregation Analysis
SELECT 
  TransactionType,
  COUNT(*) AS total_count,
  AVG(AccountBalance) AS avg_balance
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
#17 — Share of Transaction Amount by Type
SELECT 
  TransactionType,
  SUM(TransactionAmount) AS total_amount,
  SUM(TransactionAmount) * 100.0 / SUM(SUM(TransactionAmount)) OVER () AS percent_share
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
#1. INNER JOIN (Matching Records Only)
SELECT 
    a.TransactionID,
    a.AccountID,
    a.TransactionType,
    a.TransactionAmount,
    a.AccountBalance
FROM `financial transaction_analysis`.`financial transactions` a
INNER JOIN `financial transaction_analysis`.`financial transactions` b
ON a.AccountID = b.AccountID
AND a.TransactionID = b.TransactionID
LIMIT 10;
#2. LEFT JOIN (All Records from Left + Matches from Right)
SELECT 
    a.TransactionID,
    a.AccountID,
    a.TransactionType,
    a.TransactionAmount,
    b.TransactionAmount AS Matched_Amount
FROM `financial transaction_analysis`.`financial transactions` a
LEFT JOIN `financial transaction_analysis`.`financial transactions` b
ON a.AccountID = b.AccountID
AND a.TransactionAmount = b.TransactionAmount
LIMIT 10;
#. CTE example
WITH transaction_summary AS (
    SELECT AccountID, AVG(TransactionAmount) AS avg_amount
    FROM `financial transaction_analysis`.`financial transactions`
    GROUP BY AccountID
)
SELECT * FROM transaction_summary;
#2. HAVING clause
SELECT AccountID, COUNT(*) AS total_txn
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY AccountID
HAVING COUNT(*) > 10;
#1. RIGHT JOIN (Fixed version using role simulation)


SELECT 
    a.AccountID,
    a.TransactionAmount,
    b.AccountID AS Matched_Account,
    b.TransactionAmount AS Matched_Amount
FROM `financial transaction_analysis`.`financial transactions` a
RIGHT JOIN `financial transaction_analysis`.`financial transactions` b
ON a.AccountID = b.AccountID
LIMIT 10;
# 2. FULL OUTER JOIN (MySQL FIXED version)


SELECT 
    a.TransactionID,
    a.AccountID,
    b.TransactionID AS B_TransactionID
FROM `financial transaction_analysis`.`financial transactions` a
LEFT JOIN `financial transaction_analysis`.`financial transactions` b
ON a.AccountID = b.AccountID

UNION

SELECT 
    a.TransactionID,
    a.AccountID,
    b.TransactionID AS B_TransactionID
FROM `financial transaction_analysis`.`financial transactions` a
RIGHT JOIN `financial transaction_analysis`.`financial transactions` b
ON a.AccountID = b.AccountID;
