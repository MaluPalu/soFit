class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :goals, dependent: :destroy
end
