require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def operator_to_message(op)
  word = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end

  word
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def valid_number?(input)
  integer?(input) || float?(input)
end

loop do
  prompt(MESSAGES['welcome'])
  name = ''
  loop do
    name = Kernel.gets().chomp()
  
    if name.empty?()
      prompt(MESSAGES['valid_name'])
    else
      break
    end
  end

prompt("Hi #{name}!")


  number1 = ''
  loop do
    prompt(MESSAGES['number1'])
    number1 = Kernel.gets().chomp() 
  
    if valid_number?(number1)
      break
    else
      prompt("hmm... that doesn't look like a valid number")
    end
  end
  
  number2 = ''
  loop do
    prompt(MESSAGES['number2'])
    number2 = Kernel.gets().chomp() 
  
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_op'])
    end
  end

  prompt("#{operator_to_message(operator)} the number") 

  result = case operator
           when '1'
             number1.to_i + number2.to_i
            when '2'
             number1.to_i - number2.to_i
            when '3'
             number1.to_i * number2.to_i
            when '4'
             number1.to_i / number2.to_i
            end
  
  prompt(MESSAGES['result'] + "#{result}")
  prompt(MESSAGES['another_calculation'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
