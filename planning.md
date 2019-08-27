## Classes
### BankTransaction
#### Variables:
* credit_or_debit
* amount
* date

#### Methods
* read_amount
* read_date
* read_credit_or_debit

### BankAccountHistory
#### Variables:
* current_balance (int)
* transaction_history (hash? or array of hashes)

#### Methods
* print statement (string)


BankAccountTransactions.deposit -----> BankAccountHistory
BankAccountTransactions.withdrawal ----> BankAccountHistory
