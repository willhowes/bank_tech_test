require 'bank_account'

describe BankAccount do

  before(:each) do
    @account = BankAccount.new
  end

  let(:transaction) { double :transaction, amount: nil, type: nil, date: nil }

  describe '#handle_transaction' do

    it 'saves the history of the transaction' do
      one_deposit
      expect(@account.transaction_history[0]).to eq ({ 'date' => '01/01/2019',
                                            'amount' => 1000.0,
                                            'type' => 'credit',
                                            'balance' => 1000.0 })
    end

    it 'amends the current balance' do
      one_deposit
      expect(@account.current_balance).to eq(1000.0)
    end
  end


  describe '.print_statement' do

    it 'prints a blank statement if no transactions have been made' do
      expect(@account.print_statement).to eq ("date || credit || debit"\
                                                      " || balance\n"\
                                                      " || || || 0.00")
    end

    it 'prints a statement with details of one deposit transaction' do
      one_deposit
      expect(@account.print_statement).to eq("date || credit || debit || "\
                                              "balance\n"\
                                              "01/01/2019 || 1000.00 "\
                                              "|| || 1000.00")
    end

    it 'prints a statement with details of one withdrawal transaction' do
      one_withdrawal
      expect(@account.print_statement).to eq("date || credit || debit || "\
                                              "balance\n"\
                                              "01/01/2019 || || 1000.00 ||"\
                                              " -1000.00")
    end

    it 'prints a statement with details of several transactions' do
      one_deposit
      one_deposit
      one_withdrawal
      one_deposit
      expect(@account.print_statement).to eq("date || credit || debit || balance\n"\
                                                      "01/01/2019 || 1000.00 || || 2000.00\n"\
                                                      "01/01/2019 || || 1000.00 || 1000.00\n"\
                                                      "01/01/2019 || 1000.00 || || 2000.00\n"\
                                                      "01/01/2019 || 1000.00 || || 1000.00")
    end
  end
end

def one_deposit
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "credit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
  @account.handle_transaction(transaction)
end

def one_withdrawal
  allow(transaction).to receive(:amount).and_return 1000.00
  allow(transaction).to receive(:type).and_return "debit"
  allow(transaction).to receive(:date).and_return "01/01/2019"
  @account.handle_transaction(transaction)
end
