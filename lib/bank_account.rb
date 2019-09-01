# frozen_string_literal: true

class BankAccount
  attr_reader :transaction_history, :current_balance

  def initialize
    @transaction_history = []
    @current_balance = 0
  end

  def withdrawal(amount)
    check_amount_format(amount)
    save_transaction(amount, Time.new, 'debit')
  end

  def deposit(amount)
    check_amount_format(amount)
    save_transaction(amount, Time.new, 'credit')
  end

  private

  def save_transaction(amount, date, type)
    amend_current_balance(amount, type)
    @transaction_history << {
      'date' => date,
      'amount' => amount,
      'type' => type,
      'balance' => @current_balance
    }
  end

  def amend_current_balance(amount, type)
    if type == 'credit'
      @current_balance += amount
    else
      @current_balance -= amount
    end
  end

  def check_amount_format(amount)
    raise 'Invalid amount format' unless amount.is_a?(Float)
  end
end
