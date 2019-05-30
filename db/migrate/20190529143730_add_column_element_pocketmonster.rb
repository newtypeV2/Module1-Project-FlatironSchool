class AddColumnElementPocketmonster < ActiveRecord::Migration[5.2]
  def change
    add_column :pocketmonsters, :element, :string
  end
end
