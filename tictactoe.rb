# frozen_string_literal: true

# Class that handles getting input from players
class Player
  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = game_piece
  end

  def take_square(erorr = '')
    puts erorr unless erorr == ''

    puts 'Please choose a square(0-8): '
    square_choice = gets.chomp.to_i

    # Try again if the player input is invalid
    square_choice = take_square("#{square_choice} is not a value 0-8") if square_choice.negative? || square_choice > 8

    square_choice
  end
end

# Class that handles idividual game board squares
class Square
  attr_reader :value

  def initialize
    @value = ' '
  end

  def taken?
    @value != ' '
  end

  def take(value)
    @value = value unless taken?
  end

  def reset
    @value = ' '
  end
end

# Class that manages the suares that make up the game board
class GameBoard
  def initialize
    @board = Array.new(9, Square)
  end

  private

  def reset_board
    @board.each(&:reset)
  end
end

# Class that handles input from players and checking for a winner
class Game
  def initialize
    # Create the two players
    @player_x = Player.new('X')
    @player_o = Player.new('O')

    @game_board = GameBoard.new
  end
end
