require 'pry'
class Board < ActiveRecord::Base
  has_many :players
  has_many :moves

  @@str00 = "    1   2   3   4   5   6   7   8"
  @@strxx = "   ___ ___ ___ ___ ___ ___ ___ ___"
  @@strx1 = "1 |   |   |   |   |   |   |   |   "
  @@strx2 = "2 |   |   |   |   |   |   |   |   "
  @@strx3 = "3 |   |   |   |   |   |   |   |   "
  @@strx4 = "4 |   |   |   | 1 | 0 |   |   |   "
  @@strx5 = "5 |   |   |   | 0 | 1 |   |   |   "
  @@strx6 = "6 |   |   |   |   |   |   |   |   "
  @@strx7 = "7 |   |   |   |   |   |   |   |   "
  @@strx8 = "8 |   |   |   |   |   |   |   |   "


  def self.new_board
    #instantiates a row in the boards table for each row on the Othello board
    3.times{self.create}
    self.create(y1: nil,y2: nil,y3: nil,y4: 1,y5: 0,y6: nil,y7: nil,y8: nil)
    self.create(y1: nil,y2: nil,y3: nil,y4: 0,y5: 1,y6: nil,y7: nil,y8: nil)
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

    #get the string associated with xid
    case xid
      when 0
        arr = @@strx1.split("|")
        arr[yid] = chip
        @@strx1 = arr.join("|")
      when 1
        arr = @@strx2.split("|")
        arr[yid] = chip
        @@strx2 = arr.join("|")
      when 2
        arr = @@strx3.split("|")
        arr[yid] = chip
        @@strx3 = arr.join("|")
      when 3
        arr = @@strx4.split("|")
        arr[yid] = chip
        @@strx4 = arr.join("|")
      when 4
        arr = @@strx5.split("|")
        arr[yid] = chip
        @@strx5 = arr.join("|")
      when 5
        arr = @@strx6.split("|")
        arr[yid] = chip
        @@strx6 = arr.join("|")
      when 6
        arr = @@strx7.split("|")
        arr[yid] = chip
        @@strx7 = arr.join("|")
      when 7
        arr = @@strx8.split("|")
        arr[yid] = chip
        @@strx8 = arr.join("|")
    end
    #split the string on '|' change element yid
  end

  def self.display_board
    #puts the board to the terminal
    puts @@str00
    puts @@strxx
    puts @@strx1
    puts @@strxx
    puts @@strx2
    puts @@strxx
    puts @@strx3
    puts @@strxx
    puts @@strx4
    puts @@strxx
    puts @@strx5
    puts @@strxx
    puts @@strx6
    puts @@strxx
    puts @@strx7
    puts @@strxx
    puts @@strx8
    puts @@strxx
  end

end
