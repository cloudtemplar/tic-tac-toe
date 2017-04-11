require 'spec_helper'

module TicTacToe
  describe Player do
    context '#initialize' do
      it 'raises an error when incomplete set of arguments passed' do
        expect { Player.new }.to raise_error ArgumentError
      end

      it 'instantiates Player properly when name and mark passed' do
        expect { Player.new('Artur', 'X') }.to_not raise_error
      end
    end

    context '#name' do
      it "retrieves Player's name" do
        player = Player.new('Artur', 'O')
        expect(player.name).to eq 'Artur'
      end
    end

    context '#mark' do
      it "retrieves Player's mark" do
        player = Player.new('Artur', 'Y')
        expect(player.mark).to eq 'Y'
      end
    end
  end
end
