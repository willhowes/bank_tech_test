class BankAccount

  attr_reader :transaction_history, :current_balance

  def initialize
    @transaction_history = []
    @current_balance = 0
  end

  def withdrawal(amount)
    date = Time.new
    type = 'debit'
    handle_transaction(amount, date, type)
  end

  def deposit(amount)
    date = Time.new
    type = 'credit'
    handle_transaction(amount, date, type)
  end

  def handle_transaction(amount, date, type)
    @transaction_history << {
      'date' => date,
      'amount' => amount,
      'type' => type,
      'balance' => amend_balance_after_transaction(amount, type)
      }
    amend_current_balance(amount, type)
  end

  def amend_current_balance(amount, type)
    if type == 'credit'
      @current_balance += amount
    else
      @current_balance -= amount
    end
  end

  def amend_balance_after_transaction(amount, type)
    if type == 'credit'
      return @current_balance + amount
    else
      return @current_balance - amount
    end
  end
end
