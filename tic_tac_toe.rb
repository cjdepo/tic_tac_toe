#/tic_tac_toe/tic_tac_toe.rb
require_relative 'game.rb'

game = Game.new
game.generate_players
game.run_game