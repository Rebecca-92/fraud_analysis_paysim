/*How effective is the system flag (Is_Flagged_Fraud) */

SELECT Is_Flagged_Fraud,COUNT(*) AS total, SUM(Is_Fraud) AS actual_fraud
FROM pay_sim
GROUP BY Is_Flagged_Fraud;