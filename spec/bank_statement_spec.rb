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

    it 'prints a statement with details of one withdrawal transaction' do
      allow(account).to receive(:transaction_history).and_return([
        { 'date' => "01/01/2019",
          'amount' => 1000,
          'type' => 'debit',
          'balance' => -1000
          } ])
      expect(@statement.print).to eq("date || credit || debit || "\
                                              "balance\n"\
                                              "01/01/2019 || || 1000.00 ||"\
                                              " -1000.00")
    end

    it 'prints a statement with details of two transactions' do
      allow(account).to receive(:transaction_history).and_return([
        { 'date' => "01/01/2019",
          'amount' => 1000,
          'type' => 'credit',
          'balance' => 1000
          },
        { 'date' => "01/01/2019",
          'amount' => 1000,
          'type' => 'debit',
          'balance' => 0.00
          } ])
      expect(@statement.print).to eq("date || credit || debit || balance\n"\
                                      "01/01/2019 || || 1000.00 || 0.00\n"\
                                      "01/01/2019 || 1000.00 || || 1000.00")
    end
  end
end
