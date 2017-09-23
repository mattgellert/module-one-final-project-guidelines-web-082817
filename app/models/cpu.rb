class CPU
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_move(board)
    yid = 5
    xid = 4
    while yid < 8
      move = Move.new(xid: xid, yid: yid)
      valid = move.check_move(player: self, board: board)
      if valid.include?(true)
      end

      while xid < 9



        xid += 1
      end
    yid += 1
    end

    move = Move.new(xid: xid, yid: yid)
    valid = move.check_move(self)
  end



end
