/* Which transactions meet large transfer threshold and are actually fraud*/

SELECT *
FROM pay_sim
WHERE type = 'TRANSFER' AND amount > 1000000 AND Is_Fraud=1;