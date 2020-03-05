class Item < ApplicationRecord
  has_many :item_users
  has_many :item_images
  has_many :items through: :item_users
  has_many :comments
  has_many :favorites
  belongs_to :brand
  belongs_to :category
end
