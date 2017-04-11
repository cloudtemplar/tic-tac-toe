module TicTacToe
  class Board
    attr_reader :grid

    def initialize(grid = default_grid)
      @grid = grid
    end

    def get_cell(x, y)
      grid[x][y]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def game_over
      return :winner if winner?
      return :draw   if draw?
      false
    end

    def winner?
      win_moves.each do |move|
        next if move.any? { |cell| cell.value.empty? }
        # Check if all cells' values are the same.
        return true if move.all? { |cell| cell == move[0] }
      end
      false
    end

    def draw?
      grid.flatten.none? { |cell| cell.value.empty? }
    end

    private

    def win_moves
      grid +
      grid.transpose +
      [
        [grid[0][0], grid[1][1], grid[2][2]],
        [grid[0][2], grid[1][1], grid[2][0]]
      ]
    end

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end
  end
end
