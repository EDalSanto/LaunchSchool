# 1. Display the initial empty 3x3 board
# 2. Ask the user to mark a square
# 3. Ask the computer to mark a square
# 4. Display the updated board state
# 5. If winner, display winner
# 6. If board is full, display tie
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
FIRST = 'choose'.freeze
INFINITY = 1.0/0

def display_cell(cell, num)
  if cell == ' '
    return num
  else
    return cell
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{display_cell(brd[1], 1)}  |  #{display_cell(brd[2], 2)}  |  #{display_cell(brd[3], 3)}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{display_cell(brd[4], 4)}  |  #{display_cell(brd[5], 5)}  |  #{display_cell(brd[6], 6)}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{display_cell(brd[7], 7)}  |  #{display_cell(brd[8], 8)}  |  #{display_cell(brd[9], 9)}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}" # -1 index = last elm
    arr.join(delimiter)
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def prompt(msg)
  puts "=> #{msg}"
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry, that's not a valid choice"
    end
  end

  brd[square] = PLAYER_MARKER
end

def immediate_threat?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      line.each do |square|
        return square if brd[square] == INITIAL_MARKER 
      end
    end
  end

  nil
end

def search_for_win(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      line.each do |square|
        return square if brd[square] == INITIAL_MARKER 
      end
    end
  end

  nil
end

# original computer places piece
#def computer_places_piece!(brd)
#  # search for win first
#  square = search_for_win(brd)
#
#  # if winning move wasn't found check for threat
#  square = immediate_threat?(brd) if !square
#
#  # pick square 5 if 
#  square = 5 if brd[5] == INITIAL_MARKER   
#
#  # if no winning and no threat, pick random
#
#  brd[square] = COMPUTER_MARKER
#end

def board_full?(brd)
  empty_squares(brd).empty?
end

def somebody_won?(brd)
  !!detect_winner(brd)
end

def display_wins(player_wins, computer_wins)
  prompt "Player wins: #{player_wins}, Computer wins: #{computer_wins}"
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'computer'
    end
  end

  nil
end

def evaluate(brd)
  winner = detect_winner(brd)
  if winner == 'computer'
    return 10
  elsif winner == 'player'
    return -10
  else
    return 0
  end
end

def get_available_moves(board)
  moves = []
  board.values.each do |v|
    moves.push(v) if v == INITIAL_MARKER
  end
  moves
end

def get_new_state(board, move, current_player)
  if current_player == 'player'
    board[move] = PLAYER_MARKER
  else
    board[move] = COMPUTER_MARKER
  end
end

def find_best_move(brd)
  best_move = nil
  moves = get_available_moves(brd)
  moves.each do |move|
    if evaluate(brd) > best_move 
      best_move = move
    end
  end
end

def minimax(brd, depth, current_player)

  score = evaluate(brd)
 
  # If Computer has won, return score
  return score if score == 10

  # If player has won, return score
  return score if score == -10

  # NO more moves and no winners, so tie
  return 0 if board_full?(brd)

  # maximizer's move
  if current_player == 'computer'
    best = -INFINITY
    # Play each spot that is empty
    brd.each do |cell, status|
      if status == INITIAL_MARKER
        brd[cell] = COMPUTER_MARKER 
        # Call minimax recursively and find the max value
        best = [best, minimax(brd, depth + 1, 'player')].max
        # undo the move
        brd[cell] = INITIAL_MARKER
      end
    end
    return best
  # minimizer's move
  elsif current_player == 'player'
    best = INFINITY
    # Play each spot that is empty
    brd.each do |cell, status|
      if status == INITIAL_MARKER
        brd[cell] = PLAYER_MARKER 
        # Call minimax recursively and find the max value
        best = [best, minimax(brd, depth + 1, 'computer')].min
        # undo the move
        brd[cell] = INITIAL_MARKER
      end
    end
    return best
  end
end

# For each possible move, run minimax on that path to find best move
def find_best_move(brd)

  # Shortcircuit first move so 5 is always choosen 
  return 5 if empty_squares(brd).count == 9


  best_val = -INFINITY
  best_move = nil

  brd.each do |cell, status|
    if status == INITIAL_MARKER
      brd[cell] = COMPUTER_MARKER
      move_val = minimax(brd, 0, 'player')
      brd[cell] = INITIAL_MARKER
      if move_val > best_val
        best_val = move_val
        best_move = cell
      end
    end
  end
  return best_move
end

def who_goes_first?
  answer = '' 
  if FIRST == 'choose'
    prompt "Shall the player or the computer go first?"
    answer = gets.chomp
    while answer != "player" && answer != "computer"
      puts "Sorry, please enter player or computer"
      answer = gets.chomp
    end
  elsif FIRST == 'player' 
    answer = 'player'
  else
    answer = 'computer'
  end
  answer
end

def play_piece!(board, current_player)
  if current_player == 'player' 
    player_places_piece!(board) 
  else
    computer_move = find_best_move(board)
    board[computer_move] = COMPUTER_MARKER
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    current_player = 'computer'
  else
    current_player = 'player'
  end
end


if __FILE__ == $0

  player_wins = 0
  computer_wins = 0
  
  while player_wins < 5 && computer_wins < 5
    board = initialize_board
    first = who_goes_first?
    current_player = first
  
    loop do
      display_board(board)
      display_wins(player_wins, computer_wins)
      play_piece!(board, current_player)
      break if somebody_won?(board) || board_full?(board)
      current_player = alternate_player(current_player)
    end
  
    display_board(board)
  
    winner = detect_winner(board)
    if winner 
      winner == 'Player' ? player_wins += 1 : computer_wins += 1
      prompt "#{winner} won!"
    else
      prompt "It's a tie!"
    end
  
    prompt "Would you like to play again? (y or n)"
    play_again = gets.chomp.downcase
    break unless play_again.start_with?('y')
  
  end
  
  prompt "Thanks for playing Tic Tac Toe. Goodbye!"
end
