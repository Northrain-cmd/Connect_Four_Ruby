require './lib/player'

class GameBoard
  attr_accessor :state, :player1, :player2
  def initialize
    @state = Array.new(6) { Array.new(7) }
  end

  def show_board
    empty = "\u26AB" 
    puts ''
    7.times do |i| 
       print '   ',  i+1, '  '
    end
    puts '', ''
    @state.each do |row|
      row.each do |cell|
        print "  #{cell || empty}  "
      end
      puts '', ''
    end
  end

  def change_state(column, player = 1)
    mark = player == 1 ? "\u{1F534}" : "\u{1F535}"
    return nil unless column.between?(1,7)
    row = 5
    until @state[row][column - 1].nil? do
      row -= 1 
      break if row <= 0
    end
    @state[row][column - 1] = mark
    show_board
  end

  def init_players
    puts "Player 1, please enter your name"
    @player1 = Player.new(gets.chomp)
    puts "Player 2, please enter your name"
    @player2 = Player.new(gets.chomp)
  end
end