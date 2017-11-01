module UsersHelper

  def following_user?
    following_arr = current_user.followings.map { |x| x.id }
    following_arr.include?(params[:id].to_i)
  end

  def same_as_current_user?
    current_user == User.find_by_id(params[:id])
  end

  def liked_tracking?(track)
    like_arr = current_user.likes.map { |x| x.tracking_id }
    like_arr.include?(track.id)
  end

  def time_string(time)
    seconds = time / (1000)
    # range: @tracking.order('created_at').first.created_at..@goal.deadline
    Time.at(seconds).strftime("%M:%S") + '.' + (time % 1000).to_s
  end

  def switch(category)
     case category
     when "Swimming"
       "swam"
     when "Biking"
       "biked"
     when "Running"
       "ran"
     else
       "did"
     end
  end

end
