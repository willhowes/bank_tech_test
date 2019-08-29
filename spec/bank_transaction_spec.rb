require 'bank_transaction'

describe BankTransaction do

  it 'raises an error if the wrong amount format is provided' do
    expect { BankTransaction.new(amount: '1000.00', type: 'credit')
            }.to raise_error("Invalid amount format")
  end

  it 'raises an error if neither credit nor debit is stated on instantiation' do
    expect { BankTransaction.new(amount: 1000.00, type: 'debie')
            }.to raise_error("Invalid transaction type")
  end

  it 'raises an error if not given right number of arguments' do
    expect { BankTransaction.new(amount: "1000") }.to raise_error(ArgumentError)
    expect { BankTransaction.new(amount: 1000) }.to raise_error(ArgumentError)
    expect { BankTransaction.new(amount: 1000, type: "debit",
                                  date: "01/01/2019")
                                }.to raise_error(ArgumentError)
  end
end
