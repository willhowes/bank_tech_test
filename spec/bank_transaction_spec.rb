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
