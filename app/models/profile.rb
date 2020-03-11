class Profile < ApplicationRecord

  belongs_to :user

  # # 名前、生年月日
  validates :family_name, :first_name, :family_name_kana, :first_name_kana,:birth_year,:birth_month,:birth_day, presence: true
  # # 電話番号
  # validates :phone_number, length: { is: 11 }
end
