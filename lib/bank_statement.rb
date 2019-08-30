# frozen_string_literal: true

class BankStatement
  def initialize(account)
    @account = account
  end

  def print
    if @account.transaction_history.empty?
      "#{print_statement_first_line} || || || 0.00"
    else
      "#{print_statement_first_line}"\
      "#{print_statement_lines(formulate_statement_lines(@account.transaction_history))}"
    end
  end

  private

  def formulate_statement_lines(transaction_history)
    statement_lines = []
    transaction_history.sort_by! { |detail| detail['date'] }
    transaction_history.reverse_each do |transaction_details|
      statement_lines << if transaction_details['type'] == 'credit'
                           credit_details_string(transaction_details)
                         else
                           debit_details_string(transaction_details)
                         end
    end
    statement_lines
  end

  def print_statement_first_line
    "date || credit || debit || balance\n"
  end

  def print_statement_lines(lines)
    lines.map(&:to_s)
    lines.join("\n")
  end

  def credit_details_string(transaction_details)
    "#{transaction_details['date'].strftime('%d/%m/%Y')} || "\
    "#{'%.2f' % transaction_details['amount']} "\
    "|| || #{'%.2f' % transaction_details['balance']}"
  end

  def debit_details_string(transaction_details)
    "#{transaction_details['date'].strftime('%d/%m/%Y')} || "\
    "|| #{'%.2f' % transaction_details['amount']} "\
    "|| #{'%.2f' % transaction_details['balance']}"
  end
end
