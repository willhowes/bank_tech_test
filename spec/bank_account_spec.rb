require 'bank_account'

describe BankAccount do

  before(:each) do
    @account = BankAccount.new
  end

  it 'has a starting balance of 0' do
    expect(@account.read_current_balance).to eq 0
  end

  describe '.deposit' do
    it 'amends the balance by the amount deposited' do
      expect{@account.deposit(1000)}.to change{@account.read_current_balance}.by(1000)
    end
  end
end
