require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
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
    name = Kernel.gets.chomp
  
    if name.empty?
      prompt(MESSAGES['valid_name'])
    else
      break
    end
  end

  prompt(MESSAGES['name'] + " #{name}!")

  loan_amount = ''
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = Kernel.gets.chomp 
  
    if valid_number?(loan_amount)
      break
    else
      prompt(MESSAGES['prompt'])
    end
  end
  loan_amount = loan_amount.to_i
  
  apr = ''
  loop do
    prompt(MESSAGES['apr'])
    apr = Kernel.gets.chomp 
    if valid_number?(apr)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
  apr = apr.to_f / 100.0

  loan_duration = ''
  loop do
    prompt(MESSAGES['duration'])
    loan_duration = Kernel.gets.chomp 
    if valid_number?(loan_duration)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end
  loan_duration = loan_duration.to_i

  loan_in_months = loan_duration * 12
  monthly_interest_rate = apr / 12
  monthly_payment = (loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_in_months))))

  prompt(MESSAGES['calculating']) 
  
  prompt(MESSAGES['result'] + "$#{format('%02.2f', monthly_payment)}")
  prompt(MESSAGES['another_calculation'])
  answer = Kernel.gets.chomp
  break unless answer.downcase().start_with?('y')
end
