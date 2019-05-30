class CreateMovelistsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :movelists do |table|
      table.integer :pp
      table.integer :pocketmonster_trainer_id
      table.integer :move_id
    end
  end
end
