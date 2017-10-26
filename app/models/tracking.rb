class Tracking < ApplicationRecord
  belongs_to :goal, optional: true
end
