require 'bank_account'
require_relative './test_helpers.rb'
require 'timecop'


describe BankAccount do

  before(:each) do
    @account = BankAccount.new
  end

  before(:each) do
    @time = Timecop.freeze(Time.local(1990))
  end

  let(:transaction) { double :transaction, amount: nil, type: nil, date: nil }

  describe '#handle_transaction' do

    xit 'saves the history of the transaction' do
      one_deposit(@account)
      expect(@account.transaction_history[0]).to eq ({ 'date' => '01/01/2019',
                                            'amount' => 1000.0,
                                            'type' => 'credit',
                                            'balance' => 1000.0 })
    end

    xit 'amends the current balance' do
      one_deposit(@account)
      expect(@account.current_balance).to eq(1000.0)
    end
  end

  describe '#withdrawal' do

    it 'correctly amends the account balance' do
      one_withdrawal(1000.00)
      expect(@account.current_balance).to eq(-1000.00)
    end

    it 'is recorded in the transaction history' do
      one_withdrawal(500.00)
      expect(@account.transaction_history).to eq( [{'date' => @time,
                                                    'amount' => 500.00,
                                                    'type' => 'debit',
                                                    'balance' => -500.00 }])
    end
  end

  describe '#deposit' do

    it 'correctly amends the account balance' do
      one_deposit(1000.00)
      expect(@account.current_balance).to eq(1000.00)
    end

    it 'is recorded in the transaction history' do
      one_deposit(500.00)
      expect(@account.transaction_history).to eq( [{'date' => @time,
                                                    'amount' => 500.00,
                                                    'type' => 'credit',
                                                    'balance' => 500.00 }])
    end
  end
end

def one_deposit(amount)
  @account.deposit(amount)
end

def one_withdrawal(amount)
  @account.withdrawal(amount)
end
