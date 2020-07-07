class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      return true
    else
      return false
    end
  end

  def place_ship(ship_to_place)
    @ship = ship_to_place
  end

  def fire_upon
    ship.hit if @ship
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end

  def render(show_ship = false)
    if fired_upon? == false && ship && show_ship == true
      return "S"
    elsif ship && fired_upon? == true && ship.sunk?
      return "X"
    elsif ship.nil? && fired_upon? == true
      return "M"
    elsif ship && fired_upon? == true
      return "H"
    else 
      return "."
     end
   end
end
