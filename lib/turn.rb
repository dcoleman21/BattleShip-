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

  def display_boards(computer, human)
    p "=============COMPUTER BOARD============="
    p @computer.board.render
    p "==============PLAYER BOARD=============="
    p @human.board.render(true)
  end

  def human_shot(player_input)
    loop do
      if player_input != []
        if computer.board.valid_coordinate?(player_input)
          if computer.board.cells[player_input].fired_upon? == false
            @computer.board.cells[player_input].fire_upon
            if computer.board.cells[player_input].render(true) == "M"
              puts "Your shot on #{player_input} was a miss."
            elsif computer.board.cells[player_input].render(true) == "H"
              puts "Your shot on #{player_input} was a hit."
            elsif computer.board.cells[player_input].render(true) == "X"
              puts "Your shot on #{player_input} sunk a ship."
              @computer_ships_sunk += 1
            end
            break
          end
        end
      end
      puts "That is not a valid coordinate. Please try again:"
    end
  end

  def computer_shot
    computer_input = human.board.cells.keys.sample
    until human.board.valid_coordinate?(computer_input) && human.board.cells[computer_input].fired_upon? == false
      computer_input = human.board.cells.keys.sample
    end
    @human.board.cells[computer_input].fire_upon
    if human.board.cells[computer_input].render(true) == "M"
      puts "Computer shot on #{computer_input} was a miss."
    elsif human.board.cells[computer_input].render(true) == "H"
      puts "Computer shot on #{computer_input} was a hit."
    elsif human.board.cells[computer_input].render(true) == "X"
      puts "Computer shot on #{computer_input} sunk a ship."
      @human_ships_sunk += 1
    end
  end
end
