/* Are high-value transactions more likely to be fraudulent? */

SELECT 
CASE WHEN amount < 1000 THEN 'Low' WHEN amount < 10000 THEN 'Medium' ELSE 'High'
END AS amount_bucket,
COUNT (*) AS total, SUM(Is_Fraud) AS fraud_cases,
ROUND (1.0 * SUM(Is_Fraud)/COUNT(*), 4) AS fraud_rate
FROM pay_sim
GROUP BY amount_bucket;