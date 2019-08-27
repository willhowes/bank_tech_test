require 'bank_transaction'

describe BankTransaction do

  it 'raises an error if the wrong format is provided for amount' do
    expect { BankTransaction.new(amount: "1000", type: 'credit', date: '01/01/2019') }.to raise_error(""\
      "Invalid amount format")
  end

  xit 'raises an error is wrong format for date is provided' do
    expect { @transaction.withdrawal(100, "31/06/2019") }.to raise_error("Invalid" \
      " date format")
    expect { @transaction.withdrawal(100, "01/13/2019") }.to raise_error("Invalid" \
      " date format")
  end

  xit 'has a starting balance of 0' do
    expect(@transaction.read_current_balance).to eq 0
  end

  describe '.read_transactions' do
    xit 'returns details of one transaction' do
      make_deposit
      expect(@transaction.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                      'type' => 'credit',
                                                      'amount' => 1000,
                                                      'balance' => 1000 }])
    end

    xit 'returns details of two transactions' do
      make_deposit
      @transaction.deposit(500, '26/12/2018')
      expect(@transaction.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                  'type' => 'credit',
                                                  'amount' => 1000,
                                                  'balance' => 1000 },
                                                { 'date' => '26/12/2018',
                                                  'type' => 'credit',
                                                  'amount' => 500,
                                                  'balance' => 1500 }])
    end

    xit 'returns details of withdrawals' do
      make_deposit
      make_withdrawal
      expect(@transaction.read_transactions).to eq([{ 'date' => '01/01/2019',
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
    xit 'amends the transaction balance by the amount deposited' do
      expect { make_deposit }.to change {
        @transaction.read_current_balance }.by(1000)
    end

    xit 'raises an error if not given right number of arguments' do
      expect { @transaction.deposit(1000) }.to raise_error(ArgumentError)
      expect { @transaction.deposit }.to raise_error(ArgumentError)
      expect { @transaction.deposit(1000,
              '13/01/2012', '01/01/2018') }.to raise_error(ArgumentError)
    end

    xit 'raises an error if the wrong format is provided for amount' do
      expect { @transaction.deposit('100', '01/01/2019' ) }.to raise_error(""\
        "Invalid amount format")
    end

    xit 'raises an error is wrong format for date is provided' do
      expect { @transaction.deposit(100, "31/06/2019") }.to raise_error("Invalid" \
        " date format")
      expect { @transaction.deposit(100, "01/13/2019") }.to raise_error("Invalid" \
        " date format")
    end

  end

  describe '.withdrawal' do
    xit 'amends the reduces the transaction balance by the withdrawal amount' do
      expect { make_withdrawal }.to change {
        @transaction.read_current_balance }.by(-500)
    end

    xit 'raises an error if not given right number of arguments' do
      expect { @transaction.withdrawal(1000) }.to raise_error(ArgumentError)
      expect { @transaction.withdrawal }.to raise_error(ArgumentError)
      expect { @transaction.withdrawal(1000, '13/01/2012',
        '01/01/2018') }.to raise_error(ArgumentError)
    end
  end
end

private

def make_deposit
  @transaction.deposit(1000, '01/01/2019')
end

def make_withdrawal
  @transaction.withdrawal(500, '02/01/2019')
end
