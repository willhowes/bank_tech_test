require 'bank_account'
require_relative './test_helpers.rb'


describe BankAccount do

  before(:each) do
    @account = BankAccount.new
  end

  let(:transaction) { double :transaction, amount: nil, type: nil, date: nil }

  describe '#handle_transaction' do

    it 'saves the history of the transaction' do
      one_deposit(@account)
      expect(@account.transaction_history[0]).to eq ({ 'date' => '01/01/2019',
                                            'amount' => 1000.0,
                                            'type' => 'credit',
                                            'balance' => 1000.0 })
    end

    it 'amends the current balance' do
      one_deposit(@account)
      expect(@account.current_balance).to eq(1000.0)
    end
  end
end
