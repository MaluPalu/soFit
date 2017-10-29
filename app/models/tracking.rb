class Tracking < ApplicationRecord
  belongs_to :goal, optional: true

  # def find_average
  #   case distance
  #   when "meters"
  #     time / :goal.distance
  #   when "kilometer"
  #     time
  #   when "miles"
  # end
end
