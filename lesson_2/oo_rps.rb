class Move
  VALUES = {
    "r" => "Rock",
    "p" => "Paper",
    "sc" => "Scissors",
    "l" => "Lizard",
    "sp" => "Spock"
  }

  WINNING_COMBINATIONS = {
    "Rock" => ["Scissors", "Lizard"],
    "Paper" => ["Rock", "Spock"],
    "Scissors" => ["Paper", "Lizard"],
    "Lizard" => ["Spock", "Paper"],
    "Spock" => ["Rock", "Scissors"]
  }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_COMBINATIONS[value].include?(other_move.value)
  end

  def to_s
    @value
  end

  protected

  attr_reader :value
end

class Player
  attr_accessor :move, :name, :score, :move_history

  CHOICES = "Please choose: 'r' for rock, 'p' for paper, 'sc' for scissors, 'sp' for spock or `l` for lizard."

  def initialize
    set_name
    @score = 0
    @move_history = []
  end

  def wins
    self.score += 1
    puts "#{name} won!"
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "Please enter your name."
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, human, you must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts CHOICES
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, #{choice} is not a valid input."
    end
    self.move = Move.new(Move::VALUES[choice])
  end
end

class Computer < Player # Computer will always choose at random
  def set_name
    self.name = 'Mac'
  end

  def choose
    self.move = Move.new(Move::VALUES.values.sample)
  end
end

class Spock < Computer # Spock will always choose the move 'spock'
  def choose
    self.move = Move.new('Spock')
  end

  private

  def set_name
    self.name = 'Spock'
  end
end

class Stockfish < Computer # Stockfish will always win
  def choose(human)
    Move::WINNING_COMBINATIONS.each do |k, v|
      self.move = Move.new(k) if v.include?(human.move.to_s)
    end
    move
  end

  private

  def set_name
    self.name = "Stockfish"
  end
end

class RPSGame # Game Orchestration Engine
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = [Stockfish.new, Spock.new, Computer.new].sample
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock, #{human.name}."
    puts "First to 3 points wins!"
    puts ""
  end

  def display_goodbye_message
    puts "Your move list: #{human.move_history.join(', ')}."
    puts human.score == 3 ? "Excellent choices." : "Better luck next time."
    puts ""
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye."
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
    sleep(1)
  end

  def capture_move_history
    human.move_history << human.move.to_s
    computer.move_history << computer.move.to_s
  end

  def display_winner
    if human.move > computer.move
      human.wins
    elsif computer.move > human.move
      computer.wins
    else
      puts "Cat's game"
    end
  end

  def display_score
    puts "SCORE: #{human.name}: #{human.score}\
    #{computer.name}: #{computer.score}"
    puts ""
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again, #{human.name}? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "That is not a valid input."
    end
    return true if answer == 'yes' || answer == 'y'
    false
  end

  def play_one_round
    human.choose
    computer.name == "Stockfish" ? computer.choose(human) : computer.choose
    display_moves
    capture_move_history
    display_winner
    display_score
  end

  def play_game
    display_welcome_message
    loop do
      play_one_round
      break if human.score == 3 || computer.score == 3
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play_game
