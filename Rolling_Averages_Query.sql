WITH DAILY_SUMS AS 

(
  SELECT DATE(transaction_time) AS Transaction_Date,
  SUM(transaction_amount) AS Sum_Transaction_Amount
  FROM transactions
  GROUP BY DATE(transaction_time)
  
)

SELECT
Transaction_Date,
AVG(Sum_Transaction_Amount) OVER(ORDER BY Transaction_Date ASC ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS Rolling_Average
FROM
DAILY_SUMS
ORDER BY Transaction_Date DESC
