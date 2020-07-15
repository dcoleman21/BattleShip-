require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/player'
require './lib/board'
require "pry"

class Game

  attr_reader :computer_player,
              :human_player
              # :computer_ships_sunk = 0,
              # :human_ships_sunk = 0
  def initialize(computer, human)
    @computer_player = computer
    @human_player = human
    @computer_ships_sunk = 0
    @human_ships_sunk = 0
    @computer_board = @computer_player.board
    @human_board = @human_player.board
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
      computer_place_ships

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
    puts "#{@computer_board.render}" +
         "Enter the squares for the Cruiser (3 spaces):"
    # puts ""

    human_set_up_cruiser

    puts "#{@human_board.render(true)}" +
    "Enter the squares for the Submarine (2 spaces):"
    human_set_up_submarine
    #human sets up their submarine
    new_turn
    puts "Game Over!"
    # play(computer, human)
    end
  end


  def human_set_up_cruiser
    # puts "Enter the squares for the Cruiser (3 spaces):"
    cruiser = Ship.new("Cruiser", 3)
    loop do
      input = gets.chomp
      cruiser_coords = input.split(",")
      cruiser_coords = cruiser_coords.map do |coordinate|
        coordinate.strip()
      end
       #.strip takes away white space
      # binding.pry
      if @human_board.valid_placement?(cruiser, cruiser_coords)
        @human_board.place(cruiser, cruiser_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
  end

  def human_set_up_submarine
    # puts "Enter the squares for the Cruiser (3 spaces):"
    submarine = Ship.new("Submarine", 2)
    loop do
      input = gets.chomp
      submarine_coords = input.split(",")
      submarine_coords = submarine_coords.map do |coordinate|
        coordinate.strip()
      end
      # binding.pry
      if @human_board.valid_placement?(submarine, submarine_coords)
        @human_board.place(submarine, submarine_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
  end

  def new_turn
    #rename new_turn to take_turn soon
    system 'clear'
    turn = Turn.new(computer_player, human_player)
    puts "=============COMPUTER BOARD============="
    puts "#{@computer_board.render}"
    puts "==============PLAYER BOARD=============="
    puts "#{@human_board.render(true)}"
    # turn.display_boards(computer_player, human_player)
    turn.computer_shot
    puts "Enter coordinate to fire upon"
    player_input = gets.chomp
    turn.human_shot(player_input)
    # require "pry"; binding.pry

    if @computer_ships_sunk == 2 || @human_ships_sunk == 2
       return
    else
      new_turn
    end
  end

  def computer_place_ships
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)

    @computer_board.place(computer_cruiser, ["A1", "A2", "A3"])
    @computer_board.place(computer_submarine, ["C1", "C2"])

    # require "pry"; binding.pry
  end


end
computer_cruiser = Ship.new("Cruiser", 3)
computer_submarine = Ship.new("Submarine", 2)
human_cruiser = Ship.new("Cruiser", 3)
human_submarine = Ship.new("Submarine", 2)
computer_player = Player.new("Computer")
human_player = Player.new("Human")
computer_board = computer_player.board
human_board = human_player.board
game = Game.new(computer_player, human_player)
turn = Turn.new(computer_player, human_player)
game.start
