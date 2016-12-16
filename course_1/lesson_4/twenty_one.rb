require 'pry'

SUITS = ['H', 'D', 'C', 'S'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze

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
  hand.map { |card| card[1] }
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
    visible_card = hand.sample
    prompt("Dealer Hand: #{visible_card[1] + '-X'}")
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
  end
end

def detect_result(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if player_total > 21 
    :player_busted 
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(player_hand, dealer_hand)
  result = detect_result(player_hand, dealer_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
  result
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
   ans.downcase.start_with?('y')
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
    if !busted?(player_hand)
      dealer_turn!(deck, dealer_hand)
    end
    winner = display_result(player_hand, dealer_hand)
    display_final_hands(dealer_hand, player_hand)
    if winner == :dealer || winner == :player_busted
      dealer_wins += 1
    elsif winner == :player || winner == :dealer_busted
      player_wins += 1
    end
    break unless play_again?
    system 'clear'
  end

end
