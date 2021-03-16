#!/usr/bin/env ruby
require_relative '../lib/game_logic.rb'
require_relative '../lib/players.rb'

class Main

    @game_logic = Logic.new
    @board = @game_logic.board
    @players = Players.new
    @current_player = @player1


  puts 'Welcome to the Tic-Tac-Toe '

  playing_game = true

  while playing_game

    puts 'Player one please enter your name!, you will be X'

    player1 = gets.chomp

    puts 'Player two please enter your name!, you will be O'

    player2 = gets.chomp

    puts '////////////////////////////'
    puts "#{player1} VS #{player2}"
    puts '////////////////////////////'

    puts "#{player1} you are X"
    puts "#{player2} you are O"

    changing_turns = true
    turns = 0
    while changing_turns

      turns += 1
      @current_player = player1 if turns.odd?

      @current_player = player2 if turns.even?

      puts "#{@current_player} it is your turn!"
      puts "   #{@board[0]}   |   #{@board[1]}   |   #{@board[2]}   "
      puts "   #{@board[3]}   |   #{@board[4]}   |   #{@board[5]}   "
      puts "   #{@board[6]}   |   #{@board[7]}   |   #{@board[8]}   "

      puts 'Choose your desired number'
      move = gets.chomp.to_i

      while (1..9).none?(move)
        puts 'Please type a valid number between 1 and 9'
        move = gets.chomp.to_i
      end

      @game_logic.updt_board(move, 'X') if turns.odd?

      @game_logic.updt_board(move, 'Y') if turns.even?

      if @game_logic.winning_move?(@players.player1_array.to_a) || @game_logic.winning_move?(@players.player2_array.to_a)
        puts '- - - - - - - - - - - - - - - - - -'
        puts "Game finished, #{@current_player}, You Won!"
        puts '- - - - - - - - - - - - - - - - - -'
        puts 'Do you want to replay? Y/N'
        status = gets.chomp.upcase
        # rubocop: disable Metrics/BlockNesting
        while status != 'Y' && status != 'N'
          puts 'Please type Y or N'
          status = gets.chomp.upcase
        end

        playing_game = false && changing_turns = false if status == 'Y'

        if status == 'N'
          changing_turns = false
          @game_logic = Logic.new
          @board = @game_logic.board
        end
      elsif @game_logic.draw?

        puts '- - - - - - - - - - - - - - - - - -'
        puts 'Game finished, its a draw!'
        puts '- - - - - - - - - - - - - - - - - -'
        puts 'Do you want to replay? Y/N'
        status = gets.chomp.upcase
        while status != 'Y' && status != 'N'
          puts 'Please type Y or N'
          status = gets.chomp.upcase
        end
        playing_game = false && changing_turns = false if status == 'Y'
        if status == 'N'
          changing_turns = false
          @game_logic = Logic.new
          @board = @game_logic.board
          end
        # rubocop: enable Metrics/BlockNesting
      end
    end
  end
  puts 'peace out'
end
