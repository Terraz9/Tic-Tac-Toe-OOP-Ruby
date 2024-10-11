# frozen_string_literal: true

# This class contains the properties and methods for the players interacting with the game.
class Player
  attr_accessor :row, :column, :player_mark
  attr_reader :name

  def initialize(player_mark)
    @player_mark = player_mark
    @name = gets.chomp
  end

  def obtain_row
    puts 'What row? from 1 to 3'
    @row = gets.chomp.to_i - 1
  end

  def obtain_column
    puts 'What Column? from 1 to 3'
    @column = gets.chomp.to_i - 1
  end

  def play
    puts "#{name}'s turn"
    obtain_row
    obtain_column
  end
end
