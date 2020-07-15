require './lib/game'
require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/ship'
require './lib/turn'

computer = Player.new
human = Player.new
game = Game.new(computer, human)
game.start
