SELECT * FROM mcdonalds_csv.mcdonalds_financial_statements;
SELECT 
  (`Total debt ($B)` / `Total assets ($B)`) AS Debt_to_Asset_Ratio
FROM mcdonalds_csv.mcdonalds_financial_statements;
SELECT 
  (`Net assets ($B)` / `Total assets ($B)`) AS Net_Assets_Percentage
FROM mcdonalds_csv.mcdonalds_financial_statements;
SELECT 
  (`Cash on Hand ($B)` / `Total debt ($B)`) AS Cash_to_Debt_Ratio
FROM mcdonalds_csv.mcdonalds_financial_statements;



