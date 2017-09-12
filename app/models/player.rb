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

    #get back the row associated with x-id
    #binding.pry
    row = Board.find_by(id: Board.first.id + xid)
    sym = "y#{yid}".to_sym
    col = row[sym]
    #binding.pry

    if col == nil
      col = self.id - 1
      Board.update_board(xid, yid, self)
    else
      puts "There is a chip there."
    end


  end

end
