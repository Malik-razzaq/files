SELECT * FROM `financial transaction_analysis`.`financial transactions`;
#clean and prepare data
##3Check for NULLs
SELECT 
  SUM(TransactionID IS NULL) AS Missing_TransactionID,
  SUM(AccountID IS NULL) AS Missing_AccountID,
  SUM(Timestamp IS NULL) AS Missing_Timestamp,
  SUM(TransactionType IS NULL) AS Missing_TransactionType,
  SUM(TransactionAmount IS NULL) AS Missing_TransactionAmount,
  SUM(AccountBalance IS NULL) AS Missing_AccountBalance
FROM `financial transaction_analysis`.`financial transactions`;
##Remove Duplicates (if needed)
SELECT * FROM `financial transaction_analysis`.`financial transactions`;
DELETE FROM `financial transaction_analysis`.`financial transactions`
WHERE TransactionID IN (
  SELECT TransactionID
  FROM (
    SELECT TransactionID,
           COUNT(*) OVER (PARTITION BY TransactionID) AS cnt
    FROM `financial transaction_analysis`.`financial transactions`
  ) AS sub
  WHERE cnt > 1
);
## Exploratory Data Analysis (EDA)
## a) Count by Transaction Type
SELECT TransactionType, COUNT(*) AS Count
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
##b) Top 5 Active Accounts
SELECT AccountID, COUNT(*) AS TransactionCount
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY AccountID
ORDER BY TransactionCount DESC
LIMIT 5;
##c.)  Average Transaction Amount by Type
SELECT TransactionType, ROUND(AVG(TransactionAmount), 2) AS AvgAmount
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;
##d) Monthly Transaction Volume
SELECT 
  DATE_FORMAT(Timestamp, '%Y-%m') AS Month,
  COUNT(*) AS Transactions
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY Month
ORDER BY Month;
##e.) Max/Min/Avg Account Balances
SELECT 
  MAX(AccountBalance) AS MaxBalance,
  MIN(AccountBalance) AS MinBalance,
  ROUND(AVG(AccountBalance), 2) AS AvgBalance
FROM `financial transaction_analysis`.`financial transactions`;

## Perform Statistical Analysis
##a)Correlation: TransactionAmount vs. AccountBalance

SELECT 
    ROUND(AVG(TransactionAmount), 2) AS AvgTransaction,
    ROUND(AVG(AccountBalance), 2) AS AvgBalance,
    ROUND(STDDEV(TransactionAmount), 2) AS StdTransaction,
    ROUND(STDDEV(AccountBalance), 2) AS StdBalance
FROM `financial transaction_analysis`.`financial transactions`;

##b)Compare Average Balance by Transaction Type
SELECT TransactionType, ROUND(AVG(AccountBalance), 2) AS AvgBalance
FROM `financial transaction_analysis`.`financial transactions`
GROUP BY TransactionType;


## c)SCheck for Anomalies (High/Low Transaction Amounts)
SELECT *
FROM `financial transaction_analysis`.`financial transactions`
WHERE TransactionAmount > 4000 OR TransactionAmount < 10
ORDER BY TransactionAmount DESC;












