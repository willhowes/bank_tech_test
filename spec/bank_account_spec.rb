require 'bank_account'

describe BankAccount do

  before(:each) do
    @account = BankAccount.new
  end

  it 'has a starting balance of 0' do
    expect(@account.read_current_balance).to eq 0
  end

  describe '.read_transactions' do
    it 'returns details of one transaction' do
      @account.deposit(100, '01/01/2019')
      expect(@account.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                  'amount' => 100,
                                                  'balance' => 100 }])
    end

    it 'returns details of two transactions' do
      @account.deposit(100, '25/12/2018')
      @account.deposit(50, '26/12/2018')
      expect(@account.read_transactions).to eq([{ 'date' => '25/12/2018',
                                                  'amount' => 100,
                                                  'balance' => 100 },
                                                { 'date' => '26/12/2018',
                                                  'amount' => 50,
                                                  'balance' => 150 }])
    end
  end

  describe '.deposit' do
    it 'amends the account balance by the amount deposited' do
      expect { @account.deposit(1000, '13/01/2012') }.to
        change { @account.read_current_balance }.by(1000)
    end

    it 'raises an error if not given right number of arguments' do
      expect { @account.deposit(1000) }.to raise_error(ArgumentError)
      expect { @account.deposit }.to raise_error(ArgumentError)
      expect { @account.deposit(1000, '13/01/2012', '01/01/2018') }.to
        raise_error(ArgumentError)
    end
  end

  describe '.withdrawal' do
    it 'amends the reduces the account balance by the withdrawal amount' do
      expect { @account.withdrawal(500) }.to
        change { @account.read_current_balance }.by(-500)
    end
  end
end
