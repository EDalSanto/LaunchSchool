require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'fake_array'

class FakeArrayTest < Minitest::Test

  def setup
    @array = FakeArray.new([])
    @nums = [42, 23]
  end

  def test_add_elements_and_retrieves
    @array[0] = 42
    assert_equal(@nums.first, @array[0])
  end
  
end
