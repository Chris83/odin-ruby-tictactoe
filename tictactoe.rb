class Player
  attr_reader :game_piece

  def initialize(game_piece)
    @game_piece = game_piece
  end
end

class Square
  def initialize
    @value = ' '
  end

  def is_taken?
    return @value != ' '
  end

  def take(value)
    @value = value
  end
end

class Game
  def initialize
    # Create the two players
    @player_x = Player.new('X')
    @player_o = Player.new('O')

    # Build the game board with 9 Squares
    @board = Array.new()
    9.times { @board.push(Square.new()) }
  end
end
