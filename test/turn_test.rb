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

end
