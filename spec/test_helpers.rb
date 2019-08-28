def one_deposit(account)
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "credit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
  account.handle_transaction(transaction)
end

def one_withdrawal(account)
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "debit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
  account.handle_transaction(transaction)
end
