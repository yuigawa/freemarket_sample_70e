class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :buyer
      t.string :size
      t.string :item_condition
      t.string :postage_payer
      t.string :postage_type
      t.string :prefecture_code
      t.string :estimated_shipping_date
      t.text :item_description
      t.string :trading_status
      t.integer :price
      # t.references :category, foreign_key: true
      # t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end
