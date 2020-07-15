require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)

    assert_equal computer, turn.computer
    assert_equal human, turn.human
    assert_equal 0, turn.computer_ships_sunk
    assert_equal 0, turn.human_ships_sunk
  end

  def test_human_can_hit_a_ship
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)
    cruiser = Ship.new("Cruiser", 3)

    computer.board.place(cruiser, ["A1", "A2", "A3"])
    turn.human_shot("A1")
  end

  def test_human_can_take_a_shot
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)
    turn.human_shot("A1")
  end

  def test_computer_can_take_a_shot
    computer = Player.new("Computer")
    human = Player.new("Human")
    turn = Turn.new(computer, human)
    turn.computer_shot
  end

end
