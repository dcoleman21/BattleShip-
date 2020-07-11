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

  # def place_cruiser
  #   loop do
  #     computer_cruiser_coords = Array.new
  #     until computer_cruiser_coords.length == cruiser.length do
  #       computer_cruiser_coords << board.cells.keys.sample
  #     end
  #     if board.valid_placement?(cruiser, computer_cruiser_coords)
  #       @board.place(cruiser, computer_cruiser_coords)
  #       break
  #     end
  #   end
  # end

end
