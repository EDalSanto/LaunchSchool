class PingGame

  def initialize(low, high)
    @guesses = Math.log2(high - low + 1).to_i + 1
    @number = Random.new.rand(low..high)
    @low, @high = low, high
    @won = false
  end

  def play
    while @guesses > 0 && @won == false
      puts "You have #{@guesses} guesses remaining."
      puts "Enter a number between #{@low} and #{@high}: "
      guess = accept_guess
      eval_guess(guess)
      @guesses -= 1
    end
    puts "You are out of guesses. You lose" if @won == false
  end

  def accept_guess
    guess = gets.chomp.to_i
    if !guess.between?(@low, @high) 
      puts "Invalid guess. Enter a number between #{@low} and #{@high}: "
      accept_guess
    end
    guess
  end

  def eval_guess(guess)
    if guess < @number
      puts "Your guess is too low"
    elsif guess > @number
      puts "Your guess is too high"
    else
      puts "You win!"
      @won = true
    end
  end
end

game = PingGame.new(501, 1500)
game.play
