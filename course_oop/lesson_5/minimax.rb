module Minimax
  def get_available_moves(board)
    board.unmarked_keys
    # Returns array of possible square index
  end

  def evaluate
    winner_marker = detect_winner
    if winner_marker == HUMAN_MARKER
      return -10
    elsif winner_marker == COMPUTER_MARKER
      return 10
    else
      return 0
    end
  end

  def minimax(board, depth, current_player)

    score = evaluate

    # If Computer has won, return score
    return score if score == 10

    # If player has won, return score
    return score if score == -10

    # NO more moves and no winners, so tie
    return 0 if board.full?

    # maximizer's move
    if !human_turn 
      best = -INFINITY
      # Play each spot that is empty
      @board.each do |cell, square|
        if square.unmarked?
          @board[cell] = COMPUTER_MARKER 
          # Call minimax recursively and find the max value
          best = [best, minimax(brd, depth + 1, 'player')].max
          # undo the move
          brd[cell] = INITIAL_MARKER
        end
      end
      return best
      # minimizer's move
    elsif human_turn? 
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

