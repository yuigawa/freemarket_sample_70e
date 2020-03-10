class Profile < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :birth_year
  # belongs_to_active_hash :birth_mounth
  # belongs_to_active_hash :birth_day
  belongs_to :user
end
