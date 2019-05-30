class CreateMovesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :base_damage
    end
  end
end
