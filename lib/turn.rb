class Turn
  attr_reader :computer,
              :human,
              :computer_ships_sunk,
              :human_ships_sunk

  def initialize(computer, human)
    @computer            = computer
    @human               = human
    @computer_ships_sunk = 0
    @human_ships_sunk    = 0
  end


end
