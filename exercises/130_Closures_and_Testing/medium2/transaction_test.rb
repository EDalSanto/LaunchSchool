require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

require 'minitest/reporters'
Minitest::Reporters.use!

class TransactionTest < Minitest::Test
  
  def setup
    @register = CashRegister.new(0)
    @transaction = Transaction.new(100)
  end

  def test_prompt_for_payment
    paid_before = @transaction.amount_paid
    input = StringIO.new('100\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal 100, @transaction.amount_paid
  end
end
