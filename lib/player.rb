class Player
  attr_reader :board

  def initialize
    @board     = Board.new
  end

  def has_lost?
    occupied_cells = @board.cells.find_all do |cell|
      cell.last.ship
    end
    occupied_cells.all? do |cell|
      cell.last.ship.sunk?
    end
  end
end
