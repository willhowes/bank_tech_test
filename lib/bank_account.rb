class BankAccount

  def initialize
    @current_balance = 0
  end

  def deposit(amount)
    @current_balance += amount
  end

  def withdrawal(amount)
    @current_balance -= amount
  end

  def read_current_balance
    @current_balance
  end

end
