class CreateBoard < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.integer :y1, :default => nil
      t.integer :y2, :default => nil
      t.integer :y3, :default => nil
      t.integer :y4, :default => nil
      t.integer :y5, :default => nil
      t.integer :y6, :default => nil
      t.integer :y7, :default => nil
      t.integer :y8, :default => nil
    end
  end
end
