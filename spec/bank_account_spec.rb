require 'bank_account'

describe BankAccount do

  before(:each) do
    @account = BankAccount.new
  end

  it 'has a starting balance of 0' do
    expect(@account.print_balance).to eq 0
  end

  describe '.deposit' do

    it 'returns the amount deposited' do
      expect(@account.deposit(1000)).to eq 1000
    end

  end
end
