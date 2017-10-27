class Goal < ApplicationRecord
  belongs_to :category, optional: true
  has_many :trackings

 def time_string
   seconds = time / (1000)
   Time.at(seconds).strftime("%H:%M:%S") + '.' + (time % 1000).to_s
 end
end
