require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require "pry"
class BoardTest < Minitest::Test

  def test_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_cells
    board = Board.new
    assert_equal 16, board.cells.count
    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1",
      "C2", "C3", "C4", "D1", "D2", "D3", "D4"], board.cells.keys
    assert_equal Hash, board.cells.class
    assert_equal Cell, board.cells.values[0].class
    assert_equal Cell, board.cells.values[1].class
    assert_equal Cell, board.cells.values[2].class
    assert_equal Cell, board.cells.values[3].class
    assert_equal Cell, board.cells.values[4].class
    assert_equal Cell, board.cells.values[5].class
    assert_equal Cell, board.cells.values[6].class
    assert_equal Cell, board.cells.values[7].class
    assert_equal Cell, board.cells.values[8].class
    assert_equal Cell, board.cells.values[9].class
    assert_equal Cell, board.cells.values[10].class
    assert_equal Cell, board.cells.values[11].class
    assert_equal Cell, board.cells.values[12].class
    assert_equal Cell, board.cells.values[13].class
    assert_equal Cell, board.cells.values[14].class
    assert_equal Cell, board.cells.values[15].class
  end

  def test_board_has_valid_coordinates
    board = Board.new
    board.cells
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
    assert_equal true, board.valid_coordinate?("A2")
    # binding.pry
    # assert_equal true, board.valid_coordinate?("A1", "B3", "C2")
  end

  def test_board_has_ship_length_matches_coordinate_size
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement_length?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement_length?(submarine, ["A2", "A3", "A4"])
  end
  #
  def test_coordinates_are_validly_placed
    # skip
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_coordinates_cant_be_diagonal
    # skip
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.diagonal_coordinates?(["A1", "B2", "C3"])
    assert_equal false, board.diagonal_coordinates?(["C2", "D3"])
  end

  def test_coordinates_are_validly_placed
    # skip
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_has_consecutive_placements
    # skip
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.consecutive_placements?(["A1", "A2", "A3"])
    assert_equal false, board.consecutive_placements?(["A1", "C1"])
  end

  def test_can_place_ships
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship

    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_dont_overlap
    board = Board.new
    board.cells
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(submarine, ["B1", "B2"])
  end


end
