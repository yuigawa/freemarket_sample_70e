class AddColumnUserAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :user_addresses, :post_code, :string
  end
end
