/* At what hour does fraud most frequently occur? */

SELECT step % 24 AS hour_of_day, COUNT (*) AS total_transactions, SUM(Is_Fraud) AS fraud_cases
FROM pay_sim
GROUP BY hour_of_day
ORDER BY fraud_cases DESC;