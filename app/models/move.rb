require 'pry'
class Move < ActiveRecord::Base
  belongs_to :players
  belongs_to :boards

  def opp_chip_up?(chip_type, opp_chip, player)
    #player move = y = 6, x = 5 => yid = 5, xid = 5
    # check original DB & board
    x_check = self.xid # = 5
    y_check = self.yid - 1 # = 4
    chip_row = Board.find_by(id: Board.first.id + self.yid) # row 6
    check_row = Board.find_by(id: Board.first.id + y_check) # row 5
    if check_row != nil
      sym = "x#{x_check}".to_sym # :x5
      col = check_row[sym] # => 1
      chips_to_change = []
      chips_to_change << chip_row # [row 6]

      until col == chip_type || col == nil # col = 1, chip_type = 0
        if col == opp_chip # col = 1, opp_chip = 1
          chips_to_change << check_row #[row6, row5]
          y_check -= 1 # = 3
        end
        check_row = Board.find_by(id: Board.first.id + y_check) # row 4
        if check_row != nil # = row 4
          col = check_row[sym] # = 0
          if col == chip_type # col = 0, chip_type = 0
            chips_to_change.reverse.each do |chip| # [row5, row6]
              #binding.pry
              chip.update(sym => chip_type)
                # first: row5[:x5] = 0
                # second: row6[:x5] = 0


              y_check += 1 # = 4, # = 5
              Board.update_board(x_check, y_check, player)
              #binding.pry
                #first: update display row 5
                #second: update display row 6
              # check new DB & board
            end
            #only enters this IF when there is a sandwich
            #flips chips in change array
          end
        end
      end
    end
  end


  def opp_chip_down?(chip_type, opp_chip, player)
    x_check = self.xid
    y_check = self.yid + 1
    chip_row = Board.find_by(id: Board.first.id + self.yid)
    check_row = Board.find_by(id: Board.first.id + y_check)
    puts chip_row
    puts check_row
    if check_row != nil
      sym = "x#{x_check}".to_sym
      col = check_row[sym]
      chips_to_change = []
      chips_to_change << chip_row
      puts "down: #{chips_to_change}"

      until col == chip_type || col == nil
        if col == opp_chip
          chips_to_change << check_row
          puts "down: #{chips_to_change}"
          y_check += 1
        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          #binding.pry
          col = check_row[sym]
          #binding.pry
          puts "#{check_row}"
          puts "#{sym}"
          puts "#{check_row[sym]}"
          puts "#{col}"
          if col == chip_type
            puts "down: #{chips_to_change.size}" ############
            chips_to_change.reverse.each do |chip|
              chip.update(sym => chip_type)
              y_check -= 1
              Board.update_board(x_check, y_check, player)
              #binding.pry
            end
            #only enters this IF when there is a sandwich
            #flips chips in change array
          end
        end
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
        puts "right: #{chips_to_change.size}" ############
        chips_to_change.reverse.each do |chip|
          #binding.pry
          chip_row.update(chip => chip_type)
          x_check -= 1
          Board.update_board(x_check, y_check, player)
          #binding.pry
        end
        #only enters this IF when there is a sandwich
        #flips chips in change array
      end
    end
  end

  def opp_chip_left?(chip_type, opp_chip, player)
    x_check = self.xid - 1 #minus one for moving left
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
        puts "left: #{chips_to_change.size}" ############
        chips_to_change.reverse.each do |chip|
          #binding.pry
          chip_row.update(chip => chip_type)
          x_check += 1
          Board.update_board(x_check, y_check, player)
          #binding.pry
        end
        #only enters this IF when there is a sandwich
        #flips chips in change array
      end
    end
  end

  def opp_chip_up_right?(chip_type, opp_chip, player)
    x_check = self.xid + 1
    y_check = self.yid - 1

    chip_row = Board.find_by(id: Board.first.id + self.yid) # is y
    sym_chip = "x#{self.xid}".to_sym # is x
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      col = check_row[sym_check]
      until col == chip_type || col == nil
        if col == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check += 1
          y_check -= 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          col = check_row[sym_check]
          if col == chip_type
            chips_to_change.reverse.each do |chip|
              chip[0].update(chip[1] => chip_type)
              x_check -= 1
              y_check += 1
              Board.update_board(x_check, y_check, player)
            end
          end
        end
      end
    end
  end

  def opp_chip_up_left?(chip_type, opp_chip, player)
    x_check = self.xid - 1
    y_check = self.yid - 1

    chip_row = Board.find_by(id: Board.first.id + self.yid) # is y
    sym_chip = "x#{self.xid}".to_sym # is x
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      col = check_row[sym_check]
      until col == chip_type || col == nil
        if col == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check -= 1
          y_check -= 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          col = check_row[sym_check]
          if col == chip_type
            chips_to_change.reverse.each do |chip|
              chip[0].update(chip[1] => chip_type)
              x_check += 1
              y_check += 1
              Board.update_board(x_check, y_check, player)
            end
          end
        end
      end
    end
  end

  def opp_chip_down_right?(chip_type, opp_chip, player)
    x_check = self.xid + 1
    y_check = self.yid + 1

    chip_row = Board.find_by(id: Board.first.id + self.yid) # is y
    sym_chip = "x#{self.xid}".to_sym # is x
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      col = check_row[sym_check]
      until col == chip_type || col == nil
        if col == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check += 1
          y_check += 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          col = check_row[sym_check]
          if col == chip_type
            chips_to_change.reverse.each do |chip|
              chip[0].update(chip[1] => chip_type)
              x_check -= 1
              y_check -= 1
              Board.update_board(x_check, y_check, player)
            end
          end
        end
      end
    end
  end

  def opp_chip_down_left?(chip_type, opp_chip, player)
    x_check = self.xid - 1
    y_check = self.yid + 1

    chip_row = Board.find_by(id: Board.first.id + self.yid) # is y
    sym_chip = "x#{self.xid}".to_sym # is x
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      col = check_row[sym_check]
      until col == chip_type || col == nil
        if col == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check -= 1
          y_check += 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          col = check_row[sym_check]
          if col == chip_type
            chips_to_change.reverse.each do |chip|
              chip[0].update(chip[1] => chip_type)
              x_check += 1
              y_check -= 1
              Board.update_board(x_check, y_check, player)
            end
          end
        end
      end
    end
  end

  def check_move(player)
    if player.name == "Player 1"
      chip_type = 0
      opp_chip = 1
    elsif player.name == "Player 2"
      chip_type = 1
      opp_chip = 0
    end

    self.opp_chip_up?(chip_type, opp_chip, player)
    self.opp_chip_down?(chip_type, opp_chip, player)
    self.opp_chip_right?(chip_type, opp_chip, player)
    self.opp_chip_left?(chip_type, opp_chip, player)
    self.opp_chip_up_right?(chip_type, opp_chip, player)
    self.opp_chip_up_left?(chip_type, opp_chip, player)
    self.opp_chip_down_right?(chip_type, opp_chip, player)
    self.opp_chip_down_left?(chip_type, opp_chip, player)

#COMMENTS
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
end
