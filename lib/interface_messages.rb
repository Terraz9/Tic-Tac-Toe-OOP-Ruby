# frozen_string_literal: true

# This module contains all the messages displayed in the interface in a sequential way
module InterfaceMessages
  def start_game_asking
    puts 'Would you like to start the game? Y/n'
    answer = gets.chomp
    case answer
    when 'Y', 'y', ''
      assign_names
    else
      puts 'Fine'
    end
  end

  def assign_names
    puts "What's your name Player 1?"
    @player1 = Player.new('x')
    puts "What's your name Player 2?"
    @player2 = Player.new('o')
    starting_round_message
  end

  def starting_round_message
    puts '----------------------------'
    puts "Let's start!!!"
    board.print_matrix
    puts '----------------------------'
    game_loop
  end

  def win_message(player)
    puts "The AMAZING DIGITAL WINNER IS #{player.name}"
  end

  def tie_message
    puts "It's a TIE"
  end
end
