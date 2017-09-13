class Board < ActiveRecord::Base
  has_many :players
  has_many :moves

  @@str00 = "         1   2   3   4   5   6   7   8"
  @@stryy = "        ___ ___ ___ ___ ___ ___ ___ ___"
  @@stry1 = "     1 |   |   |   |   |   |   |   |   "
  @@stry2 = "     2 |   |   |   |   |   |   |   |   "
  @@stry3 = "     3 |   |   |   |   |   |   |   |   "
  @@stry4 = "     4 |   |   |   | 1 | 0 |   |   |   "
  @@stry5 = "     5 |   |   |   | 0 | 1 |   |   |   "
  @@stry6 = "     6 |   |   |   |   |   |   |   |   "
  @@stry7 = "     7 |   |   |   |   |   |   |   |   "
  @@stry8 = "     8 |   |   |   |   |   |   |   |   "


  def self.new_board
    3.times{self.create}
    self.create(x1: nil,x2: nil,x3: nil,x4: 1,x5: 0,x6: nil,x7: nil,x8: nil)
    self.create(x1: nil,x2: nil,x3: nil,x4: 0,x5: 1,x6: nil,x7: nil,x8: nil)
    3.times{self.create}
  end

  def self.set_cell(row, column, chip)
    arr = row.split("|")
    arr[column] = chip
    row = arr.join("|")
  end

  def self.get_chip_type(player)
    if player.id == Player.all[-2].id
      chip = " 0 "
    elsif player.id == Player.all[-1].id
      chip = " 1 "
    end
    chip
  end

  def self.update_board(xid, yid, player)
    chip = self.get_chip_type(player)

    case yid
      when 0
        @@stry1 = self.set_cell(@@stry1, xid, chip)
      when 1
        @@stry2 = self.set_cell(@@stry2, xid, chip)
      when 2
        @@stry3 = self.set_cell(@@stry3, xid, chip)
      when 3
        @@stry4 = self.set_cell(@@stry4, xid, chip)
      when 4
        @@stry5 = self.set_cell(@@stry5, xid, chip)
      when 5
        @@stry6 = self.set_cell(@@stry6, xid, chip)
      when 6
        @@stry7 = self.set_cell(@@stry7, xid, chip)
      when 7
        @@stry8 = self.set_cell(@@stry8, xid, chip)
    end
  end

  def self.get_chip_count
    chips = []
    self.all.each do |row|
      chips << row[:x1]
      chips << row[:x2]
      chips << row[:x3]
      chips << row[:x4]
      chips << row[:x5]
      chips << row[:x6]
      chips << row[:x7]
      chips << row[:x8]
    end
    counts = {zero: chips.count(0), one: chips.count(1)}
  end

  def self.display_board
    counts = self.get_chip_count
    puts "             _   _          _ _     "
    puts "            | | | |        | | |      "
    puts "        ___ | |_| |__   ___| | | ___  "
    puts "       / _ \\\| __| '_ \\ / _ \\ | |/ _ \\ "
    puts "      | (_) | |_| | | |  __/ | | (_) |"
    puts "       \\___/ \\__|_| |_|\\___|_|_|\\___/ "
    puts "\n"
    #display the count of 1's and 0's
    puts "        Player 1: #{counts[:zero]}      Player 2: #{counts[:one]}"
    puts "\n"
    puts @@str00
    puts @@stryy
    puts @@stry1
    puts @@stryy
    puts @@stry2
    puts @@stryy
    puts @@stry3
    puts @@stryy
    puts @@stry4
    puts @@stryy
    puts @@stry5
    puts @@stryy
    puts @@stry6
    puts @@stryy
    puts @@stry7
    puts @@stryy
    puts @@stry8
    puts @@stryy
  end
end
