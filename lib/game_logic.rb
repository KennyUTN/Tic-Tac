require_relative '../lib/players.rb'

class Logic
  attr_reader :board
  winning_moves = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1_array = Players.player1_array
    @player2_array = Players.player2_array
  end

  def draw?
    @board.count('X') + @board.count('O') == 9
  end

  def winning_move?(array)
    winning_moves.length.times do |i|
      return true if winning_moves[i].all? { |j| array.include?(j) }

      false
    end

    def updt_board(move, symbol)
      return false if @board[move - 1] == 'X' || @board[move - 1] == 'O'

      @player1_array.push(@board[move - 1]) if symbol == 'X'

      @player2_array.push(@board[move - 1]) if symbol == 'Y'

      @board[move - 1] = symbol
    end
  end
end
