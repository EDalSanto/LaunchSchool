require 'pry'

class PokerHand
  def initialize(deck)
    @cards = deck
    @value_chart = calculate_hand_rank
  end

  def calculate_hand_rank
    @hand_ranks = Hash.new(0) 
    @suits = Hash.new(0)
    @cards.each do |card|
      @hand_ranks[card.find_value] += 1
      @suits[card.suit] += 1
    end
    { ranks: @hand_ranks, suits: @suits }
  end

  def print
  end


  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    flush? && straight? && @value_chart[:ranks].keys.min == 10
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    @value_chart[:ranks].has_value? 4
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    @value_chart[:suits].has_value? 5 
  end
  
  def straight?
    ranks = @value_chart[:ranks].keys.sort
    (ranks.max - ranks.min) == 4 && ranks.uniq.size == 5
  end

  def three_of_a_kind?
    @value_chart[:ranks].has_value? 3 
  end

  def two_pair?
    @value_chart[:ranks].values.select { |v| v == 2 }.size == 2 
  end

  def pair?
    @value_chart[:ranks].has_value? 2 
  end
end 

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = generate_deck
  end

  def generate_deck
    deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle!
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private
    
    def reset
      @deck = generate_deck
    end
end

class Card
  FACE_CARDS = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
 
  def find_value
    if FACE_CARDS.keys.include?(@rank)
      val = FACE_CARDS[@rank] 
    else
      val = @rank
    end
  end

  def <=>(other)
    self.find_value <=> other.find_value
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

end

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
