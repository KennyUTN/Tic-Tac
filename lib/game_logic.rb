class Logic
  attr_reader :board
  attr_accessor :player1_array, :player2_array, :turn, :turns
  WIN_MOVES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [1, 4, 7], [2, 5, 8], [3, 5, 7], [3, 6, 9]].freeze
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1_array = []
    @player2_array = []
    @turn = 1
  end

  def winning_move?(player_array)
    WIN_MOVES.length.times do |i|
      return true if WIN_MOVES[i].all? { |j| player_array.to_a.include?(j) }
    end
    false
  end

  def updt_board(move, symbol)
    @player1_array.push(@board[move - 1]) if symbol == 'X'

    @player2_array.push(@board[move - 1]) if symbol == 'O'

    @board[move - 1] = symbol
  end

  def legal_move?(move)
    if (1..9).none?(move) || @board[move - 1] == 'X' || @board[move - 1] == 'O'
      return true
    end
    false

  end

  def winner?
    

  end
end
