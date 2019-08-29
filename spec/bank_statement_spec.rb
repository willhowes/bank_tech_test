require 'bank_statement'
require_relative './test_helpers.rb'

describe BankStatement do

  let(:account) { double :account, transaction_history: [],
                                    current_balance: 0}

  before(:each) do
    @statement = BankStatement.new(account)
  end

  before do
    Timecop.freeze(Time.local(1990))
  end

  after do
    Timecop.return
  end

  describe '.print' do
    it 'prints a blank statement if no transactions have been made' do
      expect(@statement.print).to eq ("date || credit || debit"\
                                                      " || balance\n"\
                                                      " || || || 0.00")
    end

    it 'prints a statement with details of one deposit transaction' do
      time = Time.new
      allow(account).to receive(:transaction_history).and_return([
        { 'date' => time,
          'amount' => 1000,
          'type' => 'credit',
          'balance' => 1000
          } ])
      expect(@statement.print).to eq("date || credit || debit || "\
                                              "balance\n"\
                                              "#{ time.strftime('%d/%m/%Y') } || 1000.00 "\
                                              "|| || 1000.00")
    end

    it 'prints a statement with details of one withdrawal transaction' do
      time = Time.new
      allow(account).to receive(:transaction_history).and_return([
        { 'date' => time,
          'amount' => 1000,
          'type' => 'debit',
          'balance' => -1000
          } ])
      expect(@statement.print).to eq("date || credit || debit || "\
                                              "balance\n"\
                                              "#{ time.strftime('%d/%m/%Y') } || || 1000.00 ||"\
                                              " -1000.00")
    end

    it "prints a statement with details of two transactions" do
      time = Time.new
      allow(account).to receive(:transaction_history).and_return([
        { 'date' => time,
          'amount' => 1000,
          'type' => 'credit',
          'balance' => 1000.00
        },
        { 'date' => time,
          'amount' => 1000.00,
          'type' => 'debit',
          'balance' => 0.00
        }])
      expect(@statement.print).to eq("date || credit || debit || balance\n"\
                                      "#{ time.strftime('%d/%m/%Y') } || || 1000.00 || 0.00\n"\
                                      "#{ time.strftime('%d/%m/%Y') } || 1000.00 || || 1000.00")
    end
  end
end
