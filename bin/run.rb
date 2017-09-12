require_relative '../config/environment'


#INSERT some code that resets the database so id starts @ 0

#INSTRUCTIONS
puts "Welcome to CLI Othello!!"
puts "To make a move, enter an x and y coordinate when prompted."
puts "For example, to place a chip on x:1 y:1 enter: 11"

#instantiate a new board'
Board.destroy_all
Board.new_board
Board.display_board


#add_players
Player.add_players("Player 1", "Player 2")

#continue game until user specifies they are complete
i = 1
# until input == "done"
  #
  if i.odd?
    puts "Player 1, please enter your move:"
    player = Player.all[-2]
    #move = xy where x is x coordinate and y is y coordinate
  else
    puts "Player 2, please enter your move:"
    player = Player.all[-1]
  end
  move = gets.chomp
  player.make_move(move)
  Board.display_board

  #make move
# end
