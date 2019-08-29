require 'time'

class BankTransaction

  attr_reader :amount, :type, :date

  def initialize(amount:, type:)
    @amount = amount
    @type = type
    @date = Time.new
    check_amount_format(amount)
    check_type_format(type)
  end

  private

  def check_amount_format(amount)
    raise 'Invalid amount format' unless amount.is_a?(Float)
  end

  def check_type_format(type)
    raise 'Invalid transaction type' unless type == 'credit' || type == 'debit'
  end
end
