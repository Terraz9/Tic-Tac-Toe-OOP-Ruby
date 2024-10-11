class Board
  attr_accessor :container

  def initialize
    @container = self.get_board
  end

  def print_matrix
    self.container.each do |row|
      puts row.join(" ")
    end
  end
    
  def get_board
    Array.new(3) { Array.new(3,"*")}
  end
  
  def update_board(row, column, player_mark)
    self.container[row][column] = player_mark
  end

def empty_cell?(row, column)
  if self.container[row][column] == "*"
    true
  else
    false
  end
end

end