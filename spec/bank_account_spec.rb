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

  describe '#save_transaction' do

    it 'saves the history of the transaction' do
      one_deposit(@account, 1000.0)
      expect(@account.transaction_history[0]).to eq ({ 'date' => @time,
                                            'amount' => 1000.0,
                                            'type' => 'credit',
                                            'balance' => 1000.0 })
    end

    it 'amends the current balance' do
      one_deposit(@account, 1000.0)
      expect(@account.current_balance).to eq(1000.0)
    end
  end

  describe '#withdrawal' do

    it 'correctly amends the account balance' do
      one_withdrawal(@account, 1000.00)
      expect(@account.current_balance).to eq(-1000.00)
    end

    it 'is recorded in the transaction history' do
      one_withdrawal(@account, 500.00)
      expect(@account.transaction_history).to eq( [{'date' => @time,
                                                    'amount' => 500.00,
                                                    'type' => 'debit',
                                                    'balance' => -500.00 }])
    end

    it 'raises an error if the wrong amount format is provided' do
      expect { @account.withdrawal('1090') }.to raise_error("Invalid amount format")
      expect { @account.withdrawal(1000) }.to raise_error("Invalid amount format")
    end
  end

  describe '#deposit' do

    it 'correctly amends the account balance' do
      one_deposit(@account, 1000.00)
      expect(@account.current_balance).to eq(1000.00)
    end

    it 'is recorded in the transaction history' do
      one_deposit(@account, 500.00)
      expect(@account.transaction_history).to eq( [{'date' => @time,
                                                    'amount' => 500.00,
                                                    'type' => 'credit',
                                                    'balance' => 500.00 }])
    end

    it 'raises an error if the wrong amount format is provided' do
      expect { @account.deposit('1090') }.to raise_error("Invalid amount format")
      expect { @account.withdrawal(1000) }.to raise_error("Invalid amount format")
    end
  end
end
