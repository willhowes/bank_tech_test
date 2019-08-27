class BankAccountHistory

  def initialize
    @transaction_history = []
    @current_balance = 0
  end

  def receive_transaction(transaction)
    @transaction_history << transaction
    @current_balance += transaction.amount
  end

  def print_statement
    if @transaction_history.empty?
      return "#{print_statement_first_line} || || || 0.00"
    else
      statement_lines = []
      @transaction_history.each do | transaction |
        statement_lines << "#{ transaction.date } || "\
        "#{ '%.2f' % transaction.amount } || || #{ '%.2f' % @current_balance }"
      end
      return "#{ print_statement_first_line }#{ print_statement_lines(statement_lines) }"
    end
  end

  private

  def print_statement_first_line
    "date || credit || debit || balance\n"
  end

  def print_statement_lines(lines)
    all_lines = []
    lines.each do |details|
      all_lines << "#{details.to_s}\n"
    end
    all_lines.join('')[0..-2]
  end
end
