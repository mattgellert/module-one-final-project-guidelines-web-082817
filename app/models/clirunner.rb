class CliRunner < InvalidInputError
  system "clear"

  puts "Welcome to CLI Othello!!"
  sleep(0.5)


  def self.instructions
    input = ""
    until input == "start"
      puts "\n"
      puts "Instructions:"
      puts " • Player 1 is assigned the '0' chip"
      puts " • Player 2 is assigned the '1' chip"
      puts " • Players choose an empty square, placing their 'chip' on the board,"
      puts "   adjacent to an opponent's."
      puts " • The chip must flank one or several of his opponent's chips between"
      puts "   the disc played and another disc of his own colour already on the board."
      puts " • All flanked chips then change type"
      puts " • The goal of the game is to have more of your chips on the board than the opponent"
      puts "\n"
      puts "CAUTION: The move that gets you the most chips may not get you the most in the long run"
      puts "\n"
      puts "To make a move, enter an y and x coordinate when prompted."
      puts "\n"
      puts "For example, to place a chip on y:1 x:3 enter: 13"
      puts "\n"
      puts "To see the instructions again. Enter 'instructions' when prompted for your move."
      puts "\n"
      puts "If you are unable to make any moves, type 'pass' or 'skip' and hit enter."
      puts "\n"
      puts "If neither player can make a move the game is over."
      puts "\n"
      puts "To exit the game after it has begun, type 'done' and hit enter."
      puts "\n"
      puts "To begin, type 'start' and hit enter. Good luck!!"
      input = gets.chomp
      if input != "start"
        begin
          raise InvalidInputError
        rescue InvalidInputError => error
          puts error.start_message
        end
        system "clear"
      end
    end
    system "clear"
  end

  CliRunner.instructions

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
      if input != "done" && input != "pass" && input != "skip" && input.scan(/[1-8]{2}/).length == 0
        begin
          raise InvalidInputError
        rescue InvalidInputError => error
          puts error.move_message
          sleep (2)
        end
        i -= 1
        break
      end

      break if input == "done" || input == "pass" || input == "skip"
      if input == "instructions"
        CliRunner.instructions
        i -= 1
        break
      end
      valid = player.make_move(input)
      #binding.pry
      if valid == nil # || input != /[12345678][12345678]/
        begin
          raise InvalidInputError
        rescue InvalidInputError => error
          puts error.move_message
        end
        #display some error message
      end
    end
    system "clear"
    Board.display_board
    i += 1
  end
  system "clear"

  counts = Board.get_chip_count
  if counts[:zero] > counts[:one]
    Player.all[-2].winner = true
    puts "The winner is: Player 1!!"
  else
    Player.all[-1].winner = true
    puts "The winner is: Player 2!!"
  end
end
