describe 'feature test' do
  account = BankAccount.new
  it 'correctly outputs as per client\'s requirements' do
    account.handle_transaction(BankTransaction.new(date: '10/01/2012',
                                                  amount: 1000.00,
                                                  type: 'credit'))

    account.handle_transaction(BankTransaction.new(date: '13/01/2012',
                                                  amount: 2000.00,
                                                  type: 'credit'))

    account.handle_transaction(BankTransaction.new(date: '14/01/2012',
                                                  amount: 500.00,
                                                  type: 'debit'))
    expect(account.print_statement).to eq("date || credit || debit || balance\n"\
                                          "14/01/2012 || || 500.00 || 2500.00\n"\
                                          "13/01/2012 || 2000.00 || || 3000.00\n"\
                                          "10/01/2012 || 1000.00 || || 1000.00")
  end
end
