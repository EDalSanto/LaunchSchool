class SecretHandshake
  attr_reader :binary_digits, :commands
  attr_accessor :reverse
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(num)
    @binary_digits = to_binary_digits(num)
    @commands = []
    @reverse = false
    add_commands
    @commands.reverse! if reverse?
  end

  def to_binary_digits(num)
    num.is_a?(Integer) ? num.digits(2) : num.chars.map(&:to_i).reverse
  end

  def add_commands
    binary_digits.each_with_index do |binary, index|
      commands << COMMANDS[index] if one?(binary) && !reverse_digit?(index)
    end
  end

  def one?(binary)
    binary == 1
  end

  def reverse_digit?(index)
    self.reverse = true if index == COMMANDS.size
    reverse
  end

  def reverse?
    reverse
  end
end
