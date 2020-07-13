require './lib/game'
require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/ship'
require './lib/turn'

computer = Player.new
human = Player.new

computer = Board.new
human = Board.new

game = Game.new(computer, human)
game.start
