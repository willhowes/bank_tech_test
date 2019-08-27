class BankAccountHistory

  def initialize
    @transaction_history = []
  end

  def read_transactions
    @transaction_history
  end

  def receive_transaction(transaction)
    @transaction_history << transaction
  end

  def print_statement
    "date || credit || debit || balance\n"\
    " || || || 0.00"
  end
end
