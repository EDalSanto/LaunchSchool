# to_h transforms nested array with two elements to hash
# add method add nested array
#
#

class School
  attr_reader :students

  def initialize
    # Block enables each pair in hash to start with empty array as value
    @students = Hash.new { |students, grade| students[grade] = [] }
  end

  def to_h
    # sorts keys then reconverts nested array back to hash
    students.sort.to_h
  end

  def add(name, grade)
    # Add element to list of students and then sort everytime
    students[grade].push(name).sort! 
  end

  def grade(specific_grade)
    students[specific_grade] 
  end
end
