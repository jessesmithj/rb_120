# Code Spike:

# # Nouns: card, player, dealer, participant, deck, game
# # Verbs: deal, hit, stay, busts (state, is the player/dealer busted?), total (calculate)

# Player
# - hit
# - stay
# - busted?
# - total
# Dealer
# - hit
# - stay
# - busted?
# - total
# - deal (should this be here, or in Deck?)
# Participant
# Deck
# - deal (should this be here, or in Dealer?)
# Card
# Game
# - start

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

## CRC Cards (Class Responsiblity Colloborator)

# Participant
# state: name, hand
# interface: hit, stay, busted. total (need to know info about cards)
# colloborators: Card (hand consists of two cards from 1 deck)

# Player < Participant
# interface: choose_name

# Dealer < Participant

# Deck
# state: cards
# interface: init_deck, deal
# colloborators: Card

# Card
# state: card
# interface: value
# colloborators: none

# Game
# state: player, dealer, deck (card not necessary because card is a state in Player/Dealer)
# interface: start
# colloborators: player, dealer, deck

require 'io/console'
require 'pry'

class Participant
  attr_reader :name, :hand

  def initialize
    @name = name
    @hand = []
  end

  # def hit
  #   @Deck.pop # is this necessary; if so, is it possible to 'hit' without the Deck class as a colloborator object? (doubtful)
  # end

  # def stay
  #   # this method likely does not need to exist
  # end

  def busted?
    total > 21 # currently does not appear to be working
  end

  def total
    total = 0
    hand.each do |card|
      total += card.value
    end

    hand.select { |card| card.rank == "A" }.count.times do
      total -= 10 if total > 21
    end

    total
  end
end

class Player < Participant
  def initialize
    @name = choose_name
    @hand = super
  end

  def choose_name
    name = nil
    loop do
      puts "What is your name?"
      name = gets.chomp
      break if name.empty? == false
      puts "You must enter at least one character."
    end
    name
  end
end

class Dealer < Participant
  def initialize
    @name = "Chappie the Dealer"
    @hand = super
  end
end

class Deck
  attr_reader :deck

  SUITS = %w(H C D S)
  RANKS = (2..10).to_a + ["J", "Q", "K", "A"]

  def initialize
    @deck = init_deck
  end

  def init_deck
    new_deck = RANKS.product(SUITS)
    new_deck.map! { |single_card| Card.new(single_card[0].to_s) }
    new_deck.shuffle
  end

  def deal_one_card
    deck.pop
  end
end

class Card
  attr_reader :rank

  def initialize(rank)
    @rank = rank
  end

  def value
    value = 0
    value += if rank == "A"
               11
             elsif rank.to_i == 0
               10
             else
               rank.to_i
             end
    value
  end

  def to_s
    rank
  end
end

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def display_welcome_message
    puts "Welcome to Twenty-One, #{player.name}."
  end

  def clear_screen
    system "clear"
  end

  def press_any_key_to_continue
    print "press any key"
    $stdin.getch
    print "            \r" # extra space to overwrite in case next sentence is short
  end

  def deal_cards
    2.times do |_|
      player.hand << deck.deal_one_card
      dealer.hand << deck.deal_one_card
    end
  end

  def display_initial_cards
    puts "Dealers Hand: #{dealer.hand[0]} & X"
    puts "Your Hand: #{player.hand[0]} & #{player.hand[1]}."
    puts ""
  end

  def player_move
    players_choosen_move = nil
    loop do
      puts "Hit or stay?"
      players_choosen_move = gets.chomp.downcase
      break if players_choosen_move == 'hit' || players_choosen_move == 'stay'
      puts "You must choose 'hit' or 'stay'"
    end
    players_choosen_move
  end

  def player_hit # (move)
    player.hand << deck.deal_one_card # if move == 'hit'
  end

  def player_total
    puts "Your total is #{player.total}"
  end

  def player_turn
    move = nil

    loop do
      move = player_move
      break if move == 'stay' # || player.busted?
      puts "#{player.name} hits"
      player_hit # (move)
      player_total
      # binding.pry
      break if player.busted?
    end

    puts "#{player.name} stays." if move == 'stay'
  end

  def dealers_hand
    puts "Dealer's Full Hand: #{dealer.hand[0]} & #{dealer.hand[1]}."
  end

  def dealer_total
    puts "Dealer's total is #{dealer.total}"
  end

  def dealer_hit_or_stay
    loop do
      if dealer.total <= 16
        puts "Dealer hits."
        dealer.hand << deck.deal_one_card
        dealer_total
      elsif dealer.busted?
        break
      else
        puts "Dealer stays."
        break
      end
    end
  end

  def dealer_turn
    dealers_hand
    dealer_hit_or_stay
  end

  def display_totals
    puts ""
    puts "=============="
    puts "#{player.name}'s total is #{player.total}"
    puts "Dealer's total is #{dealer.total}"
    puts "=============="
    puts ""
  end

  def display_final_result
    if player.total > dealer.total
      puts "#{player.name} wins!"
    elsif dealer.total > player.total
      puts "Dealer wins!"
    else
      puts "It's a tie"
    end
  end

  def start
    clear_screen
    display_welcome_message
    deal_cards
    display_initial_cards
    player_total
    player_turn
    return puts "You busted! Dealer wins." if player.busted?
    dealer_turn
    return puts "Dealer busts! #{player.name} wins." if dealer.busted?
    display_totals
    display_final_result
  end
end

Game.new.start

# LS Solution

# class Card
#   SUITS = ['H', 'D', 'S', 'C']
#   FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

#   def initialize(suit, face)
#     @suit = suit
#     @face = face
#   end

#   def to_s
#     "The #{face} of #{suit}"
#   end

#   def face
#     case @face
#     when 'J' then 'Jack'
#     when 'Q' then 'Queen'
#     when 'K' then 'King'
#     when 'A' then 'Ace'
#     else
#       @face
#     end
#   end

#   def suit
#     case @suit
#     when 'H' then 'Hearts'
#     when 'D' then 'Diamonds'
#     when 'S' then 'Spades'
#     when 'C' then 'Clubs'
#     end
#   end

#   def ace?
#     face == 'Ace'
#   end

#   def king?
#     face == 'King'
#   end

#   def queen?
#     face == 'Queen'
#   end

#   def jack?
#     face == 'Jack'
#   end
# end

# class Deck
#   attr_accessor :cards

#   def initialize
#     @cards = []
#     Card::SUITS.each do |suit|
#       Card::FACES.each do |face|
#         @cards << Card.new(suit, face)
#       end
#     end

#     scramble!
#   end

#   def scramble!
#     cards.shuffle!
#   end

#   def deal_one
#     cards.pop
#   end
# end

# module Hand
#   def show_hand
#     puts "---- #{name}'s Hand ----"
#     cards.each do |card|
#       puts "=> #{card}"
#     end
#     puts "=> Total: #{total}"
#     puts ""
#   end

#   def total
#     total = 0
#     cards.each do |card|
#       if card.ace?
#         total += 11
#       elsif card.jack? || card.queen? || card.king?
#         total += 10
#       else
#         total += card.face.to_i
#       end
#     end

#     # correct for Aces
#     cards.select(&:ace?).count.times do
#       break if total <= 21
#       total -= 10
#     end

#     total
#   end

#   def add_card(new_card)
#     cards << new_card
#   end

#   def busted?
#     total > 21
#   end
# end

# class Participant
#   include Hand

#   attr_accessor :name, :cards
#   def initialize
#     @cards = []
#     set_name
#   end
# end

# class Player < Participant
#   def set_name
#     name = ''
#     loop do
#       puts "What's your name?"
#       name = gets.chomp
#       break unless name.empty?
#       puts "Sorry, must enter a value."
#     end
#     self.name = name
#   end

#   def show_flop
#     show_hand
#   end
# end

# class Dealer < Participant
#   ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

#   def set_name
#     self.name = ROBOTS.sample
#   end

#   def show_flop
#     puts "---- #{name}'s Hand ----"
#     puts "#{cards.first}"
#     puts " ?? "
#     puts ""
#   end
# end

# class TwentyOne
#   attr_accessor :deck, :player, :dealer

#   def initialize
#     @deck = Deck.new
#     @player = Player.new
#     @dealer = Dealer.new
#   end

#   def reset
#     self.deck = Deck.new
#     player.cards = []
#     dealer.cards = []
#   end

#   def deal_cards
#     2.times do
#       player.add_card(deck.deal_one)
#       dealer.add_card(deck.deal_one)
#     end
#   end

#   def show_flop
#     player.show_flop
#     dealer.show_flop
#   end

#   def player_turn
#     puts "#{player.name}'s turn..."

#     loop do
#       puts "Would you like to (h)it or (s)tay?"
#       answer = nil
#       loop do
#         answer = gets.chomp.downcase
#         break if ['h', 's'].include?(answer)
#         puts "Sorry, must enter 'h' or 's'."
#       end

#       if answer == 's'
#         puts "#{player.name} stays!"
#         break
#       elsif player.busted?
#         break
#       else
#         # show update only for hit
#         player.add_card(deck.deal_one)
#         puts "#{player.name} hits!"
#         player.show_hand
#         break if player.busted?
#       end
#     end
#   end

#   def dealer_turn
#     puts "#{dealer.name}'s turn..."

#     loop do
#       if dealer.total >= 17 && !dealer.busted?
#         puts "#{dealer.name} stays!"
#         break
#       elsif dealer.busted?
#         break
#       else
#         puts "#{dealer.name} hits!"
#         dealer.add_card(deck.deal_one)
#       end
#     end
#   end

#   def show_busted
#     if player.busted?
#       puts "It looks like #{player.name} busted! #{dealer.name} wins!"
#     elsif dealer.busted?
#       puts "It looks like #{dealer.name} busted! #{player.name} wins!"
#     end
#   end

#   def show_cards
#     player.show_hand
#     dealer.show_hand
#   end

#   def show_result
#     if player.total > dealer.total
#       puts "It looks like #{player.name} wins!"
#     elsif player.total < dealer.total
#       puts "It looks like #{dealer.name} wins!"
#     else
#       puts "It's a tie!"
#     end
#   end

#   def play_again?
#     answer = nil
#     loop do
#       puts "Would you like to play again? (y/n)"
#       answer = gets.chomp.downcase
#       break if ['y', 'n'].include? answer
#       puts "Sorry, must be y or n."
#     end

#     answer == 'y'
#   end

#   def start
#     loop do
#       system 'clear'
#       deal_cards
#       show_flop

#       player_turn
#       if player.busted?
#         show_busted
#         if play_again?
#           reset
#           next
#         else
#           break
#         end
#       end

#       dealer_turn
#       if dealer.busted?
#         show_busted
#         if play_again?
#           reset
#           next
#         else
#           break
#         end
#       end

#       # both stayed
#       show_cards
#       show_result
#       play_again? ? reset : break
#     end

#     puts "Thank you for playing Twenty-One. Goodbye!"
#   end
# end

# game = TwentyOne.new
# game.start
