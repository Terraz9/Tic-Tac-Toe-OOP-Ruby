require_relative '../lib/board'
require_relative '../lib/interface_messages'
require_relative '../lib/player'
require_relative '../lib/win_conditions'



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

Round1 = PlayRound.new