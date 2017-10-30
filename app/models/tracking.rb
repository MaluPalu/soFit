class Tracking < ApplicationRecord
  belongs_to :goal, optional: true

  has_many :likes
  has_many :liked_by, through: :likes, source: :user

  # def find_average
  #   case distance
  #   when "meters"
  #     time / :goal.distance
  #   when "kilometer"
  #     time
  #   when "miles"
  # end
end
