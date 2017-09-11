class Move < ActiveRecord::Base
  belongs_to :players
  belongs_to :boards
end
