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
    game = Game.new.start
    computer = Board.new
    human = Board.new

    assert_instance_of Game, game
  end

end
