class CliRunner < InvalidMoveError
  system "clear"

  puts "Welcome to CLI Othello!!"
  sleep(0.5)
  puts "To make a move, enter an y and x coordinate when prompted."
  sleep(0.5)
  puts "For example, to place a chip on y:1 x:3 enter: 13"
  sleep(0.5)

  Board.destroy_all
  Board.new_board
  Board.display_board

  Player.add_players("Player 1", "Player 2")

  input = ""
  i = 1
  until input == "done"
    valid = false

    while valid != true
      if i.odd?
        puts "     Player 1, please enter your move:"
        player = Player.all[-2]
        #move = yx where x is x coordinate and y is y coordinate
      else
        puts "     Player 2, please enter your move:"
        player = Player.all[-1]
      end

      input = gets.chomp
      break if input == "done"
      valid = player.make_move(input)
      #binding.pry
      if valid == nil
        begin
          raise InvalidMoveError
        rescue InvalidMoveError => error
          puts error.message
        end
        #display some error message
      end
    end
    system "clear"
    Board.display_board
    i += 1
  end
  system "clear"
end
