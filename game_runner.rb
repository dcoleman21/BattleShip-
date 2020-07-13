require './lib/game'

computer = Player.new
human = Player.new

game = Game.new(computer, human)
game.start 
