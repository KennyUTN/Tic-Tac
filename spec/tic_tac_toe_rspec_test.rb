# rubocop disable Metrics/BlockLength
require_relative '../lib/game_logic.rb'
describe Logic do
  let(:test) { Logic.new }
  let(:test_player_array) { [1, 2, 3] }
  let(:test_player_array2) { [1, 2, 4] }

  describe '#initialize' do
    it 'checks if board is initialized' do
      expect(test.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'checks if player1 has their own array' do
      expect(test.player1_array).to eql([])
    end
  end
  # winning_move

  describe '#winning_move?' do
    it 'returns true on a winning board state (test player array)' do
      expect(test.winning_move?(test_player_array)).to eql(true)
    end

    context 'not a winning move'
    it ' returns false' do
      expect(test.winning_move?(test_player_array2)).to eql(false)
    end
  end

  describe '#legal_move' do
    context 'checks if a move on the center of the board is legal'
    it 'returns false' do
      expect(test.legal_move?(5)).to be(false)
    end

    context 'checks for an Illegal move (on inexistent)'
    it 'returns true' do
      expect(test.legal_move?(200)).to be(true)
    end
  end
  # Update_board
  describe '#updt_board' do
    it 'checks if the board state changes after a move' do
      test.updt_board(5)
      expect(test.board).to eql([1, 2, 3, 4, 'X', 6, 7, 8, 9])
    end
  end
end
# rubocop enable Metrics/BlockLength
