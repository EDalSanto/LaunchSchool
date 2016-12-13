#1. Display the initial empty 3x3 board
#2. Ask the user to mark a square
#3. Ask the computer to mark a square
#4. Display the updated board state
#5. If winner, display winner
#6. If board is full, display tie
#7. If neither winner nor board is full, go to #2
#8. Play again?
#9. If yes, go to #1
#10. Good bye!

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def display_board(brd)
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
    prompt "Choose a square: (#{empty_squares(brd).join(',' )})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry, that's not a valid choice"
    end
  end

  brd[square] = PLAYER_MARKER
end

board = initialize_board
display_board(board)

player_places_piece!(board)
puts board.inspect
display_board(board)
