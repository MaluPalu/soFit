class UsersController < ApplicationController

  def index
    @disable_nav = true
  end

  def category
    puts params
    @user = current_user
    @exercises = params[:exercise_type]
    @exercises.each do |exercise|
      @category = Category.new
      @category.user_id = current_user.id
      @category.name = exercise
      @user.categories << @category
    end
    redirect_to user_path(current_user)
  end

  def follow
    @user = User.find_by_id(params[:id])
    type = params[:type]
    if type == "follow" && !following_user?
      @user.followers << current_user
      redirect_to user_path(@user), notice: 'You followed ' + @user.name

    elsif type == "unfollow" && following_user?
      current_user.followings.delete(@user)
      redirect_to user_path(@user), notice: 'Unfollowed ' + @user.name

    else
      # Type missing, nothing happens
      redirect_to user_path(@user), notice: 'Nothing happened.'
    end
  end

  def followings
    @follows = @user.followings
  end

  def followers
    @followers = @user.followers
  end

  def categories

  end

  def show
    @user = User.find_by_id(params[:id])
    @categories = @user.categories
  end

end
