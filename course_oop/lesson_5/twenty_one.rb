require_relative 'hand'

class Player
  include Hand
  attr_accessor :hand

  def initialize(name)
    @name = name
    @hand = []
  end

end

class Dealer
  include Hand
  attr_accessor :hand

  def initialize(name)
    @name = name
    @hand = []
  end

end

class Deck
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'] 

  def initialize
    @cards = []
    generate_deck
  end

  def generate_deck
    VALUES.each do |val|
      SUITS.each do |suit|
        @cards << Card.new(suit, val)
      end
    end
    @cards.shuffle!
  end

  def deal_card(player)
    new_card = @cards.sample 
    player.hand << new_card 
    @cards.delete(new_card)
  end

  def deal(player)
    2.times do 
      deal_card(player)
    end
  end

end

class Card
  attr_reader :value, :suit

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}"
  end
end

class Game
  attr_reader :player, :dealer, :deck
  DEALER_LIMIT = 17

  def initialize
    @player = Player.new("Jim")
    @dealer = Dealer.new("Bob")
    @deck = Deck.new
  end

  def deal_cards
    @deck.deal(@player) 
    @deck.deal(@dealer)
  end

  def display_player_cards
    puts "Your Cards: #{player.hand.map { |card| card.to_s }.join(", ")}"
    puts "Your Total: #{player.total}"
  end

  def display_dealer_cards(first: true)
    if :first
      puts "Dealer Cards: #{@dealer.hand[0]}, FACE_DOWN_CARD"
      puts "Dealer Total: #{@dealer.hand[0].value.to_i}"
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

  def validate_player_response(answer)
    loop do
      break if answer == "hit" || answer == "stay"
      puts 'Please enter "stay" or "hit'
      answer = gets.chomp
    end
  end

  def player_turn
    puts "Would you like to stay or hit?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      validate_player_response(answer)
      break if answer == "stay"

      @deck.deal_card(player)
      display_player_cards

      if player.busted?
        puts "O noo, you busted! Dealer wins!"
        break
      end
    end
  end

  def dealer_turn
    while dealer.total < DEALER_LIMIT 
      @deck.deal_card(dealer)
    end
    display_dealer_cards
  end

  def show_result
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
