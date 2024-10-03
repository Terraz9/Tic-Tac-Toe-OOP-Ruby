module WinConditions
  def diagonal_checker

  end
  def horizontal_checker
    self.board.container.any? do |row|
      row.all? {|column| column == self.player_1.player_mark}
      row.all? {|column| column == self.player_2.player_mark}
    end
  end

  def vertical_checker

  end
end

class PlayRound
  include WinConditions
  attr_reader :player_1, :player_2, :board
  def initialize
    puts "Welcome to the AMAZING DIGITAL Tic-Tac-Toe coded by Terraz!!!"
    @board = Board.new
    self.board.print_matrix
    start_game_asking
  end
  def start_game_asking
    puts "Would you like to start the game? Y/n"
    answer = gets.chomp
    case answer
    when "Y", "y", ""
      assign_names
    else
    end
  end
  def assign_names
    puts "What's your name Player 1?"
    @player_1 = Player.new("x")
    puts "What's your name Player 2?"
    @player_2 = Player.new("o")
    start_round
  end
  def start_round
    puts "----------------------------"
    puts "Let's start!!!"
    self.board.print_matrix
    puts "----------------------------"
    player_1_turn
  end

  def player_1_turn
    puts "#{self.player_1.name}'s turn"
    self.player_1.get_row
    self.player_1.get_column
    if self.board.container[self.player_1.row][self.player_1.column] == "*"
    self.board.update_board(self.player_1.row, self.player_1.column, self.player_1.player_mark)
      else
       puts "It seems that space is already occupied, sir"
       player_1_turn
    end
    self.board.print_matrix
    puts "----------------------------"
    if self.horizontal_checker == true
    puts "The AMAZING DIGITAL WINNER IS #{self.player_1.name}"
    else
    self.player_2_turn
    end
  end


  def player_2_turn
    puts "#{self.player_2.name}'s turn"
    self.player_2.get_row
    self.player_2.get_column
    if self.board.container[self.player_2.row][self.player_2.column] == "*"
      self.board.update_board(self.player_2.row, self.player_2.column, self.player_2.player_mark)
      else
        puts "It seems that space is already occupied, sir"
        player_2_turn
    end
      self.board.print_matrix
      puts "----------------------------"
      
    if self.horizontal_checker == true
       puts "The AMAZING DIGITAL WINNER IS #{self.player_2.name}, Congratulations!!"
      else
        self.player_1_turn
    end
  end

end

class Board
  attr_accessor :container
  def initialize
    @container = self.get_board
  end
  def get_board
    Array.new(3) { Array.new(3,"*")}
  end

  def update_board(row, column, player_mark)
    self.container[row][column] = player_mark
  end

  def print_matrix
    self.container.each do |row|
      puts row.join(" ")
    end
  end
end



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


end

Round1 = PlayRound.new