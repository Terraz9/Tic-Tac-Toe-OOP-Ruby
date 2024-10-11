module WinConditions
  def diagonal_checker(player)
    #main diagonal = [0][0], [1][1], [2][2]
    main_diagonal = (0..2).all? {|i| self.board.container[i][i] == player.player_mark}
    #anti_diagonal = [0][2], [1][1], [2][0]
    anti_diagonal = (0..2).all? {|i| self.board.container[i][2-i] == player.player_mark}

    main_diagonal || anti_diagonal
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
    if self.horizontal_checker(self.player_1) || self.horizontal_checker(self.player_2) || self.vertical_checker(self.player_1) || self.vertical_checker(self.player_2) || diagonal_checker(self.player_1) || diagonal_checker(player_2)
      true
    else
      false
    end
  end

end
