class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    get_grade > other_student.get_grade
  end

  protected

    def get_grade
      @grade
    end

end

if __FILE__ == $0
  joe = Student.new("Joe", 20)
  bob = Student.new("Bob", 15)
  puts "Well done!" if joe.better_grade_than?(bob)
end
