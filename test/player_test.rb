require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    computer = Player.new("Computer")
    human = Player.new("Human")

    assert_instance_of Player, computer
    assert_instance_of Player, human
  end

  def test_it_has_a_player_type
    computer = Player.new("Computer")
    human = Player.new("Human")

    assert_equal "Computer", computer.type
    assert_equal "Human", human.type
  end

  def test_it_has_a_board
    computer = Player.new("Computer")
    human = Player.new("Human")

    expected = ["A1", "A2", "A3", "A4", "B1", "B2",
      "B3", "B4", "C1", "C2","C3", "C4", "D1", "D2",
      "D3", "D4"]

    assert_equal expected, computer.board.cells.keys
    assert_equal expected, human.board.cells.keys
  end

  def test_computer_has_ships
    computer = Player.new("Computer")

    assert_instance_of Ship, computer.cruiser
    assert_instance_of Ship, computer.submarine
  end

  def test_human_has_ship
    human = Player.new("Human")

    assert_instance_of Ship, human.cruiser
    assert_instance_of Ship, human.submarine
  end
end
