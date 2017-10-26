module GoalsHelper
  def get_duration_hrs_and_mins(duration)
    hours = duration / (1000 * 60 * 60)
    minutes = duration / (1000 * 60) % 60
    minutes.to_i
  end
end
