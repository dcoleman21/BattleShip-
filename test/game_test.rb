require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/turn'
require './lib/player'
require './lib/board'

class GameTest < Minitest::Test

  def test_it_exists
    computer = Board.new
    human = Board.new
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)
    human_cruiser = Ship.new("Cruiser", 3)
    human_submarine = Ship.new("Submarine", 2)
    computer = Player.new
    human = Player.new
    game = Game.new
    game.start

    assert_instance_of Board, computer
    assert_instance_of Board, human
    assert_instance_of
    assert_instance_of Game, game
  end

  # def test_it_has_boards
  #   game = Game.new
  #   computer = Board.new
  #   human = Board.new
  #   game.start
  # end

end
