class BankAccount

  attr_reader :transaction_history, :current_balance

  def initialize
    @transaction_history = []
    @current_balance = 0
  end

  def handle_transaction(transaction)
    @transaction_history << { 'date' => transaction.date,
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

  def print_statement
    if @transaction_history.empty?
      return "#{print_statement_first_line} || || || 0.00"
    else
      statement_lines = []
      @transaction_history.each do | transaction |
        if transaction['type'] == 'credit'
          statement_lines << "#{ transaction['date'] } || "\
          "#{ '%.2f' % transaction['amount'] } || || #{ '%.2f' % transaction['balance'] }"
        else
          statement_lines << "#{ transaction['date'] } || "\
          "|| #{ '%.2f' % transaction['amount'] } || #{ '%.2f' % transaction['balance'] }"
        end
      end
      return "#{ print_statement_first_line }#{ print_statement_lines(statement_lines) }"
    end
  end

  private

  def print_statement_first_line
    "date || credit || debit || balance\n"
  end

  def print_statement_lines(lines)
    lines.map do |details|
      "#{details.to_s}"
    end
    lines.join("\n")
  end
end
