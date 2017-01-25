require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

require 'minitest/reporters'
Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test

  def setup
    @cash_register = CashRegister.new(0) 
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 10
    
    pre_accept_money = @cash_register.total_money
    @cash_register.accept_money(@transaction)
    post_accept_money = @cash_register.total_money

    assert_equal pre_accept_money + 10, post_accept_money 
  end

  def test_change
    @transaction.amount_paid = 15 

    assert_equal 5, @cash_register.change(@transaction)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") {
    @cash_register.give_receipt(@transaction) }
  end

end
