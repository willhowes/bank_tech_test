require 'bank_statement'

describe 'feature test' do
  account = BankAccount.new
  statement = BankStatement.new(account)

  xit 'correctly outputs as per client\'s requirements' do
    time = Time.new
    account.handle_transaction(BankTransaction.new(amount: 1000.00,
                                                  type: 'credit'))

    account.handle_transaction(BankTransaction.new(amount: 2000.00,
                                                  type: 'credit'))

    account.handle_transaction(BankTransaction.new(amount: 500.00,
                                                  type: 'debit'))
    expect(statement.print).to eq("date || credit || debit || balance\n"\
                                          "#{ time.strftime('%d/%m/%Y') } || || 500.00 || 2500.00\n"\
                                          "#{ time.strftime('%d/%m/%Y') } || 2000.00 || || 3000.00\n"\
                                          "#{ time.strftime('%d/%m/%Y') } || 1000.00 || || 1000.00")
  end
end
