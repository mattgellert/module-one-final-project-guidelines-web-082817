## How It Works (The Short Version)

A player enters in the coordinates of the cell where they would like to place their chip.

The coordinates are assigned to variables, and then used as reference points to check the values of the surrounding cells.

Each row that is checked is pushed to an array if it contains the opposite chip (a row in CLI Othello is an instance of the Board class).

Only if the checked chips are different than the current players chips, and are flanked by the current players chips, then the array is iterated over, updating any opposite values to the current players chip value.

The new values are then passed into methods which updates the user interface and database.

## Rules
• Player 1 is assigned the '0' chip

• Player 2 is assigned the '1' chip

• Players choose an empty square, placing their 'chip' on the board,
  adjacent to an opponent's.

• The chip must flank one or several of his opponent's chips between
  the disc played and another disc of his own colour already on the board.

• All flanked chips then change type

• The goal of the game is to have more of your chips on the board than the opponent

CAUTION: The move that gets you the most chips may not get you the most in the long run

To make a move, enter an y and x coordinate when prompted.

For example, to place a chip on y:1 x:3 enter: 13

To see the instructions again. Enter 'instructions' when prompted for your move.

To exit the game after it has begun, type "done" and hit enter.

To begin, type 'start' and hit enter. Good luck!!

For further information on rules and strategy, please refer to the [Wikipedia entry](https://en.wikipedia.org/wiki/Reversi) on Reversi or [this](https://www.youtube.com/watch?v=Ol3Id7xYsY4) instructional video.
