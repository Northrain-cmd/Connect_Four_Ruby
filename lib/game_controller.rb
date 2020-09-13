require './lib/board'

class GameController
  attr_accessor :gameboard, :turn, :game_over
  def initialize
    @gameboard = GameBoard.new
    @turn = 1
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def make_move
    cur_player = @turn == 1 ? @gameboard.player1 : @gameboard.player2
    p cur_player
    col = cur_player.choose_column
    @gameboard.change_state(col, @turn)
    change_turn
  end

  def check_board
    board = @gameboard.state
    state.each do |row|
      row.match(/\u{1F534}{4}/)
    end
  end

  private

  def change_turn
    @turn == 1 ? @turn = 2 : @turn = 1
  end
end