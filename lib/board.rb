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


  def valid_placement?(ship_object, coordinates)
    valid_placement_length?(ship_object, coordinates) &&
    consecutive_placements?(coordinates) ||
    valid_coordinate?(coordinates)
  # return true if
    # true
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement_length?(ship_object, coordinates)
    ship_object.length == coordinates.size
  end

  def consecutive_placements?(coordinates)
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

  def diagonal_coordinates?(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0].ord
    end
    numbers = coordinates.map do |coordinate|
      coordinate[-1].to_i
    end

    letters.uniq.count == 1 || numbers.uniq.count == 1
  end

end


# def consecutive_coordinates?(coordinates)
#   if same_number?(coordinates) == true && same_letter?(coordinates) == false
#     true
#   elsif same_number?(coordinates) == false && same_letter?(coordinates) == true
#     true
#   elsif same_number?(coordinates) && same_letter?(coordinates)
#     false
#   else
#     false
#   end
# end
