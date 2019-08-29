def one_deposit(account, amount)
  account.deposit(amount)
end

def one_withdrawal(account, amount)
  account.withdrawal(amount)
end

# def one_deposit_stub(account)
#   allow(transaction).to receive(:amount).and_return 1000.00
#   allow(transaction).to receive(:type).and_return "credit"
#   allow(transaction).to receive(:date).and_return "01/01/2019"
#   account.handle_transaction(transaction)
# end
#
# def one_withdrawal_stub(account)
#   allow(transaction).to receive(:amount).and_return 1000.00
#   allow(transaction).to receive(:type).and_return "debit"
#   allow(transaction).to receive(:date).and_return "01/01/2019"
#   account.handle_transaction(transaction)
# end
