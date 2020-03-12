class AddColumntoItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :user, foreign_key: true
    add_column    :items, :buyer_id, :integer
  end
end
