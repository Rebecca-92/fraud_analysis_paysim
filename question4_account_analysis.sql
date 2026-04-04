/* Which accounts show suspicious behavior patterns */

SELECT Name_Orig, COUNT (*) AS transaction_count, SUM(amount) AS total_sent, 
SUM(Is_Fraud) AS fraud_cases
FROM pay_sim
GROUP BY Name_Orig
HAVING transaction_count >10 OR fraud_cases >0 
ORDER BY fraud_cases DESC, total_sent DESC;