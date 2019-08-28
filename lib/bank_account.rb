class BankAccount

  attr_reader :transaction_history, :current_balance

  def initialize
    @transaction_history = []
    @current_balance = 0
  end

  def handle_transaction(transaction)
    @transaction_history << {
      'date' => transaction.date,
      'amount' => transaction.amount,
      'type' => transaction.type,
      'balance' => amend_balance_after_transaction(transaction)
      }
    amend_current_balance(transaction)
  end

  def amend_current_balance(transaction)
    if transaction.type == 'credit'
      @current_balance += transaction.amount
    else
      @current_balance -= transaction.amount
    end
  end

  def amend_balance_after_transaction(transaction)
    if transaction.type == 'credit'
      return @current_balance + transaction.amount
    else
      return @current_balance - transaction.amount
    end
  end
end
