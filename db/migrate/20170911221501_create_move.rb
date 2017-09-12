class CreateMove < ActiveRecord::Migration[5.1]
  def change
    create_table :moves do |t|
      # t.Player :player
      # t.Board :board
    end
  end
end
