class UserAddress < ApplicationRecord

  belongs_to :user

  # 住所
  validates :prefecture_code,:city, :house_number,:building_name, presence: true
end
