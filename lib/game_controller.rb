require './lib/board'

class GameController
  attr_accessor :gameboard
  def initialize
    @gameboard = GameBoard.new
  end

  def make_move
    
  end
end