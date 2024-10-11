# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/interface_messages'
require_relative '../lib/player'
require_relative '../lib/win_conditions'

# This class performs the start of the game and finish it when somebody wins
class PlayRound
  include WinConditions
  include InterfaceMessages
  attr_reader :player1, :player2, :board

  def initialize
    puts 'Welcome to the AMAZING DIGITAL Tic-Tac-Toe coded by Terraz!!!'
    @board = Board.new
    board.print_matrix
    start_game_asking
  end

  def game_loop
    until game_over?
      play_turn_and_check(player1)
      break if game_over?

      play_turn_and_check(player2)
      break if game_over?
    end
  end

  def play_turn_and_check(player)
    player_turn(player)
    if somebody_won?
      win_message(player)
    elsif board.no_space? && somebody_won? == false
      tie_message
    end
  end

  def game_over?
    somebody_won? || board.no_space?
  end

  def player_turn(player)
    player.play
    if board.empty_cell?(player.row, player.column)
      board.update_board(player.row, player.column, player.player_mark)
      board.print_matrix
    else
      puts 'The space is occupied, sir'
      player_turn(player)
    end
  end
end

Round1 = PlayRound.new
