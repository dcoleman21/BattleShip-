require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_cell_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_cell_has_a_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_cell_is_empty
    cell = Cell.new("B4")

    assert_equal nil, cell.ship
    assert_equal true, cell.empty?
  end

  def test_cell_can_place_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_instance_of Ship, cell.ship
    assert_equal false, cell.empty?
  end

  def test_cell_fired_upon_starts_false
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
  end

  def test_cell_can_be_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?

    cell.fire_upon

    assert_equal true, cell.fired_upon?
  end

  def test_cell_fired_upon_hits_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal 3, cell.ship.health

    cell.fire_upon

    assert_equal true, cell.fired_upon?
    assert_equal 2, cell.ship.health
  end

  def test_cell_can_be_rendered
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render

    cell_1.fire_upon

    assert_equal "M", cell_1.render
  end

  def test_can_render_another_cell
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render

    assert_equal "S", cell_2.render(true)

    cell_2.fire_upon

    assert_equal "H", cell_2.render
  end

  def test_cell_has_ship_and_it_gets_sunk
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render

    assert_equal "S", cell_2.render(true)

    cell_2.fire_upon

    assert_equal "H", cell_2.render

    assert_equal false, cruiser.sunk?

    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_2.render
  end
end
