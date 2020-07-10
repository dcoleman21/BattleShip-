require "pry"
class Board

  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_placement?(ship, coordinates)
    valid_placement_length?(ship, coordinates) &&
    consecutive_placements?(ship, coordinates) &&
    !diagonal_coordinates?(ship, coordinates) &&
    !overlap?(ship, coordinates) &&
    !contains_ship?(ship, coordinates)
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement_length?(ship, coordinates)
    ship.length == coordinates.size
  end

  def consecutive_placements?(ship, coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0].ord
    end
    numbers = coordinates.map do |coordinate|
      coordinate[-1].to_i
    end
    if letters.each_cons(2).map { |a,b| b - a }.all? { |letter| letter == 1 } && numbers.uniq.count == 1
      true
    elsif numbers.each_cons(2).map { |a,b| b - a }.all? { |number| number == 1 } && letters.uniq.count == 1
      true
    else
      false
    end
  end

  def diagonal_coordinates?(ship, coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0].ord
    end
    numbers = coordinates.map do |coordinate|
      coordinate[-1].to_i
    end
    letters.uniq.count == coordinates.count &&
    numbers.uniq.count == coordinates.count
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def contains_ship?(ship, coordinates)
    starts = false
    coordinates.each do |coordinate|
      starts = true if @cells[coordinate].empty? == false
      end
    starts
  end

  def overlap?(ship, coordinates)
    coordinates.any? do |coordinate|
      @cells[coordinate].ship
    end
  end

  def render(show_ship = false)

    show_ship == true
      "  1 2 3 4 \n" +
      "A #{@cells.values[0].render(show_ship)} #{@cells.values[1].render(show_ship)} #{@cells.values[2].render(show_ship)} #{@cells.values[3].render(show_ship)} \n" +
      "B #{@cells.values[4].render(show_ship)} #{@cells.values[5].render(show_ship)} #{@cells.values[6].render(show_ship)} #{@cells.values[7].render(show_ship)} \n" +
      "C #{@cells.values[8].render(show_ship)} #{@cells.values[9].render(show_ship)} #{@cells.values[10].render(show_ship)} #{@cells.values[11].render(show_ship)} \n" +
      "D #{@cells.values[12].render(show_ship)} #{@cells.values[13].render(show_ship)} #{@cells.values[14].render(show_ship)} #{@cells.values[15].render(show_ship)} \n"
  end
end
