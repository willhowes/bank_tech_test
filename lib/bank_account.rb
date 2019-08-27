# require 'pry'
require 'date'

class BankAccount
  def initialize
    @current_balance = 0
    @transaction_history = []
  end

  def deposit(amount, date)
    if !amount.is_a?(Integer)
      raise 'Invalid amount format'
    end
    begin
      Date.parse(date)
    rescue ArgumentError
      raise "Invalid date format"
    end
    @current_balance += amount
    @transaction_history << { 'date' => date,
                              'type' => 'credit',
                              'amount' => amount,
                              'balance' => @current_balance }
  end

  def withdrawal(amount, date)
    @current_balance -= amount
    @transaction_history << { 'date' => date,
                              'type' => 'debit',
                              'amount' => amount,
                              'balance' => @current_balance }
  end

  def read_current_balance
    @current_balance
  end

  def read_transactions
    @transaction_history
  end
end

# binding.pry
