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
    computer_board = Board.new
    human_board = Board.new
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)
    human_cruiser = Ship.new("Cruiser", 3)
    human_submarine = Ship.new("Submarine", 2)
    computer_player = Player.new
    human_player = Player.new
    game = Game.new(computer_player, human_player)

    assert_instance_of Board, computer_board
    assert_instance_of Board, human_board
    assert_instance_of Game, game
  end
end
