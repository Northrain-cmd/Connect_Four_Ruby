require './lib/player'

class GameBoard
  attr_accessor :state, :player1, :player2
  def initialize
    @state = Array.new(6).fill(Array.new(7).fill("."))
  end

  def show_board
    @state.each do |row|
      row.each do |cell|
        print cell, ' '
      end
      puts ''
    end
  end

  def init_players
    puts "Player 1, please enter your name"
    @player1 = Player.new(gets.chomp)
    puts "Player 2, please enter your name"
    @player2 = Player.new(gets.chomp)
  end
end