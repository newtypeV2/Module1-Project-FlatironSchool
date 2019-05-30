class CreatePocketmonsterTrainerTable < ActiveRecord::Migration[5.2]
  def change
      create_table :pocketmonster_trainers do |t|
        t.integer :trainer_id
        t.integer :pocketmonster_id
        t.integer :hitpoints
      end
  end
end
