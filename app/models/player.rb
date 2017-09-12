require 'pry'
class Player < ActiveRecord::Base


  def self.add_players(name1, name2)
    #creates the two players
    self.create(name: name1)
    self.create(name: name2)
  end

  def make_move(move)
    # coordinate 53 (y: 5, x: 3)
    ycoord = move.split("")[0].to_i
    yid = ycoord - 1

    xcoord = move.split("")[1].to_i
    xid = xcoord

    #make a new Move object and check validity
    move = Move.new(xid: xid, yid: yid)
    validity = move.check_move(self)

    #use execute_move if valid
    if validity == true
      move.execute_move(self)
    else
      #some logic
    end
  end

end
