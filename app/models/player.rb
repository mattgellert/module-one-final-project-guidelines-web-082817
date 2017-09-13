require 'pry'
class Player < ActiveRecord::Base


  def self.add_players(name1, name2)
    self.create(name: name1)
    self.create(name: name2)
  end

  def make_move(move)
    ycoord = move.split("")[0].to_i
    yid = ycoord - 1

    xcoord = move.split("")[1].to_i
    xid = xcoord

    move = Move.new(xid: xid, yid: yid)
    valid = move.check_move(self)
  end
end
