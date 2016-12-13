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

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "    |     |"
  puts "  #{brd[1]} |  #{brd[2]}  |  #{brd[3]}"
  puts "    |     |"
  puts "----+-----+-----"
  puts "    |     |"
  puts "  #{brd[4]} |  #{brd[5]}  |  #{brd[6]}"
  puts "    |     |"
  puts "----+-----+-----"
  puts "    |     |"
  puts "  #{brd[7]} |  #{brd[8]}  |  #{brd[9]}"
  puts "    |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

# first joinor
# def joinor(arr, delim=', ', word='or')
#   last_index = arr.size - 1
#   res = ''
#   arr.each_with_index do |e, idx|
#     if idx == last_index
#       res += e.to_s
#     elsif idx == last_index - 1
#       res += e.to_s + "#{delim}#{word} "
#     else
#       res += e.to_s + delim
#     end
#   end
#   res
# end

# suggested solution
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

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

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
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end

  nil
end

player_wins = 0
computer_wins = 0

while player_wins < 5 && computer_wins < 5
  board = initialize_board

  loop do
    display_board(board)
    display_wins(player_wins, computer_wins)

    player_places_piece!(board)
    break if somebody_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if somebody_won?(board) || board_full?(board)
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
