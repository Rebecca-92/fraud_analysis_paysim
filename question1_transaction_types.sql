/* What transaction types are most associated with fraud? */

SELECT type, COUNT (*) AS total_transactions, SUM(Is_Fraud) AS fraud_case, 
ROUND (1.0 * SUM(Is_Fraud)/COUNT(*), 4) AS fraud_rate
FROM pay_sim
GROUP BY type
ORDER BY fraud_rate DESC; 