require 'bank_statement'
require_relative './test_helpers.rb'

describe BankStatement do

  let(:account) { double :account, transaction_history: [],
                                    current_balance: 0}

  let(:transaction) { double :transaction, amount: nil, type: nil, date: nil }


  before(:each) do
    @statement = BankStatement.new(account)
  end

  describe '.print' do

    it 'prints a blank statement if no transactions have been made' do
      expect(@statement.print).to eq ("date || credit || debit"\
                                                      " || balance\n"\
                                                      " || || || 0.00")
    end

    it 'prints a statement with details of one deposit transaction' do
      allow(account).to receive(:transaction_history).and_return([
        { 'date' => "01/01/2019",
          'amount' => 1000,
          'type' => 'credit',
          'balance' => 1000
          } ])
      expect(@statement.print).to eq("date || credit || debit || "\
                                              "balance\n"\
                                              "01/01/2019 || 1000.00 "\
                                              "|| || 1000.00")
    end

    xit 'prints a statement with details of one withdrawal transaction' do
      one_withdrawal(account)
      expect(@statement.print).to eq("date || credit || debit || "\
                                              "balance\n"\
                                              "01/01/2019 || || 1000.00 ||"\
                                              " -1000.00")
    end

    xit 'prints a statement with details of several transactions' do
      one_deposit(account)
      one_deposit(account)
      one_withdrawal(account)
      one_deposit(account)
      expect(@statement.print).to eq("date || credit || debit || balance\n"\
                                                      "01/01/2019 || 1000.00 || || 2000.00\n"\
                                                      "01/01/2019 || || 1000.00 || 1000.00\n"\
                                                      "01/01/2019 || 1000.00 || || 2000.00\n"\
                                                      "01/01/2019 || 1000.00 || || 1000.00")
    end
  end
end
