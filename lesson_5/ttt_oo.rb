require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def marked_keys
    @squares.select { |_, sq| sq.marked? }.keys
  end

  # def at_risk_square(marker)
  #   WINNING_LINES.each do |line|
  #     squares = @squares.values_at(*line)
  #     if complete_this_line?(squares, marker)
  #       return key_of_unmarked_square_from_line(line)
  #     end
  #   end

  # def find_values
  #   @squares.values_at(1, 2, 3)#.count(" ")
  # end

  # def at_risk_square(marker_type)
  #   WINNING_LINES.each do |line|
  #     squares = @squares.values_at(*line)
  #     if two_identical_markers?(squares, marker_type)
  #       at_risk_square = @squares.select do |position, square|
  #         line.include?(position) && square.marker == Square::INITIAL_MARKER
  #       end
  #       return at_risk_square.keys.first
  #     end
  #   end
  #   nil
  # end

  def find_at_risk_square
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).count("X") == 2 ### i think the issue is the "x" beacuse each value is a square object, so we need to assess the marker value
        return @squares.select do |k, _v|
                 line.include?(k) && @squares[k].marker == ' '
               end.keys.first
      end
    end
    nil
  end

  # def find_line_threats
  #   line_threats = WINNING_LINES.select do |line|
  #     squares = @squares.values_at(*line)
  #     identical_markers?(squares, num_markers: 2)
  #   end
  #   return nil if line_threats.empty?
  #   line_threats
  # end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def identical_markers?(squares, markers_size=3)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != markers_size
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do
      display_board
      player_move
      display_result
      display_score
      sleep(2)
      # break unless play_again?
      break if winner?
      reset
      display_play_again_message
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye."
  end

  def display_board
    puts "You're '#{human.marker}'. Computer is '#{computer.marker}'."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    puts "Choose a square: (#{board.joinor(board.unmarked_keys)})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  # hash of winning line numbers
  # iterate through each array of numbers (a winning line)
  # if any two of those values ahve a human marker && one value is a an space
  # computer to move at corresponding key of empty space value
  # else choose a random spot

  def computer_moves
    binding.pry
    if !board.find_at_risk_square.nil?
      board[board.find_at_risk_square] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def increment_human_score
    human.score += 1
  end

  def increment_computer_score
    computer.score += 1
  end

  def winner?
    human.score == 3 || computer.score == 3
  end

  def display_score
    puts "Score: You: #{human.score} Computer: #{computer.score}"
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      increment_human_score
      puts "You won!"
    when computer.marker
      increment_computer_score
      puts "Computer won!"
    else
      puts "Cat's game!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be 'y' or 'n'."
    end
    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
