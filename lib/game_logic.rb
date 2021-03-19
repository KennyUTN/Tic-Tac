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

  def updt_board(move)
    if @turn.odd?

      @player1_array.push(@board[move - 1])
      @turn += 1
      @board[move - 1] = 'X'
    elsif @turn.even?
      @player2_array.push(@board[move - 1])
      @turn += 1
      @board[move - 1] = 'O'
    end
  end

  def legal_move?(move)
    return true if (1..9).none?(move) || @board[move - 1] == 'X' || @board[move - 1] == 'O'

    false
  end
end
