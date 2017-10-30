class UsersController < ApplicationController
  before_action :get_user, except: [:index]

  def index
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
    @categories = @user.categories
    @trackings = Tracking.all.sort_by(&:created_at).reverse[0..10]
  end

  private

  def get_user
    @user = User.find_by_id(params[:id])
  end

end
