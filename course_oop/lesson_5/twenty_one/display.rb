module Displayable
  def display_player_cards
    puts "Your Cards: #{player.hand.map { |card| card.to_s }.join(", ")}"
    puts "Your Total: #{player.total}"
  end

  def display_dealer_cards(initial_deal: true)
    if initial_deal
      puts "Dealer Cards: #{@dealer.hand[0]}, FACE_DOWN_CARD"
      puts "Dealer Total: #{@dealer.hand[0].find_face_value}"
    else
      puts "Dealer Cards: #{@dealer.hand.map { |card| card.to_s }.join(", ")}"
      puts "Dealer Total: #{@dealer.total}"
    end
  end

  def display_welcome
    puts "Welcome to Twenty-One!"
  end

  def show_initial_cards
    display_dealer_cards
    puts "-----------------------------------------"
    display_player_cards
  end

  def display_final_hands
    clear
    puts "Final Hands"
    puts "-----------------------------------------"
    display_player_cards
    puts "-----------------------------------------"
    display_dealer_cards(initial_deal: false)
  end

  def show_result
    display_final_hands
    detect_winner
    if player.busted?
      puts "Player busted! Dealer wins!"
    elsif dealer.busted?
      puts "Dealer busted! Player wins!"
    elsif winner.nil?
      puts "It'a tie!"
    else
      puts "And the winner is...#{winner}!"
    end
  end

  def clear
    system 'clear'
  end

end
