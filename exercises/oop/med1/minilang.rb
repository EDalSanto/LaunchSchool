require 'set'

class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(code)
    @commands = code.split
    @register = 0
    @stack = []
  end
  
  def eval
    @commands.each do |command|
      eval_token(command)
    end
  rescue MinilangRuntimeError => error
    puts error.message
  end

  private

    def eval_token(command)
      if command.match(/\d/)
        @register = command.to_i
      elsif ACTIONS.include?(command)
        self.send(command.downcase)
      else
        raise BadTokenError, "Invalid token #{command}"
      end
    end

    def push
      @stack.push(@register)
    end

    def add
      @register += @stack.pop
    end

    def sub
      @register -= @stack.pop
    end

    def mult
      @register *= @stack.pop
    end

    def div
      begin
        @register /= @stack.pop
      rescue ZeroDivisionError
        puts "You can't divide by zero!"
      end
    end

    def mod
      begin
        @register %= @stack.pop
      rescue ZeroDivisionError
        puts "You can't mod by zero!"
      end
    end

    def pop
      raise EmptyStackError, "Empty Stack!" if @stack.empty?
      @register = @stack.pop
    end

    def print
      puts @register
    end

end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
