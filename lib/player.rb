class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def choose_column
    puts "#{@name}, choose a column number to place your mark (1-7)"
    number = input
    number
  end

  private 

  def input
    number = nil
    loop do
      number = gets.chomp.to_i
      break if number.between?(1, 7)
      puts "Invalid number"
    end
    number
  end
end