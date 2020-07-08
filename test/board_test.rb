require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_readable_attributes
    board = Board.new
    assert_equal Hash, board.cells.class
    assert_equal 16, board.cells.count
  end

  def test_board_has_valid_coordinates
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

end
