class BankStatement

  def initialize(account)
    @account = account
  end

  def print
    if @account.transaction_history.empty?
      return "#{print_statement_first_line} || || || 0.00"
    end
    
    return "#{ print_statement_first_line }"\
            "#{ print_statement_lines(formulate_statement_lines(@account.transaction_history)) }"
  end

  private

  def formulate_statement_lines(transaction_history)
    statement_lines = []
    transaction_history.sort_by! { |detail| detail['date'] }
    transaction_history.reverse_each do | transaction_details |
      if transaction_details['type'] == 'credit'
        statement_lines << credit_details_string(transaction_details)
      else
        statement_lines << debit_details_string(transaction_details)
      end
    end
    return statement_lines
  end

  def print_statement_first_line
    "date || credit || debit || balance\n"
  end

  def print_statement_lines(lines)
    lines.map do |details|
      "#{details.to_s}"
    end
    lines.join("\n")
  end

  def credit_details_string(transaction_details)
    "#{ transaction_details['date'] } || "\
    "#{ '%.2f' % transaction_details['amount'] }"\
    " || || #{ '%.2f' % transaction_details['balance'] }"
  end

  def debit_details_string(transaction_details)
    "#{ transaction_details['date'] } || "\
    "|| #{ '%.2f' % transaction_details['amount'] }"\
    " || #{ '%.2f' % transaction_details['balance'] }"
  end
end
