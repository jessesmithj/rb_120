require 'io/console'

class Participant
  attr_reader :name, :hand

  def initialize
    @name = name
    @hand = []
  end

  def busted?
    total > 21
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
    print "            \r"
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

  def player_hit
    player.hand << deck.deal_one_card
  end

  def player_total
    puts "Your total is #{player.total}"
  end

  def player_turn
    move = nil

    loop do
      move = player_move
      break if move == 'stay'
      puts "#{player.name} hits"
      player_hit
      player_total
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
