require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/board'


class Game

  attr_reader :computer,
              :human,
              # :computer_ships_sunk = 0,
              # :human_ships_sunk = 0
  def intialize(computer, human)
    @player_computer =
    @player_human =
    @computer_ships_sunk = 0
    @human_ships_sunk = 0
  end

  def start
    system "clear"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
          "   ____    _  _____ _____ _     _____ ____  _   _ ___ ____\n" +
          "  | __ )  / ||_   _|_   _| |   | ____/ ___|| | | |_ _|  _  \n" +
          "  |  _   / _|  | |   | | | |   |  _|  ___  | |_| || || |_) |\n" +
          "  | |_) / __|  | |   | | | |___| |___ ___) |  _  || ||  __/\n" +
          "  |____/_/  |  |_|   |_| |_____|_____|____/|_| |_|___|_|\n" +
          "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "Welcome to BATTLESHIP."
    sleep(0.8)
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == 'p'
      #call computer place methods here
      #computer places ship then human will place theirs

    system "clear"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
          "   ____    _  _____ _____ _     _____ ____  _   _ ___ ____\n" +
          "  | __ )  / ||_   _|_   _| |   | ____/ ___|| | | |_ _|  _  \n" +
          "  |  _   / _|  | |   | | | |   |  _|  ___  | |_| || || |_) |\n" +
          "  | |_) / __|  | |   | | | |___| |___ ___) |  _  || ||  __/\n" +
          "  |____/_/  |  |_|   |_| |_____|_____|____/|_| |_|___|_|\n" +
          "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "I have laid out my ships on the grid."
    sleep(0.8)
    puts "You now need to lay out your two ships."
    sleep(0.8)
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts ""
    sleep(0.8)
    puts "  1 2 3 4\n" +
         "A . . . .\n" +
         "B . . . .\n" +
         "C . . . .\n" +
         "D . . . .\n" +
         "Enter the squares for the Cruiser (3 spaces):"
    puts ""

    human_set_up_cruiser(@cruiser, @cruiser_coords)

    puts "1 2 3 4\n" +
         "A . . . .\n" +
         "B . . . .\n" +
         "C . . . .\n" +
         "D . . . .\n" +
        "Enter the squares for the Submarine (2 spaces):"

    #human sets up their submarine

    # play(computer, human)
    end
  end


  def human_set_up_cruiser(cruiser, cruiser_coords)
    loop do
      # puts "Enter the squares for the Cruiser (3 spaces):"
      input = gets.chomp
      cruiser_coords = input
      if @player_human.board.valid_placement?(cruiser, cruiser_coords)
        @player_human.board.place(cruiser, cruiser_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
  end

  # def computer_place_ship_cruiser
  #
  # end
  #
  # def computer_place_ship_submarine
  #
  # end
  #
  # def human_place_ship_cruiser
  #
  # end

end
