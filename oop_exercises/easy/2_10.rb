# Now that we have a Walkable module, we are given a new challenge. 
# Apparently some of our users are nobility, and the regular way of 
# walking simply isn't good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:


# module Walkable 
#   def walk
#     "#{self.name} #{gait} forward"
#   end
# end 

# class Noble 
#   include Walkable 
#   attr_reader :name, :title 

#   def initialize(name, title)
#     @name = name
#     @title = title 
#   end

#   def gait
#     "struts"
#   end
  
#   def walk
#     "#{title} " + super
#   end 
# end


module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title

  include Walkable

  def initialize(name, title)
    @title = title
    @name = name
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"


p byron.name
# => "Byron"
p byron.title
# => "Lord"




# Rock Paper Scissors Game: 

# 1) the user makes a choice
# 2) the computer makes a choice
# 3) the winner is displayed

# OOP Method: 

# Write a textual description of the problem or exercise.
# Extract the major nouns and verbs from the description.
# Organize and associate the verbs with the nouns.
# The nouns are the classes and the verbs are the behaviors or methods.

# 1) Textual Description 

# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# 2) Nouns/Verbs 

# Nouns: player, move, rule
# Verbs: choose, compare

# 3)

# Player 
  # - choose 
# Move
# Rule
 
# - compare??

# 4) 

# class Player 
#   attr_accessor :move, :name

#   def initialize(player_type= :human)
#     @player_type = player_type
#     @move = nil 
#     set_name 
#   end 

#   def set_name
#     if human?
#       n = ''
#       loop do 
#         puts "What is your human name?"
#         n = gets.chomp 
#         break unless n.empty?
#         puts "Sorry, human, you must enter a value."
#       end 
#       self.name = n
#     else
#       self.name = ['HAL', 'Wall-E', 'The Robots'].sample
#     end
#   end

#   def choose 
#     if human?
#       choice = nil
#       loop do
#         puts "Please select rock, paper or scissors."
#         choice = gets.chomp
#         break if ['rock', 'paper', 'scissors'].include?(choice)
#         puts "Sorry, #{choice} is not a valid input."
#       end
#       self.move = choice
#     else 
#       self.move = ['rock', 'paper', 'scissors'].sample 
#     end
#   end

#   def human?
#     @player_type == :human 
#   end
# end 

# # Game Orchestration Engine 
# class RPSGame
#   attr_accessor :human, :computer

#   def initialize 
#     @human = Player.new
#     @computer = Player.new(:computer)
#   end

#   def display_welcome_message
#     puts "Welcome to Rock, Paper, Scissors, #{human.move}."
#   end

#   def display_goodbye_message
#     puts "Thanks for playing Rock, Paper, Scissors. Goodbye."
#   end

#   def display_winner 
#     puts "#{human.name} chose #{human.move}."
#     puts "#{computer.name} chose #{computer.move}"

#     sleep(1)
#     case human.move 
#     when 'rock'
#       puts "You won!" if computer.move == 'scissors'
#       puts "#{computer.name} won!" if computer.move == 'paper'
#       puts "Cat's game" if computer.move == human.move
#     when 'paper'
#       puts "You won!" if computer.move == 'rock'
#       puts "#{computer.name} won!" if computer.move == 'scissors'
#       puts "Cat's game" if computer.move == human.move
#     when 'scissors'
#       puts "You won!" if computer.move == 'paper'
#       puts "#{computer.name} won!" if computer.move == 'rock'
#       puts "Cat's game" if computer.move == human.move
#     end
#   end

#   def play_again?
#     answer = nil
#     loop do 
#       puts "Would you like to play again, #{human.name}? (y/n)"
#       answer = gets.chomp
#       break if ['yes', 'y', 'no', 'n'].include? answer.downcase
#       puts "That is not a valid input." 
#     end
#     return true if answer == 'yes' || answer == 'y' 
#     false 
#   end

#   def play
#     display_welcome_message
#     loop do 
#       human.choose 
#       computer.choose 
#       display_winner
#       break unless play_again?
#     end
#     display_goodbye_message
#   end
# end

# RPSGame.new.play





####
####
####
####
#### Refactored 
####
####
####
#### 

# class Rule
#   def initialize
#   end 
# end

# def compare(move1, move2)
# end


