class UserAddress < ApplicationRecord

  belongs_to :user

  # 郵便番号
  # validates :post_code, format: { with: /\A\d{3}\-?d{4}\z/ }
  # 住所
  validates :prefecture_code,:city, :house_number,:building_name, presence: true
end
