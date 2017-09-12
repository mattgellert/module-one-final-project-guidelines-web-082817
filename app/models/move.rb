class Move < ActiveRecord::Base
  belongs_to :players
  belongs_to :boards

  def check_move
    #players move is checked for validity



  end

  def execute_move
    #valid move is executed
  end


end
