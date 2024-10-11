class Player
  attr_accessor :row, :column, :player_mark
  attr_reader :name
  def initialize(player_mark)
    @player_mark = player_mark
    @name = gets.chomp
  end
  def get_row
    puts "What row? from 1 to 3"
    @row = gets.chomp.to_i - 1
  end

  def get_column
    puts "What Column? from 1 to 3"
    @column = gets.chomp.to_i - 1
  end

  def play
    puts "#{self.name}'s turn"
      self.get_row
      self.get_column
  end

end