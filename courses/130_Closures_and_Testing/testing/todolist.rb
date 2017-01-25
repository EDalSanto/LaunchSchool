# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError unless todo.class == Todo

    @todos << todo
  end

  def <<(todo)
    add(todo)
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    raise IndexError unless index < size

    @todos[index]
  end

  def mark_done_at(index)
    raise IndexError unless index < size 

    @todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError unless index < size 

    @todos[index].undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    selected_todos = TodoList.new("select") 

    each do |todo|
      selected_todos << todo if yield(todo)
    end
    
    selected_todos
  end

  def find_by_title(str)
    each do |todo|
      return todo if todo.title.downcase == str.downcase 
    end
    nil
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(str)
    find_by_title(str).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! } 
  end

end

@todo1 = Todo.new("Buy milk")
@todo2 = Todo.new("Clean room")
@todo3 = Todo.new("Go to gym")
@todos = [@todo1, @todo2, @todo3]

@list = TodoList.new("Today's Todos")
@list.add(@todo1)
@list.add(@todo2)
@list.add(@todo3)
