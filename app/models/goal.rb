class Goal < ApplicationRecord
  belongs_to :category, optional: true
  has_many :trackings, dependent: :destroy

end
