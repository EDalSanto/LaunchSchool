VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  ((first == 'rock' && second == 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper'))
end

def display_result(choice, computer_choice)
  if win?(choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You choose: #{choice}; computer choose: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
