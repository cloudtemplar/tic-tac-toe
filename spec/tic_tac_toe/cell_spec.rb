require 'spec_helper'

module TicTacToe
  describe Cell do
    context '#initialize' do
      it "initializes with '' as a default value" do
        cell = Cell.new
        expect(cell.value).to eq ''
      end

      it 'can be passed a value' do
        cell = Cell.new('X')
        expect(cell.value).to eq 'X'
      end
    end
  end
end
