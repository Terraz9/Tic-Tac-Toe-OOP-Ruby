# frozen_string_literal: true

# This class performs the creation, printing, updating, and check empties spaces of the main board
class Board
  attr_accessor :container

  def initialize
    @container = board
  end

  def print_matrix
    container.each do |row|
      puts row.join(' ')
    end
  end

  def board
    Array.new(3) { Array.new(3, '*') }
  end

  def update_board(row, column, player_mark)
    container[row][column] = player_mark
  end

  def empty_cell?(row, column)
    container[row][column] == '*'
  end

  def no_space?
    container.all? do |row|
      row.all? { |col| col != '*' }
    end
  end
end
