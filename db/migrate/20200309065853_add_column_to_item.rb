class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :seller, foreign_key: { to_table: :users }
    add_reference :items, :buyer, foreign_key: { to_table: :users }
    add_reference :items, :category, foreign_key: true
    add_reference :items, :brand, foreign_key: true
  end
end
