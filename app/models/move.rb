require 'pry'
class Move < ActiveRecord::Base
  belongs_to :players
  belongs_to :boards

  def check_move(player)
    #check proximate boxes for opposite chip

    #is there an opp chip in the column?
      #up?
        #add chip to chips-to-change array
        #check up one row (loop)
          #same?
            #valid -> flip chips -> break loop
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board (no id)

      #down?
        #add chip to chips-to-change array
        #check down one row (loop)
          #same?
            #valid -> flip chips -> break loop
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board (no id)

    #is there an opp chip in the row?
      #right?
        #add chip to chips-to-change array
        #check right one row (loop)
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board
          #same?
              #valid -> filp chips -> break loop
      #left?
        #add chip to chips-to-change array
        #check left one row (loop)
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board
          #same?
              #valid -> filp chips -> break loop

    #is there an opp chip in the diagonal?
      #upper right?
        #add chip to chips-to-change array
        #check up one, right one (loop)
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board
          #same?
            #valid -> filp chips -> break loop
      #upper left?
        #add chip to chips-to-change array
        #check up one, left one (loop)
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board
          #same?
            #valid -> filp chips -> break loop
      #lower right?
        #add chip to chips-to-change array
        #check down one, right one (loop)
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board
          #same?
            #valid -> filp chips -> break loop
      #lower left?
        #add chip to chips-to-change array
        #check down one, left one (loop)
          #opp?
            #add chip to chips-to-change array
            #keep checking until nil or outside board
          #same?
            #valid -> filp chips -> break loop


    #return true if valid, false otherwise
    true
  end

  def execute_move(player)
    #valid move is executed
    row = Board.find_by(id: Board.first.id + self.xid)
    #first id is always associated with the first row
    sym = "y#{self.yid}".to_sym
    col = row[sym]

    if col == nil
      if player.id == Player.all[-2]
        col = 0
      elsif player.id == Player.all[-1]
        col = 1
      end

      Board.update_board(self.xid, self.yid, player)
    end
  end
end
