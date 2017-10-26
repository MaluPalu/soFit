class Goal < ApplicationRecord
  belongs_to :category, optional: true
end
