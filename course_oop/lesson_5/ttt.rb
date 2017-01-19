class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

    def three_identical_markers?(squares)
      squares.all? do |square|
        square.marked? && (squares.first.marker == square.marker)
      end
    end

end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X" 
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  INFINITY = 1.0 / 0

  attr_reader :board, :human, :computer
  attr_accessor :current_marker, :wins, :winning_marker

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @winning_marker = nil
    @wins = { human: 0, computer: 0 }
  end
  
  def play
    display_welcome_message
    clear

    loop do
      display_board

      loop do
        current_player_moves
        break if winner_detected? || board.full?
        swap_current_player
        clear_screen_and_display_board if human_turn?
      end

      display_result
      update_wins
      display_wins
      break if five_wins? || !play_again?
      reset
      display_play_again_message
    end
    
    display_final_win_counts
    display_goodbye_message
  end

  private

    def winner_detected?
      if board.someone_won?
        @winning_marker = @current_marker
        return true
      end
      false
    end

    def update_wins
      if @winning_marker == HUMAN_MARKER
        @wins[:human] += 1
      elsif @winning_marker == COMPUTER_MARKER
        @wins[:computer] += 1
      end
    end
   
    def display_wins
      puts ""
      puts "Your wins: #{wins[:human]}, Computer wins: #{wins[:computer]}"
      puts ""
    end

    def display_final_win_counts
      clear
      print "Final win count..."
      display_wins
    end

    def five_wins?
      @wins.has_value? 5
    end

    def display_welcome_message
      puts "Welcome to Tic Tac Toe!"
      puts ""
    end

    def display_goodbye_message
      puts "Thanks for playing Tic Tac Toe! Goodbye!"
    end

    def clear_screen_and_display_board
      clear
      display_board
    end

    def display_board
      puts "You're a #{human.marker}. Computer is a #{computer.marker}"
      puts ""
      board.draw
      puts ""
    end

    def display_result
      clear_screen_and_display_board

      case board.winning_marker
      when human.marker
        puts "You won!"
      when computer.marker
        puts "Computer won!"
      else
        puts "It's a tie!"
      end
    end
    
    def joinor(arr, delimiter=', ', word='or')
      case arr.size
      when 0 then ''
      when 1 then arr.first
      when 2 then arr.join(" #{word} ")
      else
        arr[-1] = "#{word} #{arr.last}" 
        arr.join(delimiter)
      end
    end

    def human_moves
      puts "Choose a square between (#{joinor(board.unmarked_keys)}): "
      square = ''
      loop do
        square = gets.chomp.to_i
        break if board.unmarked_keys.include?(square)
        puts "Sorry, that's not a valid choice."
      end
      board[square] = human.marker
    end

    def get_available_moves
      board.unmarked_keys
      # Returns array of possible square index
    end

    def evaluate_move
      winning_marker = board.winning_marker 
      if winning_marker == HUMAN_MARKER
        return -10
      elsif winning_marker == COMPUTER_MARKER
        return 10
      else
        return 0
      end
    end
   
    def undo_minimax_move(cell)
      @board[cell] = Square::INITIAL_MARKER
      swap_current_player
    end

    def maximizer_best_move(depth)
      best = -INFINITY
      # Play each spot that is empty
      @board.squares.each do |cell, square|
        if square.unmarked?
          @board[cell] = COMPUTER_MARKER 
          swap_current_player
          # Call minimax recursively and find the max value
          best = [best, minimax(depth + 1)].max
          undo_minimax_move(cell) 
        end
      end
      best
    end

    def minimizer_best_move(depth)
      best = INFINITY
      # Play each spot that is empty
      @board.squares.each do |cell, square|
        if square.unmarked?
          @board[cell] = HUMAN_MARKER 
          swap_current_player
          # Call minimax recursively and find the max value
          best = [best, minimax(depth + 1)].min
          undo_minimax_move(cell)
        end
      end
      return best
    end

    def computer_turn?
      @current_marker == COMPUTER_MARKER
    end

    def minimax(depth)
    
      score = evaluate_move
     
      # If Computer has won, return score
      return score if score == 10
    
      # If player has won, return score
      return score if score == -10
    
      # NO more moves and no winners, so it's a tie
      return 0 if board.full?
    
      if computer_turn? 
        return maximizer_best_move(depth)
      elsif human_turn? 
        return minimizer_best_move(depth)
      end
    end
   
    # For each possible move, run minimax on that path to find best move
    def find_best_move
    
      # Shortcircuit first move so 5 is always choosen
      return 5 if @board.unmarked_keys.count == 9
    
    
      best_val = -INFINITY
      best_move = nil
    
      @board.squares.each do |cell, square|
        if square.unmarked? 
          @board[cell] = COMPUTER_MARKER
          swap_current_player
          move_val = minimax(0)
          undo_minimax_move(cell)
          if move_val > best_val
            best_val = move_val
            best_move = cell
          end
        end
      end
      return best_move
    end

    def computer_moves
      board[find_best_move] = computer.marker
    end

    def play_again?
      answer = nil
      loop do
        puts "Would you like to play again? (y/n)"
        answer = gets.chomp.downcase
        break if %w(y n).include? answer
        puts "Sorry, must be be y or n"
      end

      answer == 'y'
    end

    def display_play_again_message
      puts "Let's play again!"
      puts ""
    end

    def clear
      system 'clear'
    end

    def reset
      board.reset
      clear
      current_marker = FIRST_TO_MOVE
      winning_marker = nil
    end
    
    def current_player_moves
      human_turn? ? human_moves : computer_moves
    end

    def swap_current_player
      if @current_marker == HUMAN_MARKER
        @current_marker = COMPUTER_MARKER
      else
        @current_marker = HUMAN_MARKER
      end
    end

    def human_turn?
      @current_marker == HUMAN_MARKER
    end

end

game = TTTGame.new
game.play
