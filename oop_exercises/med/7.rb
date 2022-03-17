# In the previous exercise, you wrote a number guessing game that 
# determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

# Update your solution to accept a low and high value when you create a 
# GuessingGame object, and use those values to compute a secret number for the game. 
# You should also change the number of guesses allowed so the user can always win 
# if she uses a good strategy. You can compute the number of guesses with:

# class Player
#   attr_reader :guess

#   def initialize 
#     @guess = nil
#   end

#   def gusss_num_decrement_guesses
#     decrement_num_of_guesses
#     guess_number
#   end

#   private

#   def guess_number
#     loop do 
#       @guess = gets.chomp.to_i
#       break if num_valid?(@guess)
#       puts "Invalid guess. Enter a number between 1 and 100:"
#     end
#     @guess
#   end

#   def decrement_num_of_guesses
#     @num_of_guesses -= 1
#   end

#   def num_valid?(num)
#     (@low_range..@high_range).to_a.include?(num)
#   end
# end


# MY ANSWER

require 'pry'

class GuessingGame
  attr_reader :winning_num, :num_of_guesses

  def initialize
    @low_range = select_low_range_num
    @high_range = select_high_range_num
    @winning_num = select_winning_num
    @num_of_guesses = determine_num_of_guesses
  end

  def play 
    display_welcome_message 
      loop do
        display_guesses_remaining
        player_guess = guess_number
        decrement_num_of_guesses
        check_player_guess(player_guess)
        break if player_guesses_over_limit? || winner?(player_guess)
      end
    display_goodbye_message
  end

  private

  def display_welcome_message 
    puts "Welcome to the Guessing Game"
  end

  def display_goodbye_message
    return "That's correct!" if @num_of_guesses > 0
    puts ""
    puts "You have no more guesses. You lost!"
  end

  def display_guesses_remaining
    puts ""
    puts "You have #{num_of_guesses} guesses remaining."
    print "Enter a number between #{@low_range}-#{@high_range}: "
  end

  def determine_num_of_guesses
    Math.log2(@high_range - @low_range).to_i + 1
  end

  def select_winning_num
    (@low_range..@high_range).to_a.sample
  end

  def select_low_range_num
    low_range = nil
    loop do
      print "Choose a low range number: "
      low_range = gets.chomp.to_i
      break if low_range == low_range.to_s.to_i
    end 
    low_range
  end

  def select_high_range_num
    high_range = nil
    loop do
      print "Choose a high range number: "
      high_range = gets.chomp.to_i
      break if high_range > @low_range &&
               high_range == high_range.to_s.to_i
    end
    high_range
  end

  def check_player_guess(num)
    guess = num
    case
    when guess > winning_num
      puts "Your guess is too high."
    when guess < winning_num
      puts "Your guess is too low."
    when guess == winning_num
      puts "That's the number!"
    end
  end

  def guess_number
    guess = nil
    loop do 
      guess = gets.chomp.to_i
      break if num_valid?(guess)
      puts "Invalid guess. Enter a number between #{@low_range} and #{@high_range}: "
    end
    guess
  end

  def decrement_num_of_guesses
    @num_of_guesses -= 1
  end

  def player_guesses_over_limit?
    @num_of_guesses < 1
  end

  def num_valid?(num)
    (@low_range..@high_range).to_a.include?(num)
  end

  def winner?(num)
    num == winning_num
  end
end

game = GuessingGame.new
game.play