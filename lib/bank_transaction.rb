# require 'pry'
require 'date'

class BankTransaction

  attr_reader :amount, :type, :date

  def initialize(amount:, type:, date:)
    @amount = amount
    @type = type
    @date = date
    check_amount_format(amount)
    check_date_format(date)
    check_type_format(type)
  end

  private

  def check_date_format(date)
    begin
      Date.parse(date)
    rescue ArgumentError
      raise "Invalid date format"
    end
  end

  def check_amount_format(amount)
    if !amount.is_a?(Integer)
      raise 'Invalid amount format'
    end
  end

  def check_type_format(type)
    p "TYPE: #{type}"
    raise 'Invalid transaction type' unless type == 'credit' || type == 'debit'
    
  end
end

# binding.pry
