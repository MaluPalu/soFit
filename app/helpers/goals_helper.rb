module GoalsHelper
  def to_duration_string(milliseconds)
    return '' unless milliseconds

    hours, milliseconds   = milliseconds.divmod(1000 * 60 * 60)
    minutes, milliseconds = milliseconds.divmod(1000 * 60)
    seconds, milliseconds = milliseconds.divmod(1000)
    "#{hours.floor.to_s.rjust(2,'0')}:#{minutes.floor.to_s.rjust(2,'0')}:#{seconds.floor.to_s.rjust(2,'0')}.#{milliseconds.floor}"

  end
end
