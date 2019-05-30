class AddColumnElementMoves < ActiveRecord::Migration[5.2]
  def change
      add_column :moves, :element, :string
  end
end
