# require 'pry'

class BankAccount

  def initialize
    @current_balance = 0
  end

  def deposit(amount, date)
    @current_balance += amount
  end

  def withdrawal(amount)
    @current_balance -= amount
  end

  def read_current_balance
    @current_balance
  end

  def read_transactions
    [ {'date' => '01/01/2019', 'ammount' => 100, 'balance' => 100} ]
  end

end

# binding.pry
