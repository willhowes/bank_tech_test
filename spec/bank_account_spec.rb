require 'bank_account'

describe BankAccount do
  before(:each) do
    @account = BankAccount.new
  end
  it 'has a starting balance of 0' do
    expect(@account.print_current_balance).to eq 0
  end
end
