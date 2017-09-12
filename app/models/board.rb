require 'pry'
class Board < ActiveRecord::Base
  has_many :players
  has_many :moves

  @@str00 = "    1   2   3   4   5   6   7   8"
  @@stryy = "   ___ ___ ___ ___ ___ ___ ___ ___"
  @@stry1 = "1 |   |   |   |   |   |   |   |   "
  @@stry2 = "2 |   |   |   |   |   |   |   |   "
  @@stry3 = "3 |   |   |   |   |   |   |   |   "
  @@stry4 = "4 |   |   |   | 1 | 0 |   |   |   "
  @@stry5 = "5 |   |   |   | 0 | 1 |   |   |   "
  @@stry6 = "6 |   |   |   |   |   |   |   |   "
  @@stry7 = "7 |   |   |   |   |   |   |   |   "
  @@stry8 = "8 |   |   |   |   |   |   |   |   "


  def self.new_board
    #instantiates a row in the boards table for each row on the Othello board

    #regular new board
    # 3.times{self.create}
    # self.create(x1: nil,x2: nil,x3: nil,x4: 1,x5: 0,x6: nil,x7: nil,x8: nil)
    # self.create(x1: nil,x2: nil,x3: nil,x4: 0,x5: 1,x6: nil,x7: nil,x8: nil)
    # 3.times{self.create}

    #diagonal check tests new board #upper left
    3.times{self.create}
    self.create(x1: nil,x2: nil,x3: nil,x4: 1,x5: 0,x6: nil,x7: nil,x8: nil)
    self.create(x1: nil,x2: nil,x3: nil,x4: 0,x5: 1,x6: nil,x7: nil,x8: nil)
    3.times{self.create}
  end

  def self.update_board(xid, yid, player)
    #updates the board
    #when player 1, insert 0, when player 2 insert 1
    if player.id == Player.all[-2].id
      chip = " 0 "
    elsif player.id == Player.all[-1].id
      chip = " 1 "
    end

    #get the string associated with yid
    case yid
      when 0
        arr = @@stry1.split("|")
        arr[xid] = chip
        @@stry1 = arr.join("|")
      when 1
        arr = @@stry2.split("|")
        arr[xid] = chip
        @@stry2 = arr.join("|")
      when 2
        arr = @@stry3.split("|")
        arr[xid] = chip
        @@stry3 = arr.join("|")
      when 3
        arr = @@stry4.split("|")
        arr[xid] = chip
        @@stry4 = arr.join("|")
      when 4
        arr = @@stry5.split("|")
        arr[xid] = chip
        @@stry5 = arr.join("|")
      when 5
        arr = @@stry6.split("|")
        arr[xid] = chip
        @@stry6 = arr.join("|")
      when 6
        arr = @@stry7.split("|")
        arr[xid] = chip
        @@stry7 = arr.join("|")
      when 7
        arr = @@stry8.split("|")
        arr[xid] = chip
        @@stry8 = arr.join("|")
    end
    #split the string on '|' change element xid
  end

  def self.display_board
    #puts the board to the terminal
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
