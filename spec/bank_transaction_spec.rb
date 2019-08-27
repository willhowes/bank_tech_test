require 'bank_transaction'

describe BankTransaction do

  it 'raises an error if the wrong format is provided for amount' do
    expect { BankTransaction.new(amount: '1000.00', type: 'credit', date: '01/01/2019') }.to raise_error(""\
      "Invalid amount format")
  end

  it 'raises an error is wrong format for date is provided' do
    expect { BankTransaction.new(amount: 1000.00, type: 'credit', date: '32/01/2019') }.to raise_error("Invalid" \
      " date format")
    expect { BankTransaction.new(amount: 1000.00, type: 'credit', date: '01/13/2019') }.to raise_error("Invalid" \
      " date format")
  end

  it 'raises an error if neither credit nor debit is stated on instantiation' do
    expect { BankTransaction.new(amount: 1000.00, type: 'debie', date: '01/01/2019') }.to raise_error("Invalid" \
      " transaction type")
  end

  xit 'has a starting balance of 0' do
    expect(@transaction.read_current_balance).to eq 0
  end

  describe '.read_transactions' do
    xit 'returns details of one transaction' do
      make_deposit
      expect(@transaction.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                      'type' => 'credit',
                                                      'amount' => 1000.00,
                                                      'balance' => 1000.00 }])
    end

    xit 'returns details of two transactions' do
      make_deposit
      @transaction.deposit(500.00, '26/12/2018')
      expect(@transaction.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                  'type' => 'credit',
                                                  'amount' => 1000.00,
                                                  'balance' => 1000.00 },
                                                { 'date' => '26/12/2018',
                                                  'type' => 'credit',
                                                  'amount' => 500.00,
                                                  'balance' => 1500.00 }])
    end

    xit 'returns details of withdrawals' do
      make_deposit
      make_withdrawal
      expect(@transaction.read_transactions).to eq([{ 'date' => '01/01/2019',
                                                  'type' => 'credit',
                                                  'amount' => 1000.00,
                                                  'balance' => 1000.00 },
                                                  { 'date' => '02/01/2019',
                                                    'type' => 'debit',
                                                    'amount' => 500.00,
                                                    'balance' => 500.00 } ])
    end
  end

  describe '.deposit' do
    xit 'amends the transaction balance by the amount deposited' do
      expect { make_deposit }.to change {
        @transaction.read_current_balance }.by(1000.00)
    end

    xit 'raises an error if not given right number of arguments' do
      expect { @transaction.deposit(1000.00) }.to raise_error(ArgumentError)
      expect { @transaction.deposit }.to raise_error(ArgumentError)
      expect { @transaction.deposit(1000.00,
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
        @transaction.read_current_balance }.by(-500.00)
    end

    xit 'raises an error if not given right number of arguments' do
      expect { @transaction.withdrawal(1000.00) }.to raise_error(ArgumentError)
      expect { @transaction.withdrawal }.to raise_error(ArgumentError)
      expect { @transaction.withdrawal(1000.00, '13/01/2012',
        '01/01/2018') }.to raise_error(ArgumentError)
    end
  end
end

private

def make_deposit
  @transaction.deposit(1000.00, '01/01/2019')
end

def make_withdrawal
  @transaction.withdrawal(500.00, '02/01/2019')
end
