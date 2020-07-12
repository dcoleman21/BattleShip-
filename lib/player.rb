class Player
  attr_reader :board,
              :type,
              :cruiser,
              :submarine

  def initialize(player_type)
    @type      = player_type
    @board     = Board.new
    @cruiser   = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
end
