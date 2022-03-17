# Create an object-oriented number guessing class for numbers in the range 1 to 100, 
# with a limit of 7 guesses per game. The game should play like this:

# Guessing Game

# Guessing Game is a game where a user chooses a number, 1-100, and is told if 
# their choosen number is too low, too high or if it is the correct number. 

# A user wins if they guess the correct number in 7 turns. 
# A user loses if they do not guess the correct number in 7 turns. 

# Player 
# - attr_reader @guess (can be read from GGGameplay)
# - can make guesses

# GGGameplay (orchestration engine)
# Interface: set_winning_number, check_player_guess, play_game 
# Collaborators: Player

# MY SOLUTION

# class Player
#   attr_reader :guess, :num_of_guesses

#   def initialize 
#     @guess = nil
#     @num_of_guesses = 7
#   end

#   def guess_number
#     loop do 
#       print "Enter a number between 1-100: "
#       @guess = gets.chomp.to_i
#       break if num_valid?(@guess)
#       puts "Invalid guess. Enter a number between 1 and 100:"
#     end
#     @guess
#   end

#   def decrement_num_of_guesses
#     @num_of_guesses -= 1
#   end

#   def gusss_num_decrement_guesses
#     decrement_num_of_guesses
#     guess_number
#   end

#   private

#   def num_valid?(num)
#     (0..100).to_a.include?(num)
#   end
# end

# class GuessingGame
#   attr_reader :player, :winning_num

#   def initialize
#     @player = Player.new 
#     @winning_num = select_winning_num
#   end

#   def play 
#     display_welcome_message 
#     loop do
#       display_guesses_remaining
#       check_player_guess
#       break if player_guesses_over? || winner? 
#     end
#     display_goodbye_message
#   end

#   private

#   def display_welcome_message 
#     puts "Welcome to the Guessing Game"
#   end

#   def display_goodbye_message
#     return "That's correct!" if winner?
#     puts ""
#     puts "You have no more guesses. You lost!"
#   end

#   def display_guesses_remaining
#     puts ""
#     puts "You have #{player.num_of_guesses} guesses remaining."
#   end

#   def select_winning_num
#     (0..100).to_a.sample
#   end

#   def check_player_guess
#     guess = player.gusss_num_decrement_guesses
#     case
#     when guess > winning_num
#       puts "Your guess is too high."
#     when guess < winning_num
#       puts "Your guess is too low."
#     else
#       puts "That's the number!"
#     end
#   end

#   def player_guesses_over?
#     player.num_of_guesses < 1
#   end

#   def winner?
#     player.guess == winning_num
#   end
# end

# game = GuessingGame.new
# game.play





# LS 

class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high:  :lose,
    low:   :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  def initialize
    @secret_number = nil
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(RANGE)
  end

  def play_game
    result = nil
    MAX_GUESSES.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_one_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
      guess = gets.chomp.to_i
      return guess if RANGE.cover?(guess)
      print "Invalid guess. "
    end
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end

game = GuessingGame.new
game.play