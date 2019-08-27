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
      make_deposit
      expect(@account.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                  'type' => 'credit',
                                                   'amount' => 1000,
                                                  'balance' => 1000 }])
    end

    it 'returns details of two transactions' do
      make_deposit
      @account.deposit(500, '26/12/2018')
      expect(@account.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                  'type' => 'credit',
                                                  'amount' => 1000,
                                                  'balance' => 1000 },
                                                { 'date' => '26/12/2018',
                                                  'type' => 'credit',
                                                  'amount' => 500,
                                                  'balance' => 1500 }])
    end

    it 'returns details of withdrawals' do
      make_deposit
      make_withdrawal
      expect(@account.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                  'type' => 'credit',
                                                  'amount' => 1000,
                                                  'balance' => 1000 },
                                                  { 'date' => '02/01/2019',
                                                    'type' => 'debit',
                                                    'amount' => 500,
                                                    'balance' => 500 } ])
    end
  end

  describe '.deposit' do
    it 'amends the account balance by the amount deposited' do
      expect { make_deposit }.to change {
        @account.read_current_balance }.by(1000)
    end

    it 'raises an error if not given right number of arguments' do
      expect { @account.deposit(1000) }.to raise_error(ArgumentError)
      expect { @account.deposit }.to raise_error(ArgumentError)
      expect { @account.deposit(1000,
              '13/01/2012', '01/01/2018') }.to raise_error(ArgumentError)
    end

    it 'raises an error if the wrong format is provided for amount' do
      expect { @account.deposit('100', '01/01/2019' ) }.to raise_error(""\
        "Invalid amount format")
    end

    it 'raises an error is wrong format for date is provided' do
      expect { @account.deposit(100, "31/06/2019") }.to raise_error("Invalid" \
        " date format")
      expect { @account.deposit(100, "01/13/2019") }.to raise_error("Invalid" \
        " date format")
    end

  end

  describe '.withdrawal' do
    it 'amends the reduces the account balance by the withdrawal amount' do
      expect { make_withdrawal }.to change {
        @account.read_current_balance }.by(-500)
    end

    it 'raises an error if not given right number of arguments' do
      expect { @account.withdrawal(1000) }.to raise_error(ArgumentError)
      expect { @account.withdrawal }.to raise_error(ArgumentError)
      expect { @account.withdrawal(1000, '13/01/2012',
        '01/01/2018') }.to raise_error(ArgumentError)
    end
  end
end

private

def make_deposit
  @account.deposit(1000, '01/01/2019')
end

def make_withdrawal
  @account.withdrawal(500, '02/01/2019')
end
