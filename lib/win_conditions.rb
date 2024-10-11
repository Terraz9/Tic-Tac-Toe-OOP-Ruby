# frozen_string_literal: true

# This class contains all the possible win conditions
module WinConditions
  def diagonal_checker(player)
    # main diagonal = [0][0], [1][1], [2][2]
    main_diagonal = (0..2).all? { |i| board.container[i][i] == player.player_mark }
    # anti_diagonal = [0][2], [1][1], [2][0]
    anti_diagonal = (0..2).all? { |i| board.container[i][2 - i] == player.player_mark }

    main_diagonal || anti_diagonal
  end

  def horizontal_checker(player)
    board.container.any? do |row|
      row.all? { |column| column == player.player_mark }
    end
  end

  def vertical_checker(player)
    (0..2).any? do |col|
      board.container.all? { |row| row[col] == player.player_mark }
    end
  end

  def somebody_won?
    if horizontal_checker(player1) || horizontal_checker(player2) || vertical_checker(player1) || vertical_checker(player2) || diagonal_checker(player1) || diagonal_checker(player2)
      true
    else
      false
    end
  end
end
