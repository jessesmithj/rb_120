# Using the Card class from the previous exercise, create a Deck class that contains 
# all of the standard 52 playing cards. Use the following code to start your work:

# The Deck class should provide a #draw method to deal one card. 
# The Deck should be shuffled when it is initialized and, if it runs out of cards, 
# it should reset itself by generating a new set of 52 shuffled cards.

# Note that the last line should almost always be true; 
# if you shuffle the deck 1000 times a second, you will be very, 
# very, very old before you see two consecutive shuffles produce the same results. 
# If you get a false result, you almost certainly have something wrong.


class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    reset 
    # when deck runs out, it should reset itself by generating a new set of 52 shuffled cards
  end

  def draw
    reset if @deck.empty?
    @deck.shift #deal one card
  end

  private

  def reset
    new_deck = RANKS.product(SUITS).shuffle
    52.times do |_|
      card = new_deck.shift
      @deck << Card.new(card.first, card.last)
    end
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
    VALUES.fetch(rank, rank) # #fetch - if key is not found, exception will be raised unless a default value is provided (as the second argument)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end



deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
