module InterfaceMessages
  def start_game_asking
    puts "Would you like to start the game? Y/n"
    answer = gets.chomp
    case answer
    when "Y", "y", ""
      self.assign_names
    else
      puts "Fine"
    end
  end
  def assign_names
    puts "What's your name Player 1?"
    @player_1 = Player.new("x")
    puts "What's your name Player 2?"
    @player_2 = Player.new("o")
    self.starting_round_message
  end

  def starting_round_message
    puts "----------------------------"
    puts "Let's start!!!"
    self.board.print_matrix
    puts "----------------------------"
    self.game_loop
  end

  def win_message(player)
    puts "The AMAZING DIGITAL WINNER IS #{player.name}"
  end

end


module WinConditions
  def diagonal_checker(player)
    self.board.container.all? do |row|
    end
  end

  def horizontal_checker(player)
    self.board.container.any? do |row|
      row.all? {|column| column == player.player_mark}
    end
  end

  def vertical_checker(player)
    (0..2).any? do |col|
    self.board.container.all? {|row| row[col] == player.player_mark}
    end
  end
  
  def somebody_won?
    if self.horizontal_checker(self.player_1) || self.horizontal_checker(self.player_2) || self.vertical_checker(self.player_1) || self.vertical_checker(self.player_2)
      true
    else
      false
    end
  end

end

class PlayRound
  include WinConditions
  include InterfaceMessages
  attr_reader :player_1, :player_2, :board
  def initialize
    puts "Welcome to the AMAZING DIGITAL Tic-Tac-Toe coded by Terraz!!!"
    @board = Board.new
    self.board.print_matrix
    self.start_game_asking
  end

  def game_loop
    until somebody_won?
      player_turn(self.player_1)
      if somebody_won?
        self.win_message(self.player_1)
      end
      break if somebody_won?

      player_turn(self.player_2)
      if somebody_won?
        self.win_message(self.player_2)
      end
      break if somebody_won?
    end
  end


  def player_turn(player)
    player.play
    if self.board.empty_cell?(player.row, player.column)
    self.board.update_board(player.row, player.column, player.player_mark)
    self.board.print_matrix
    else
      puts "The space is occupied, sir"
      player_turn(player)
    end
  end
  
end

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

Round1 = PlayRound.new