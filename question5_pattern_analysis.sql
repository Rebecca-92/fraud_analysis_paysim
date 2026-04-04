/* What patterns exist in fraudulent transaction flows? (money laundering patterns)*/

SELECT type, 
ROUND(AVG(Old_Balance_Org - New_Balance_Orig),2) AS avg_balance_change,
SUM(Is_Fraud) AS fraud_cases
FROM pay_sim
WHERE Is_Fraud = 1
GROUP BY type;