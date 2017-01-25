require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EasyTest < Minitest::Test

  def setup
    @value = []
  end

  def test_noexp_raise
    assert_same @value, @value.process
  end
end
