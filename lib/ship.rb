# Ship
# A Ship object will represent a single ship on the board.
# It will be able to keep track of how much health it has, take hits,
# and report if it is sunk or not. A ship should start off with health equal
# to it’s length.

class Ship

  attr_reader :name,
              :length,
              :health
  def initialize(name, length)
    @name   = name
    @length = length
    @health = length
  end

  def sunk?
    @health == 0
  end

  def hit
    @health -= 1
  end

end
