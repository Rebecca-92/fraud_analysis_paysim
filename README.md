# fraud_analysis_paysim
Fraud analysis project using SQLite and the PaySim dataset from Kaggle

# Question 1: Which transactions types are most associated with fraud?
## Query (See question1)
### Insight : Fraud occurs exclusively in TRANSFER and CASH_OUT transactions. Other trancation types are low risk.
### Business Impact: This suggests fraud detection systems should mainly monitor these transaction types 

# Question 2:  Are high-value transactions more likely to be fraudulent?
## Query (See question2) 
### Insight: High-value transactions have 2x higher fraud rate than low- and 6x higher than medium-value transactions. The highest fraud rate is only 0,13% which means that fraud is rare but is disproportionately concentrated in large trnasactions.
### Business Impact: Monitoring systems should apply stricter rules or thresholds for high-value transactions as they represent a higher fraud risk.

# Question 3: At what hour does fraud most frequently occur?
## Query (See question3) 
### Insight: While minor hourly fluctuations exist, the absence of sharp peaks shows that fraud does not depend on time-of-day in this dataset. This sugeest that time-based detection rules alone would be insuffiecient. 
### Business Impact: Since the analysis didn't show any strong patterns, fraud detection systems should operate with consistent sensitivity across all hours rather than focusing on a specific time window. 

# Question 4: Which account show suspicious behavior patterns?
## Query (see question4)
### Insight: it was observed that all accounts only appear once in the dataset. The HAVING clause filtering for fraud cases primarily returns single-transaction accounts, limiting the ability to analyze reoccuring behavioral patterns. For account-level behavior analysis it is necessary to see repeated transactions per account, time sequence per account (activity of account before/after), customer metadata (account age, customer type, location), network relationships (links between accounts). This dataset is therefore transaction-focused, not customer-focused.
### Business Impact: This dataset structure prevents account-level behavioral analysis. To identify patterns, it is necessary to see transactional history (e.g. repeated fraud, behavioral anomalies such as sudden changes in transaction frequency, spending habits). As a result, fraud detection must rely on transaction-level features such as amount and transaction type rather than customer-behavior, which differs from real-world systems where historical account data is critical.

# Question 5: What patterns exist in fraudulent transaction flows? (money laundering patterns)
## Query (See question5)
### Insight: All fraudulent transactions occur only in TRANSFER and CASH OUT. Fraud often involves moving money followed by withdrawal. Fraudulent trnasactions tend to involve large amounts (~1.1-1.2 million). TRANSFER and CASH OUT behave very similarly --> fraud count is almost the same, average balances are almost the same. This suggests that these are the same types of fraud and likely part of the same process. Money is likely transfered and then withdrawn. And both steps involve large balances. However, it doesn't prove the exact sequence of the transactions (money trail) and it doesn't show if it's the same account doing both steps. 
### Business Impact: This dataset lacks transaction history and account connectivity to track sequential transaction flows. This prevents identificatopm of multi-step fraud patterns, such as transferring funds between accounts and subsequently cashing them out.

# Question 6: How effective is the system flag (Is_Flagged_Fraud)?
## Query (See question6)
### Inisght: The system flag fails to identify fraudulent transactions in the dataset. All 1142 fraud cases appear in transactions that were not flagged.
### Business Impact: Relying solely on this flag would be ineffective for detecting fraud. Further monitoring on transaction type and amount is required

# Question 7: Which transactions meet large transfer treshold and are actually fraud?
## Query (see question7)
### Insight: This query identifies high-risk transactions that a system could flag. Fraudsters often use ver large transfers. Threshold-based rules could catch these transactions and would serve better flags than the default Is_Flagged_Fraud
### Business Insight: While the system flag fails to identify any fraud, a simple rule - flagging large transfers (e.g.>1000000)- would successfully identify fraudulent transactions. This suggests that rules based on transaction charactersitics would outperform the dataset's built-in flag
