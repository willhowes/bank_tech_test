# require 'pry'

class BankAccount
  def initialize
    @current_balance = 0
    @transaction_history = []
  end

  def deposit(amount, date)
    @current_balance += amount
    @transaction_history << { 'date' => date, 'amount' => amount,
                              'balance' => @current_balance }
  end

  def withdrawal(amount, date)
    @current_balance -= amount
    @transaction_history << { 'date' => date, 'amount' => amount,
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
