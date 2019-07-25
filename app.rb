require 'bundler'
Bundler.require

require 'io/console' #il permet d'utiliser la fonction STDIN.getch qui permet de récupérer la valeur d'une touche sans avoir à appuyer sur entrée à chaque fois

$:.unshift File.expand_path("../lib", __FILE__)

require 'app/game'
require 'app/player'
require 'app/board'
require 'app/board_case'
require 'views/show'
require 'app/title'
require 'app/round'


my_game = Game.new
my_game.start

