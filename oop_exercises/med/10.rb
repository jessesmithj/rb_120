class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
    @deck.shuffle!
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 
             'King' => 13, 'Ace' => 14 } 

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end



# In the previous two exercises, you developed a Card class and a Deck class. 
# You are now going to use those classes to create and evaluate poker hands. 

# Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates 
# those cards as a Poker hand. If you've never played poker before, you may find 
# this overview of poker hands useful.

# You should build your class using the following code skeleton:


# First Solution

# class PokerHand
#   attr_reader :hand

#   def initialize(deck)
#     @hand = deal_hand(deck)
#   end

#   def deal_hand(deck)
#     hand = []
#     5.times { |_| hand << deck.draw}
#     hand
#   end

#   def print
#     hand = []
#     @hand.map { |card| hand << card.to_s}
#     puts hand
#   end

#   def evaluate
#     case
#     when royal_flush?     then 'Royal flush'
#     when straight_flush?  then 'Straight flush'
#     when four_of_a_kind?  then 'Four of a kind'
#     when full_house?      then 'Full house'
#     when flush?           then 'Flush'
#     when straight?        then 'Straight'
#     when three_of_a_kind? then 'Three of a kind'
#     when two_pair?        then 'Two pair'
#     when pair?            then 'Pair'
#     else                       'High card'
#     end
#   end

#   private

#   def royal_flush?
#     @hand.map { |card| card.value }.sort.min == 10 && flush? 
#   end

#   def straight_flush?
#     straight? && flush?
#   end

#   def four_of_a_kind?
#     cards = Hash.new(0)
#     @hand.each do |card|
#       cards[card.value] += 1 
#     end
#     cards.values.count(4) == 1
#   end

#   def full_house?
#     cards = Hash.new(0)
#     @hand.each do |card|
#       cards[card.value] += 1 
#     end
#     cards.values.count(3) == 1 && cards.values.count(2) == 1
#   end

#   def flush?
#     card_suits = []
#     @hand.each do |card|
#       card_suits << card.suit
#     end
#     card_suits.uniq.size == 1
#   end

#   def straight?
#     cards = {}
#     @hand.each do |card|
#       cards[card.value] = card.suit
#     end

#     sorted_cards = cards.keys.sort
#     sorted_cards[0..-2].each_with_index do |card, idx| 
#       return false if card + 1 != sorted_cards[idx + 1]
#     end
#     true
#   end

#   def three_of_a_kind?
#     cards = Hash.new(0)
#     @hand.each do |card|
#       cards[card.value] += 1 
#     end
#     cards.values.count(3) == 1
#   end

#   def two_pair?
#     pairs = Hash.new(0)
#     @hand.each do |card|
#       pairs[card.value] += 1 
#     end
#     pairs.values.count(2) == 2
#   end

#   def pair?
#     pairs = Hash.new(0)
#     @hand.each do |card|
#       pairs[card.value] += 1 
#     end
#     pairs.values.count(2) == 1
#   end
# end


# LS Solution

# class PokerHand
#   def initialize(cards)
#     @cards = []
#     @rank_count = Hash.new(0)

#     5.times do
#       card = cards.draw
#       @cards << card
#       @rank_count[card.rank] += 1
#     end
#   end

#   def print
#     puts @cards
#   end

#   def evaluate
#     if    royal_flush?     then 'Royal flush'
#     elsif straight_flush?  then 'Straight flush'
#     elsif four_of_a_kind?  then 'Four of a kind'
#     elsif full_house?      then 'Full house'
#     elsif flush?           then 'Flush'
#     elsif straight?        then 'Straight'
#     elsif three_of_a_kind? then 'Three of a kind'
#     elsif two_pair?        then 'Two pair'
#     elsif pair?            then 'Pair'
#     else 'High card'
#     end
#   end

#   private

#   def flush?
#     suit = @cards.first.suit
#     @cards.all? { |card| card.suit == suit }
#   end

#   def straight?
#     return false if @rank_count.any? { |_, count| count > 1 }

#     @cards.min.value == @cards.max.value - 4
#   end

#   def n_of_a_kind?(number)
#     @rank_count.one? { |_, count| count == number }
#   end

#   def straight_flush?
#     flush? && straight?
#   end

#   def royal_flush?
#     straight_flush? && @cards.min.rank == 10
#   end

#   def four_of_a_kind?
#     n_of_a_kind?(4)
#   end

#   def full_house?
#     n_of_a_kind?(3) && n_of_a_kind?(2)
#   end

#   def three_of_a_kind?
#     n_of_a_kind?(3)
#   end

#   def two_pair?
#     @rank_count.select { |_, count| count == 2 }.size == 2
#   end

#   def pair?
#     n_of_a_kind?(2)
#   end
# end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

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
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
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