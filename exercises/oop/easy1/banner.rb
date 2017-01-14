class Banner

  def initialize(message, width=nil)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * (@message.size)}-+" 
  end

  def empty_line
    "| #{' ' * @message.size} |"
  end

  def message_line
    if @width
      "| #{@message} |".center(@width)
    else
      "| #{@message} |"
    end
  end
end

banner = Banner.new('To boldy go where no one has gone before.', 50)
puts banner

banner2 = Banner.new('')
puts banner2
