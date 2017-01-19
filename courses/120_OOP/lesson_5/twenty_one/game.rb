require_relative 'hand'
require_relative 'display'

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
  SUITS = ['H', 'D', 'C', 'S']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  attr_accessor :cards

  def initialize
    @cards = []
    generate_deck
  end

  def generate_deck
    VALUES.each do |val|
      SUITS.each do |suit|
        cards << Card.new(suit, val)
      end
    end
    cards.shuffle!
  end

  def deal_card(player)
    new_card = cards.sample
    player.hand << new_card
    cards.delete(new_card)
  end

  def deal(player)
    2.times do
      deal_card(player)
    end
  end

end

class Card
  attr_reader :face, :suit

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def find_face_value
    if /\d/ =~ face
      face.to_i
    elsif /[JQK]/ =~ face
      10
    else
      11
    end
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  end

end

class Game
  include Displayable
  attr_reader :player, :dealer, :deck
  DEALER_LIMIT = 17

  def start
    loop do
      clear
      display_welcome
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn unless player.busted?
      show_result
      break unless play_again?
      setup_new_game
    end
  end

  private

    attr_accessor :winner

    def initialize
      setup_new_game
    end


    def play_again?
      puts "Would you like to play again? (y/n)"
      answer = nil
      loop do
        answer = gets.chomp
        break if answer == 'y' || answer == 'n'
        puts "Please enter 'y' for yes, and 'n' for no"
      end
      answer == 'y'
    end

    def setup_new_game
      @player = Player.new("Jim")
      @dealer = Dealer.new("Bob")
      @deck = Deck.new
      @winner = nil
    end

    def deal_cards
      deck.deal(player)
      deck.deal(dealer)
    end

    def validate_player_response(answer)
      loop do
        answer = gets.chomp.downcase
        break if answer == "hit" || answer == "stay"
        puts 'Please enter "stay" or "hit'
      end
      answer
    end

    def player_turn
      answer = nil
      loop do
        puts "Would you like to stay or hit?"
        answer = validate_player_response(answer)
        break if answer == "stay"

        deck.deal_card(player)
        display_player_cards

        break if player.busted?
      end
    end

    def dealer_turn
      while dealer.total < DEALER_LIMIT
        deck.deal_card(dealer)
      end
      display_dealer_cards(initial_deal: false)
    end

    def compare_hands
      if player.total > dealer.total
        self.winner = 'player'
      elsif dealer.total > player.total
        self.winner = 'dealer'
      end
    end

    def detect_winner
      compare_hands
    end

end

Game.new.start
