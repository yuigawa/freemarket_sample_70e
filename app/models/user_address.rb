class UserAddress < ApplicationRecord

  belongs_to :user

  # 住所
  validates :post_code,:prefecture_code,:city, :house_number, presence: true
end
