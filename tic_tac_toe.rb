require_relative 'tic_tac_toe/cell.rb'
require_relative 'tic_tac_toe/player.rb'
require_relative 'tic_tac_toe/board.rb'
require_relative 'tic_tac_toe/game.rb'

module TicTacToe
end

artur  = TicTacToe::Player.new('Artur', 'X')
iwona  = TicTacToe::Player.new('Iwona', 'O')
TicTacToe::Game.new([artur, iwona]).play
 