module UsersHelper

  def following_user?
    following_arr = current_user.followings.map { |x| x.id }
    following_arr.include?(params[:id].to_i)
  end

  def same_as_current_user?
    current_user == User.find_by_id(params[:id])
  end
  
end
