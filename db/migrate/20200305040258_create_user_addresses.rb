class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.integer :post_code, null: false
      t.string :prefecture_code, null: false
      t.string :city, null: false
      t.string :house_number
      t.string :building_name
      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
