class User < ApplicationRecord
  before_save { self.email = email.downcase }

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

  # ニックネーム
  validates :nickname, {presence: true}

  # メール
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true,  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  # # パスワード
  validates :password, confirmation: true


end