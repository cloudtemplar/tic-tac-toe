require 'spec_helper'

module TicTacToe
  describe Board do
    Thing = Struct.new(:value)
    let(:not_empty) { Thing.new('X') }
    let(:empty) { Thing.new('') }
    let(:o) { Thing.new('O') }

    context '#initialize' do
      it 'initializes with 3 rows by default' do
        board = Board.new
        expect(board.grid.size).to eq 3
      end

      it 'has 3 things in each row by default' do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq 3
        end
      end
    end

    context '#grid' do
      it 'returns grid' do
        board = Board.new('grid')
        expect(board.grid).to eq 'grid'
      end
    end

    context '#get_cell' do
      it 'returns cell at (x, y)' do
        grid = [['', 'X', ''], ['', '', 7], ['', '', '']]
        board = Board.new(grid)
        expect(board.get_cell(0, 1)).to eq 'X'
        expect(board.get_cell(1, 2)).to eq 7
      end
    end

    context '#set_cell' do
      it 'can change value of given cell' do
        # It is bad to create unnecessary dependencies in tests, hence Struct.
        Car = Struct.new(:value)
        car = Car.new('Ford')
        grid = [['', 'X', ''], ['', car, 7], ['', '', '']]
        board = Board.new(grid)
        expect(board.get_cell(1, 1).value).to eq 'Ford'
        board.set_cell(1, 1, 'bazinga')
        expect(board.get_cell(1, 1).value).to eq 'bazinga'
      end
    end

    context '#show_grid' do
      it 'shows grid values' do
        grid_output = "_ _ _\n_ _ _\n_ _ _\n" 
        board = Board.new
        expect { board.show_grid }.to output(grid_output).to_stdout
        board.set_cell(1, 1, 'X')
        expect { board.show_grid }.to output("_ _ _\n_ X _\n_ _ _\n").to_stdout
      end
    end

    context '#game_over' do
      it 'returns :winner if #winner? returns true' do
        board = Board.new
        allow(board).to receive(:winner?).and_return true
        expect(board.game_over).to eq :winner
      end

      it 'returns :draw if #winner? returns false and #draw? returns true' do
        board = Board.new
        allow(board).to receive(:winner?).and_return false
        allow(board).to receive(:draw?).and_return true
        expect(board.game_over).to eq :draw
      end

      it 'returns false if both #winner? and #draw? return false' do
        board = Board.new
        allow(board).to receive(:winner?).and_return false
        allow(board).to receive(:draw?).and_return false
        expect(board.game_over).to be_falsey
      end
    end

    context '#draw?' do
      it 'returns true if all grid\'s objects\' values are not empty' do
        grid = [[not_empty, not_empty], [not_empty, not_empty]]
        board = Board.new(grid)
        expect(board.draw?).to be_truthy
      end

      it 'returns false if some grid\'s objects\' values are empty' do
        grid = [[not_empty, not_empty], [not_empty, empty]]
        board = Board.new(grid)
        expect(board.draw?).to be_falsey
      end
    end

    context '#winner?' do
      it 'returns true if one of the win conditions met' do
        grid = [
                 [o,     empty, empty],
                 [empty, o,     empty],
                 [empty, empty, o    ]
               ]
        board = Board.new(grid)
        expect(board.winner?).to be_truthy
      end

      it 'returns false when win conditions not met' do
        grid = [
                 [o,         o,     empty],
                 [not_empty, o,     empty],
                 [empty,     empty, not_empty]
               ]
        board = Board.new(grid)
        expect(board.winner?).to be_falsey
      end
    end
  end
end
