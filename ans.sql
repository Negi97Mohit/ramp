WITH daily_totals AS (
  SELECT
    DATE(transaction_time) AS transaction_date,
    SUM(transaction_amount) AS total_amount
  FROM transactions
  WHERE DATE(transaction_time) BETWEEN '2021-01-29' AND '2021-01-31'
  GROUP BY transaction_date
)
SELECT
  AVG(total_amount) AS rolling_3_day_avg
FROM daily_totals;
