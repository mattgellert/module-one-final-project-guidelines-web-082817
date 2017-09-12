class CreateMove < ActiveRecord::Migration[5.1]
  def change
    create_table :moves do |t|
      t.integer :xid
      t.integer :yid
    end
  end
end
