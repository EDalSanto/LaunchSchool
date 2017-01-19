VALID_CHOICES = {'r'=>'rock', 'sc'=>'scissors', 'sp'=>'spock', 'p'=>'paper', 'l'=>'lizard'}

def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  ((first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard')    ||
  (first == 'paper' && second == 'spock')    ||
  (first == 'paper' && second == 'rock')     ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'scissors' && second == 'lizard')|| 
  (first == 'lizard' && second == 'spock')   ||
  (first == 'lizard' && second == 'paper')   || 
  (first == 'spock' && second == 'rock')     || 
  (first == 'spock' && second == 'scissors'))
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

player_wins = 0
computer_wins = 0

while player_wins < 5 && computer_wins < 5
  res = ''
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.map{|k,v| "#{k}=#{v}"}.join(', ')}")
    choice = VALID_CHOICES[Kernel.gets().chomp()]
    if VALID_CHOICES.values.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You choose: #{choice}; computer choose: #{computer_choice}")

  display_result(choice, computer_choice)

  if win?(choice, computer_choice)
    player_wins += 1 
  elsif win?(computer_choice, choice)
    computer_wins += 1 
  end
  puts "Player wins: #{player_wins}" 
  puts "Computer wins: #{computer_wins}" 

  puts "------------------------------"

  prompt("Do you want to play again?")
  puts "------------------------------"
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
