require 'simplecov'
SimpleCov.start
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

  def test_item_at
    assert_equal(@todos[0], @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.each { |todo| todo.done! }
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)

    @list.mark_done_at(0)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)

    @list.mark_done_at(1)
    @list.mark_done_at(2)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end

  def test_each
    each_count = 0
    @list.each { |todo| each_count += 1 } 
    assert_equal(@list.size, each_count)
  end

  def test_each_return
    each_return = @list.each { "hi" }
    assert_equal(@list, each_return)
  end

  def test_select
    select_return = @list.select { |todo| todo.title == 'Buy milk' }
    assert_instance_of(TodoList, select_return)
    assert_equal(1, select_return.size)
  end

end
