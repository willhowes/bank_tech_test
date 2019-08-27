require 'bank_account_history'

describe BankAccountHistory do

  before(:each) do
    @account_history = BankAccountHistory.new
  end

  describe '.print_statement' do
    it 'prints a blank statement if no transactions have been made' do
      expect(@account_history.print_statement).to eq ("date || credit || debit"\
                                                      " || balance\n"\
                                                      " || || || 0.00")
    end
  end
end
