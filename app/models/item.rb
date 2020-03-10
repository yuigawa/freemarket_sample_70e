class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  has_many :item_images
  has_many :comments
  has_many :favorites
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category

  accepts_nested_attributes_for :item_images, allow_destroy: true
end
