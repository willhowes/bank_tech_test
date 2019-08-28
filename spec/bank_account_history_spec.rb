require 'bank_account_history'

describe BankAccountHistory do

  before(:each) do
    @account_history = BankAccountHistory.new
  end

  let(:transaction) { double :transaction, amount: nil, type: nil, date: nil }

  describe '.print_statement' do

    it 'prints a blank statement if no transactions have been made' do
      expect(@account_history.print_statement).to eq ("date || credit || debit"\
                                                      " || balance\n"\
                                                      " || || || 0.00")
    end

    it 'prints a statement with details of one deposit ransaction' do
      one_deposit
      @account_history.handle_transaction(transaction)
      expect(@account_history.print_statement).to eq("date || credit || debit || balance\n"\
                                                      "01/01/2019 || 1000.00 || || 1000.00")
    end

    it 'prints a statement with details of one withdrawal transaction' do
      one_withdrawal
      @account_history.handle_transaction(transaction)
      expect(@account_history.print_statement).to eq("date || credit || debit || balance\n"\
                                                      "01/01/2019 || || 1000.00 || -1000.00")
    end

  end
end

def one_deposit
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "credit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
end

def one_withdrawal
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "debit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
end
