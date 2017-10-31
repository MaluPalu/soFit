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
    @goal = Goal.find_by_id(params[:id])
    @tracking = Tracking.create(tracking_params)
    if @tracking.unit_of_measurement == nil
      redirect_to goal_tracking_new_path(@goal), notice: "Fill out unit of measurement field" and return
    elsif @tracking.time == 0
      redirect_to goal_tracking_new_path(@goal), notice: "Fill out time field correctly" and return
    elsif @tracking.distance == nil
      redirect_to goal_tracking_new_path(@goal), notice: "Fill out distance field" and return
    end
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
    if current_user != User.find_by_id(@goal.category.user_id)
      redirect_to root_path
    end
  end

end
