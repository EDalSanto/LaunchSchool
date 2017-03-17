class WordProblem
  NUMBER = /\d/
  OPS = { plus: '+',
          minus: '-', 
          divided: '/', 
          multiplied: '*' }

  attr_reader :tokens
  attr_accessor :numbers_stack, :ops_stack

  def initialize(question)
    @numbers_stack = question.scan(/-?\d+/).map(&:to_i)
    @ops_stack = question.scan(/plus|minus|divided|multiplied/)
  end

  def answer
    raise ArgumentError if ops_stack.empty?
  
    ops_stack.each do |op|
      one, two = numbers_stack.shift, numbers_stack.shift
      res = one.send(OPS[op.to_sym], two)
      numbers_stack.unshift(res)
    end
    numbers_stack.first 
  end
end

