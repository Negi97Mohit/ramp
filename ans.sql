/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

-- select * from transactions;

WITH daily_totals AS (
    SELECT
        DATE(transaction_time) AS transaction_date,
        SUM(transaction_amount) AS total_amount
    FROM
        transactions
    WHERE
        transaction_time <= '2021-01-31 20:50:02.000000'  
    GROUP BY
        DATE(transaction_time)
),
rolling_avg AS (
    SELECT
        transaction_date,
        AVG(total_amount) OVER (
            ORDER BY transaction_date
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS rolling_3day_avg
    FROM
        daily_totals
)
SELECT
    transaction_date,
    rolling_3day_avg
FROM
    rolling_avg
WHERE
    transaction_date = '2021-01-31 20:50:02.000000'; 
