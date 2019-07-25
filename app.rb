require 'bundler'
Bundler.require

require 'io/console'

$:.unshift File.expand_path("../lib", __FILE__)

require 'app/game'
require 'app/player'
require 'app/board'
require 'app/board_case'
require 'views/show'
require 'app/title'

Title.new
cmd = ""
while cmd != "q"
  my_game = Game.new
  while my_game.is_still_ongoing?
    Show.new(my_game.board)
    my_game.play
  end
  Show.new(my_game.board)
  my_game.end
  cmd = gets.chomp.downcase
end