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
      @account.withdrawal(1000)
      expect(@account.current_balance).to eq(-1000)
    end
  end

  describe '#deposit' do

    it 'correctly amends the account balance' do
      one_deposit(1000)
      expect(@account.current_balance).to eq(1000)
    end

    it 'is recorded in the transaction history' do
      one_deposit(500)
      expect(@account.transaction_history).to eq( [{'date' => @time,
                                                    'amount' => 500,
                                                    'type' => 'credit',
                                                    'balance' => 500 }])
    end
  end
end

def one_deposit(amount)
  @account.deposit(amount)
end
