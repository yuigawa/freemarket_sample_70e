class UserAddress < ApplicationRecord

  belongs_to :user

  # 住所
  validates :post_code,:prefecture_code,:city, :house_number, presence: true
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, multiline: true}
end
