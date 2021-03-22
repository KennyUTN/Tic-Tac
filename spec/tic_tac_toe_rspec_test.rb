require_relative '../lib/game_logic.rb'

describe Logic do
  let(:test) { Logic.new }
  let(:test_player_array) { [1, 2, 3] }

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
  end

  describe '#legal_move' do
    it 'checks if playing a move in the center of the board is legal' do
      expect(test.legal_move?(6)).to be(false)
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
