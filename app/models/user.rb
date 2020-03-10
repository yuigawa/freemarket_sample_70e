class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_year
  belongs_to_active_hash :birth_month
  belongs_to_active_hash :birth_day
  belongs_to_active_hash :prefecture


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :favorites
  has_one  :profile
  has_one  :user_address
  has_many  :credit_cards
  accepts_nested_attributes_for :user_address, allow_destroy: true
  accepts_nested_attributes_for :profile, allow_destroy: true
end