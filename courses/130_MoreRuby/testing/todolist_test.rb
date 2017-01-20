require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    first = @list.first
    shifted = @list.shift
    assert_equal(first, shifted)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
  end

  def test_done?
    assert_equal(false, @todo1.done?)
  end

  def test_TypeError
    assert_raises(TypeError) { @list.add(3) }
  end

  def test_shovel_method
    new_todo = Todo.new("Add todo") 
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos.size, @list.size)
  end

  def item_at
  end
end
