class CreateTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pocketmonsters do |t|
      t.string :name
      t.integer :hp, default: 60
    end
  end
end
