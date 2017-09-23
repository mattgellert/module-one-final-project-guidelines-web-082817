class CreateBoard < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.integer :x1, :default => nil
      t.integer :x2, :default => nil
      t.integer :x3, :default => nil
      t.integer :x4, :default => nil
      t.integer :x5, :default => nil
      t.integer :x6, :default => nil
      t.integer :x7, :default => nil
      t.integer :x8, :default => nil
    end
  end
end
