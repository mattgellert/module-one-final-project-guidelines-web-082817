require 'pry'
class Move < ActiveRecord::Base
  belongs_to :players
  belongs_to :boards

  def opp_chip_up?(chip_type, opp_chip, player)
    x_check = self.xid
    y_check = self.yid - 1
    chip_row = Board.find_by(id: Board.first.id + self.yid)
    check_row = Board.find_by(id: Board.first.id + y_check)
    sym = "x#{x_check}".to_sym
    col = check_row[sym]
    chips_to_change = []
    chips_to_change << chip_row

    until col == chip_type || col == nil
      if col == opp_chip
        chips_to_change << check_row
        y_check -= 1
      end
      check_row = Board.find_by(id: Board.first.id + y_check)
      col = check_row[sym]
      if col == chip_type
        chips_to_change.each do |chip|
          chip.update(sym => chip_type)
          y_check += 1
          Board.update_board(x_check, y_check, player)
        end
        #only enters this IF when there is a sandwich
        #flips chips in change array
      end
    end
  end


  def opp_chip_down?(chip_type, opp_chip, player)
    x_check = self.xid
    y_check = self.yid + 1
    chip_row = Board.find_by(id: Board.first.id + self.yid)
    check_row = Board.find_by(id: Board.first.id + y_check)
    sym = "x#{x_check}".to_sym
    col = check_row[sym]
    chips_to_change = []
    chips_to_change << chip_row

    until col == chip_type || col == nil
      if col == opp_chip
        chips_to_change << check_row
        y_check += 1
      end
      check_row = Board.find_by(id: Board.first.id + y_check)
      col = check_row[sym]
      if col == chip_type
        chips_to_change.each do |chip|
          chip.update(sym => chip_type)
          y_check -= 1
          Board.update_board(x_check, y_check, player)
        end
        #only enters this IF when there is a sandwich
        #flips chips in change array
      end
    end
  end

  def opp_chip_right?(chip_type, opp_chip, player)
    x_check = self.xid + 1
    y_check = self.yid
    chip_row = Board.find_by(id: Board.first.id + y_check)
    sym_chip = "x#{self.xid}".to_sym
    sym_check = "x#{x_check}".to_sym
    col = chip_row[sym_check]
    chips_to_change = []
    chips_to_change << sym_chip

    until col == chip_type || col == nil
      if col == opp_chip
        chips_to_change << sym_check
        x_check += 1
      end
      sym_check = "x#{x_check}".to_sym
      col = chip_row[sym_check]
      if col == chip_type
        chips_to_change.each do |chip|
          chip_row.update(chip => chip_type)
          x_check -= 1
          Board.update_board(x_check, y_check, player)
        end
        #only enters this IF when there is a sandwich
        #flips chips in change array
      end
    end
  end

  def opp_chip_left?(chip_type, opp_chip, player)
    x_check = self.xid - 1
    y_check = self.yid
    chip_row = Board.find_by(id: Board.first.id + y_check)
    sym_chip = "x#{self.xid}".to_sym
    sym_check = "x#{x_check}".to_sym
    col = chip_row[sym_check]
    chips_to_change = []
    chips_to_change << sym_chip

    until col == chip_type || col == nil
      if col == opp_chip
        chips_to_change << sym_check
        x_check -= 1
      end
      sym_check = "x#{x_check}".to_sym
      col = chip_row[sym_check]
      if col == chip_type
        chips_to_change.each do |chip|
          chip_row.update(chip => chip_type)
          x_check += 1
          Board.update_board(x_check, y_check, player)
        end
        #only enters this IF when there is a sandwich
        #flips chips in change array
      end
    end
  end

  def opp_chip_up_right
    
  end

  def check_move(player)
    if player.name == "Player 1"
      chip_type = 0
      opp_chip = 1
    elsif player.name == "Player 2"
      chip_type = 1
      opp_chip = 0
    end


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
    self.opp_chip_up?(chip_type, opp_chip, player)
    self.opp_chip_down?(chip_type, opp_chip, player)
    self.opp_chip_right?(chip_type, opp_chip, player)
    self.opp_chip_left?(chip_type, opp_chip, player)

    binding.pry
    puts "ho"

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
  end

  def execute_move(player)
    #valid move is executed
    row = Board.find_by(id: Board.first.id + self.yid)
    #first id is always associated with the first row
    sym = "x#{self.xid}".to_sym
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
