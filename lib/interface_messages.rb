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