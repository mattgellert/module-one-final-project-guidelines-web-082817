class Move < ActiveRecord::Base
  belongs_to :players
  belongs_to :boards

  def opp_chip_up?(chip_type, opp_chip, player)
    x_check = self.xid
    y_check = self.yid - 1
    chip_row = Board.find_by(id: Board.first.id + self.yid)
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil
      sym = "x#{x_check}".to_sym
      check_cell = check_row[sym]
      chips_to_change = []
      chips_to_change << chip_row

      until check_cell == chip_type || check_cell == nil
        if check_cell == opp_chip
          chips_to_change << check_row
          y_check -= 1
        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          check_cell = check_row[sym]
          if check_cell == chip_type
            self.execute_move(type: "up", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check, sym: sym)
            return true
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
    if check_row != nil
      sym = "x#{x_check}".to_sym
      check_cell = check_row[sym]
      chips_to_change = []
      chips_to_change << chip_row

      until check_cell == chip_type || check_cell == nil
        if check_cell == opp_chip
          chips_to_change << check_row
          y_check += 1
        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          check_cell = check_row[sym]
          if check_cell == chip_type
            self.execute_move(type: "down", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check, sym: sym)
            return true
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
    check_cell = chip_row[sym_check]
    chips_to_change = []
    chips_to_change << sym_chip

    until check_cell == chip_type || check_cell == nil
      if check_cell == opp_chip
        chips_to_change << sym_check
        x_check += 1
      end
      sym_check = "x#{x_check}".to_sym
      check_cell = chip_row[sym_check]
      if check_cell == chip_type
        self.execute_move(type: "right", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check, row: chip_row)
        return true
      end
    end
  end

  def opp_chip_left?(chip_type, opp_chip, player)
    x_check = self.xid - 1
    y_check = self.yid
    chip_row = Board.find_by(id: Board.first.id + y_check)
    sym_chip = "x#{self.xid}".to_sym
    sym_check = "x#{x_check}".to_sym
    check_cell = chip_row[sym_check]
    chips_to_change = []
    chips_to_change << sym_chip

    until check_cell == chip_type || check_cell == nil
      if check_cell == opp_chip
        chips_to_change << sym_check
        x_check -= 1
      end
      sym_check = "x#{x_check}".to_sym
      check_cell = chip_row[sym_check]
      if check_cell == chip_type
        self.execute_move(type: "left", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check, row: chip_row)
        return true
      end
    end
  end

  def opp_chip_up_right?(chip_type, opp_chip, player)
    x_check = self.xid + 1
    y_check = self.yid - 1

    chip_row = Board.find_by(id: Board.first.id + self.yid)
    sym_chip = "x#{self.xid}".to_sym
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      check_cell = check_row[sym_check]
      until check_cell == chip_type || check_cell == nil
        if check_cell == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check += 1
          y_check -= 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          check_cell = check_row[sym_check]
          if check_cell == chip_type
            self.execute_move(type: "up right", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check)
            return true
          end
        end
      end
    end
  end

  def opp_chip_up_left?(chip_type, opp_chip, player)
    x_check = self.xid - 1
    y_check = self.yid - 1

    chip_row = Board.find_by(id: Board.first.id + self.yid)
    sym_chip = "x#{self.xid}".to_sym
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      check_cell = check_row[sym_check]
      until check_cell == chip_type || check_cell == nil
        if check_cell == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check -= 1
          y_check -= 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          check_cell = check_row[sym_check]
          if check_cell == chip_type
            self.execute_move(type: "up left", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check)
            return true
          end
        end
      end
    end
  end

  def opp_chip_down_right?(chip_type, opp_chip, player)
    x_check = self.xid + 1
    y_check = self.yid + 1

    chip_row = Board.find_by(id: Board.first.id + self.yid)
    sym_chip = "x#{self.xid}".to_sym
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      check_cell = check_row[sym_check]
      until check_cell == chip_type || check_cell == nil
        if check_cell == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check += 1
          y_check += 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          check_cell = check_row[sym_check]
          if check_cell == chip_type
            self.execute_move(type: "down right", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check)
            return true
          end
        end
      end
    end
  end

  def opp_chip_down_left?(chip_type, opp_chip, player)
    x_check = self.xid - 1
    y_check = self.yid + 1

    chip_row = Board.find_by(id: Board.first.id + self.yid)
    sym_chip = "x#{self.xid}".to_sym
    chips_to_change = []
    sym_check = "x#{x_check}".to_sym
    check_row = Board.find_by(id: Board.first.id + y_check)
    if check_row != nil

      chips_to_change << [chip_row, sym_chip]

      check_cell = check_row[sym_check]
      until check_cell == chip_type || check_cell == nil
        if check_cell == opp_chip
          chips_to_change << [check_row, sym_check]
          x_check -= 1
          y_check += 1

        end
        check_row = Board.find_by(id: Board.first.id + y_check)
        if check_row != nil
          sym_check = "x#{x_check}".to_sym
          check_cell = check_row[sym_check]
          if check_cell == chip_type
            self.execute_move(type: "down left", chip: chip_type, chips_to_change: chips_to_change, player: player, x_check: x_check, y_check: y_check)
            return true
          end
        end
      end
    end
  end

  def get_chip_types(player)
    if player.name == "Player 1"
      chip_type = 0
      opp_chip = 1
    elsif player.name == "Player 2"
      chip_type = 1
      opp_chip = 0
    end
    chips = {
      same: chip_type,
      opp: opp_chip
    }
  end

  def check_move(player)
    chips = get_chip_types(player)
    valid = []

    valid << self.opp_chip_up?(chips[:same], chips[:opp], player)
    valid << self.opp_chip_down?(chips[:same], chips[:opp], player)
    valid << self.opp_chip_right?(chips[:same], chips[:opp], player)
    valid << self.opp_chip_left?(chips[:same], chips[:opp], player)
    valid << self.opp_chip_up_right?(chips[:same], chips[:opp], player)
    valid << self.opp_chip_up_left?(chips[:same], chips[:opp], player)
    valid << self.opp_chip_down_right?(chips[:same], chips[:opp], player)
    valid << self.opp_chip_down_left?(chips[:same], chips[:opp], player)

    if valid.include?(true)
      return true
    end
  end


  def execute_move(type:, chip:, chips_to_change:, player:, x_check:, y_check:, sym: nil, row: nil)
    case type
      when "up"
        chips_to_change.reverse.each do |change_chip|
          change_chip.update(sym => chip)
          y_check += 1
          Board.update_board(x_check, y_check, player)
        end
      when "down"
        chips_to_change.reverse.each do |change_chip|
          change_chip.update(sym => chip)
          y_check -= 1
          Board.update_board(x_check, y_check, player)
        end
      when "right"
        chips_to_change.reverse.each do |change_chip|
          row.update(change_chip => chip)
          x_check -= 1
          Board.update_board(x_check, y_check, player)
        end
      when "left"
        chips_to_change.reverse.each do |change_chip|
          row.update(change_chip => chip)
          x_check += 1
          Board.update_board(x_check, y_check, player)
        end
      when "up right"
        chips_to_change.reverse.each do |change_chip|
          change_chip[0].update(change_chip[1] => chip)
          x_check -= 1
          y_check += 1
          Board.update_board(x_check, y_check, player)
        end
      when "up left"
        chips_to_change.reverse.each do |change_chip|
          change_chip[0].update(change_chip[1] => chip)
          x_check += 1
          y_check += 1
          Board.update_board(x_check, y_check, player)
        end
      when "down right"
        chips_to_change.reverse.each do |change_chip|
          change_chip[0].update(change_chip[1] => chip)
          x_check -= 1
          y_check -= 1
          Board.update_board(x_check, y_check, player)
        end
      when "down left"
        chips_to_change.reverse.each do |change_chip|
          change_chip[0].update(change_chip[1] => chip)
          x_check += 1
          y_check -= 1
          Board.update_board(x_check, y_check, player)
        end
    end
  end
end
