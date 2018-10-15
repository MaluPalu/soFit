class Tracking < ApplicationRecord
  belongs_to :goal, optional: true

  has_many :likes
  has_many :liked_by, through: :likes, source: :user

  
end
