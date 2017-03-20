class Triangle
  attr_accessor :rows 

  def initialize(num_rows)
    @rows = populate_rows(num_rows)
  end

  def new_row_from(previous_row)
    previous_row.each_cons(2).map do |pair|
      pair.reduce(:+)
    end.unshift(1).push(1)
  end

  def populate_rows(num_rows)
    result = [[1]]
    return result if num_rows == 1

    1.upto(num_rows - 1) do |current_row_index|
      previous_row = rows[current_row_index - 1]
      result << new_row_from(previous_row)
    end
    result
  end
end
