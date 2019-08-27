require 'bank_account'

describe BankAccount do

  before(:each) do
    @account = BankAccount.new
  end

  it 'has a starting balance of 0' do
    expect(@account.read_current_balance).to eq 0
  end

  it 'stores details of a transaction' do
    @account.deposit(100, '01/01/2019')
    expect(@account.read_transactions).to eq([{'date' => '01/01/2019', 'ammount' => 100, 'balance' => 100} ])
  end

  describe '.deposit' do
    it 'amends the account balance by the amount deposited' do
      expect{@account.deposit(1000, '13/01/2012')}.to change{@account.read_current_balance}.by(1000)
    end

    it 'accepts two arguments - the amount and the date' do
      expect{@account.deposit(1000, '13/01/2012')}.not_to raise_error(ArgumentError)
    end
  end

  describe '.withdrawal' do
    it 'amends the reduces the account balance by the withdrawal amount' do
      expect{@account.withdrawal(500)}.to change{@account.read_current_balance}.by(-500)
    end
  end
end
