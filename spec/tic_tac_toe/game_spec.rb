require 'spec_helper'

module TicTacToe
  describe Game do
    context '#switch_players' do
      it 'switches players' do
        artur  = Player.new('Artur', 'X')
        iwona  = Player.new('Iwona', 'O')
        game   = Game.new([artur, iwona])
        game.current_player = artur
        game.other_player = iwona
        game.switch_players
        expect(game.current_player.name).to eq 'Iwona'
        expect(game.other_player.name).to eq 'Artur' 
      end
    end
  end
end
