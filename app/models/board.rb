class Board < ActiveRecord::Base
  has_many :players
  has_many :moves

  def self.new_board
    8.times do self.create end
  end

end
