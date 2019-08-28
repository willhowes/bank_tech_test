require 'bank_account'

describe BankAccount do

  before(:each) do
    @account_history = BankAccount.new
  end

  let(:transaction) { double :transaction, amount: nil, type: nil, date: nil }

  # INSERT TESTS HERE THAT CURRENT BALANCE IS CHANGED EACH TRANSACTION
  describe '#handle_transaction' do
    it 'saves the history of the transaction' do
      one_deposit
      expect(@account_history.transaction_history[0]).to eq ({ 'date' => '01/01/2019',
                                            'amount' => 1000.0,
                                            'type' => 'credit',
                                            'balance' => 1000.0 })
    end
  end

  # INSERT TESTS TO SHOW THAT TRANSACTION_HISTORY CORRECTLY RECORDS A TRANSACTION

  describe '.print_statement' do

    it 'prints a blank statement if no transactions have been made' do
      expect(@account_history.print_statement).to eq ("date || credit || debit"\
                                                      " || balance\n"\
                                                      " || || || 0.00")
    end

    it 'prints a statement with details of one deposit ransaction' do
      one_deposit
      expect(@account_history.print_statement).to eq("date || credit || debit || balance\n"\
                                                      "01/01/2019 || 1000.00 || || 1000.00")
    end

    it 'prints a statement with details of one withdrawal transaction' do
      one_withdrawal
      expect(@account_history.print_statement).to eq("date || credit || debit || balance\n"\
                                                      "01/01/2019 || || 1000.00 || -1000.00")
    end

    it 'prints a statement with details of several transactions' do
      one_deposit
      one_withdrawal
      one_deposit
      one_deposit
      expect(@account_history.print_statement).to eq("date || credit || debit || balance\n"\
                                                      "01/01/2019 || 1000.00 || || 1000.00\n"\
                                                      "01/01/2019 || || 1000.00 || 0.00\n"\
                                                      "01/01/2019 || 1000.00 || || 1000.00\n"\
                                                      "01/01/2019 || 1000.00 || || 2000.00")
    end

    # INSERT TEST HERE FOR THE INSTRUCTION REQUIREMENTS OR AMEND THE ONE ABOVE

  end
end

def one_deposit
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "credit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
  @account_history.handle_transaction(transaction)
end

def one_withdrawal
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "debit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
  @account_history.handle_transaction(transaction)
end
