class CreatePlayer < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :winner, :default => false
    end
  end
end
