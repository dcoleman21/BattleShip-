class Player
  attr_reader :board,
              :type

  def initialize(player_type)
    @type  = player_type
    @board = Board.new
  end

end
