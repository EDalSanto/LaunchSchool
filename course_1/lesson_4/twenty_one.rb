require 'pry'

SUITS = ['H', 'D', 'C', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def make_deck
  deck = Array.new
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [suit, value]
    end
  end
  deck.shuffle
end

def values(hand)
  values = hand.map { |card| card[1] }
end

def correct_for_aces(hand, sum)
  aces = values(hand).select { |val| val == 'A' }.count 
  aces.times do 
    sum -= 10 if sum > 21
  end
  sum
end

def total(hand)
  sum = 0

  values(hand).each do |val|
    if ('2'..'10').to_a.include?(val)  
      sum += val.to_i
    elsif !!/[JQK]/.match(val)
      sum += 10
    else
      sum += 11
    end
  end

  sum = correct_for_aces(hand, sum) 
end

def deal_card!(deck, hand)
  new_card = deck.sample
  deck.delete(new_card)
  hand << new_card
end

def deal_initial_cards!(deck, player_hand, dealer_hand)
  2.times do
    deal_card!(deck, player_hand)
    deal_card!(deck, dealer_hand)
  end
end

def display_player(hand)
  puts "-----------------------------------------"
  prompt("Player Hand: #{hand.map { |card| card[1] }.join('-')}")
  prompt("Player Total: #{total(hand)}")
end

def display_dealer(hand) 
  puts "-----------------------------------------"
  if hand.count == 2 
    visible_card = hand.sample[1]
    prompt("Dealer Hand: #{visible_card + '-X'}")
    prompt("Dealer Total: #{total([visible_card])}")
  else
    prompt("Dealer Hand: #{hand.map { |card| card[1] }.join('-')}")
    prompt("Dealer Total: #{total(hand)}")
  end
end

def busted?(hand)
  total(hand) > 21 
end

def player_turn!(deck, hand)
  answer = nil

  loop do 
    puts "-------------------------------------"
    prompt("hit or stay?")
    answer = gets.chomp 

    while answer != 'hit' && answer != 'stay'
      prompt("Please enter hit or stay!")
      answer = gets.chomp 
    end
    break if answer == 'stay' 

    deal_card!(deck, hand)
    display_player(hand)
    break if busted?(hand)
  end
end

def dealer_turn!(deck, hand)
  while total(hand) < 17 
    deal_card!(deck, hand)
    display_dealer(hand)
  end
end

def compare_cards(player_hand, dealer_hand)
  if total(player_hand) > total(dealer_hand)
    return "player"
  elsif total(player_hand) < total(dealer_hand)
    return "dealer"
  else
    return "tie"
  end
end

def display_final_hands(dealer_hand, player_hand)
   prompt("------------Final Hands-------------")
   prompt("Dealer Hand: #{dealer_hand.map { |card| card[1] }.join('-')}")
   prompt("Dealer Total: #{total(dealer_hand)}")
   puts "-----------------------------------------"
   prompt("Player Hand: #{player_hand.map { |card| card[1] }.join('-')}")
   prompt("Player Total: #{total(player_hand)}")
end

def play_again?
   puts "--------------------"
   prompt("Would you like to play again?")
   ans = gets.chomp 
   ans.downcase.start_with('y')
end

if __FILE__ == $0
   
  player_wins = 0
  dealer_wins = 0

  prompt("Welcome to Twenty-One!")
  loop do
    prompt("Player wins: #{player_wins}, Dealer wins: #{dealer_wins}")
    deck = make_deck
    player_hand = []
    dealer_hand = []

    deal_initial_cards!(deck, player_hand, dealer_hand)
    display_dealer(dealer_hand)
    display_player(player_hand)

    player_turn!(deck, player_hand)

    if busted?(player_hand)
      prompt("Player BUSTED, Dealer wins!")
      dealer_wins += 1
    else
      dealer_turn!(deck, dealer_hand)
      if busted?(dealer_hand)
        prompt("DEALER BUSTED!, Player wins!")
        player_wins += 1
      else
        winner = compare_cards(player_hand, dealer_hand)
        system 'clear'
        display_final_hands(dealer_hand, player_hand)
        prompt("The winner is: #{winner}!") 
        if winner == 'dealer'
          dealer_wins += 1
        elsif winner == 'player'
          player_wins += 1 
        end
      end
    end
    break unless play_again? 
    system 'clear'
  end
      
end
