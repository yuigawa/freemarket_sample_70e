class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.datetime :birth_year, null: false
      t.datetime :birth_month, null: false
      t.datetime :birth_day, null: false
      t.text :introduction
      t.string :image
      t.string :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
