require 'bundler'
Bundler.require

$:.unshift File.expand_path("../lib", __FILE__)

require 'game'
require 'player'
require 'board'
require 'board_case'
require 'views/show'

my_game = Game.new
while my_game.is_still_ongoing?
  Show.new(my_game.board)
  my_game.play
end
Show.new(my_game.board)
my_game.end