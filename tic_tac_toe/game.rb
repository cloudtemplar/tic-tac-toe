module TicTacToe
  class Game
    attr_accessor :current_player, :other_player, :players, :board

    def initialize(players)
      @board = Board.new
      @players = players
      @current_player, @other_player = players.shuffle
    end

    def play
      puts 'Welcome to TicTacToe!'
      while true
        board.show_grid
        puts "#{current_player.name}, your turn! Choose where to place #{current_player.mark}"
        move_to(('m' + gets.chomp).to_sym)
        if board.game_over
          puts game_over_message
          board.show_grid
          return
        else
          switch_players
        end
      end
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end

    def move_to(position)
      x, y = moves_list[position]
      board.set_cell(x, y, current_player.mark)
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    private

    def moves_list
      {
        m1: [0, 0], m2: [0, 1], m3: [0, 2],
        m4: [1, 0], m5: [1, 1], m6: [1, 2],
        m7: [2, 0], m8: [2, 1], m9: [2, 2]
      }
    end
  end
end
