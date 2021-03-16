#!/usr/bin/env ruby
puts 'Welcome to the Tic-Tac-Toe Experience \n'

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
  while changing_turns

    i = + 1
    current_player = player1 if i.odd?
    current_player = player2 if i.even?

    grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    puts "#{current_player} it is your turn!"
    puts
    print grid[0].join(' | ')
    puts
    print grid[1].join(' | ')
    puts
    print grid[2].join(' | ')
    puts

    puts 'Choose your desired number'
    move = gets.chomp.to_i

    while (1..9).none?(move)
      puts 'Please type a valid number between 1 and 9'
      move = gets.chomp.to_i
    end

    puts '(Test build: Press 3 to win and 4 to draw)'

    win = 3
    draw = 4
    # rubocop: disable Metrics/BlockNesting
    if move == win
      puts '- - - - - - - - - - - - - - - - - -'
      puts "Game finished, #{current_player}, You Won!"
      puts '- - - - - - - - - - - - - - - - - -'
      puts 'Do you want to replay? Y/N'
      status = gets.chomp.upcase
      while status != 'Y' && status != 'N'
        puts 'Please type Y or N'
        status = gets.chomp.upcase
      end
      playing_game = false if status == 'N'
      changing_turns = false if status == 'Y'

    elsif move == draw

      puts '- - - - - - - - - - - - - - - - - -'
      puts 'Game finished, its a draw!'
      puts '- - - - - - - - - - - - - - - - - -'
      puts 'Do you want to replay? Y/N'
      status = gets.chomp.upcase
      while status != 'Y' && status != 'N'
        puts 'Please type Y or N'
        status = gets.chomp.upcase
      end
      playing_game = false if status == 'N'
      changing_turns = false if status == 'Y'
      # rubocop: enable Metrics/BlockNesting
    end
  end
end
