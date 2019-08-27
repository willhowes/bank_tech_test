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
end

# binding.pry
