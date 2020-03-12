class ChangeColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :birth_year, :integer
    change_column :profiles, :birth_month, :integer
    change_column :profiles, :birth_day, :integer
  end
end
