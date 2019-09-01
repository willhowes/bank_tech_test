# frozen_string_literal: true

require 'bank_account'
require 'timecop'

describe BankAccount do
  before(:each) do
    @account = BankAccount.new
  end

  before(:each) do
    @time = Timecop.freeze(Time.local(1990))
  end

  describe '#deposit' do
    it 'returns hash with transaction details' do
      expect(@account.deposit(1000.0)).to eq([{ 'date' => @time,
                                                'amount' => 1000.0,
                                                'type' => 'credit',
                                                'balance' => 1000.0 }])
    end

    it 'correctly returns two deposits' do
      @account.deposit(1000.0)
      expect(@account.deposit(1000.0)).to eq([{ 'date' => @time,
                                                'amount' => 1000.0,
                                                'type' => 'credit',
                                                'balance' => 1000.0 },
                                              { 'date' => @time,
                                                'amount' => 1000.0,
                                                'type' => 'credit',
                                                'balance' => 2000.0 }])
    end

    it 'raises an error if the wrong amount format is provided' do
      expect { @account.deposit('1090') }.to raise_error('Invalid amount '\
                                                        'format')
      expect { @account.withdrawal(1000) }.to raise_error('Invalid amount '\
                                                          'format')
    end
  end

  describe '#withdrawal' do
    it 'correctly returns one withdrawal' do
      expect(@account.withdrawal(500.00)).to eq([{ 'date' => @time,
                                                   'amount' => 500.00,
                                                   'type' => 'debit',
                                                   'balance' => -500.00 }])
    end

    it 'correctly returns one withdrawal after a deposit' do
      @account.deposit(1000.00)
      expect(@account.withdrawal(500.00)).to eq([{ 'date' => @time,
                                                   'amount' => 1000.0,
                                                   'type' => 'credit',
                                                   'balance' => 1000.0 },
                                                 { 'date' => @time,
                                                   'amount' => 500.00,
                                                   'type' => 'debit',
                                                   'balance' => 500.00 }])
    end

    it 'raises an error if the wrong amount format is provided' do
      expect { @account.withdrawal('1090') }.to raise_error('Invalid amount '\
                                                            'format')
      expect { @account.withdrawal(1000) }.to raise_error('Invalid amount '\
                                                          'format')
    end
  end
end
