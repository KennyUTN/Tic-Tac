require_relative '../lib/players.rb'

attr_reader :board
def initialize(board)
  @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @winner = false
  @win_arr = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
end

def draw?
  board.count('X') + board.count('O') == 9
end

def winning_move?(array)
  win_arr.length.times do |i|
    return true if win_arr[i].all? { |j| array.include?(j) }
  end
  false
end
