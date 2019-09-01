# frozen_string_literal: true

require 'bank_statement'
require 'timecop'

describe 'feature test' do
  account = BankAccount.new
  statement = BankStatement.new(account)

  before do
    Timecop.freeze(Time.local(1990))
  end

  after do
    Timecop.return
  end

  it 'correctly outputs as per client\'s requirements' do
    time = Time.new
    account.deposit(1000.00)
    account.deposit(2000.00)
    account.withdrawal(500.00)
    expect(statement.print).to eq("date || credit || debit || balance\n"\
                                          "#{time.strftime('%d/%m/%Y')} || || "\
                                          "500.00 || 2500.00\n"\
                                          "#{time.strftime('%d/%m/%Y')} || "\
                                          "2000.00 || || 3000.00\n"\
                                          "#{time.strftime('%d/%m/%Y')} || "\
                                          '1000.00 || || 1000.00')
  end
end
