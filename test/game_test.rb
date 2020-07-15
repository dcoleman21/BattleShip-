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
    computer_player = Player.new("Computer")
    human_player = Player.new("Human")
    game = Game.new
    game.start

    assert_instance_of Board, computer
    assert_instance_of Board, human
    assert_instance_of Game, game
  end

  def test_human_can_set_up_cruiser
    computer_board = Board.new
    human_board = Board.new
    human_cruiser = Ship.new("Cruiser", 3)
    human_submarine = Ship.new("Submarine", 2)
    computer_player = Player.new("Computer")
    human_player = Player.new("Human")
    game = Game.new(computer_player, human_player)
    game.start
  end
end
