require 'pry'
class Player < ActiveRecord::Base


  def self.add_players(name1, name2)
    #creates the two players
    self.create(name: name1)
    self.create(name: name2)
  end

  def make_move(move)
    # coordinate 53 (x: 5, y: 3)
    xcoord = move.split("")[0].to_i
    xid = xcoord - 1

    ycoord = move.split("")[1].to_i
    yid = ycoord

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
