class Book
  attr_accessor :author, :title

  def initialize(author=nil, title=nil)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end

end

book = Book.new#("Neil Stephenson", "Snow Crash")
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title} is #{book.author}.)
puts %(book = #{book}.)
