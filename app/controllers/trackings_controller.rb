class TrackingsController < ApplicationController
  before_action :get_goal, only: [:new, :create]
  before_action :get_tracking, only: [:edit, :update, :like]
  before_action :authenticate_user!
  before_action :check_current_user, only: [:edit, :update]


  def new
    @tracking = Tracking.new
  end

  def like
    type = params[:type]

    if type == "like" && !liked_tracking?(@tracking)
      current_user.liked << @tracking
      redirect_to user_path(current_user), notice: 'You liked that post'
    elsif type == "unlike" && liked_tracking?(@tracking)
      current_user.liked.delete(@tracking)
      redirect_to user_path(current_user), notice: 'Unliked that post'
    else
      redirect_to user_path(current_user), notice: 'Nothing happened.'
    end
  end

  def create
    @tracking = Tracking.create(tracking_params)
    @goal.trackings << @tracking
    redirect_to category_goal_show_path(@goal.category_id, @goal)
  end

  def edit
    @goal = Goal.find_by_id(params[:goal_id])
  end

  def update
    @goal = Goal.find_by_id(params[:goal_id])
    @tracking.update(tracking_params)
    redirect_to category_goal_show_path(@goal.category_id, @goal)
  end

  private

  def tracking_params
    params.require(:tracking).permit(:time, :distance, :unit_of_measurement)
  end

  def get_goal
    @goal = Goal.find_by_id(params[:id])
  end

  def get_tracking
    @tracking = Tracking.find_by_id(params[:id])
  end

  def check_current_user
    @goal = Goal.find_by_id(params[:goal_id])
    if current_user != User.find_by_id(@goal.category_id)
      redirect_to root_path
    end
  end

end
