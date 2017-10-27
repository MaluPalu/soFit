class TrackingsController < ApplicationController

  def new
    @tracking = Tracking.new
    @goal = Goal.find_by_id(params[:id])
  end

  def create
    @goal = Goal.find_by_id(params[:id])
    @tracking = Tracking.create(tracking_params)
    @goal.trackings << @tracking
    redirect_to category_goal_show_path(@goal.category_id, @goal)
  end

  def edit
    @goal = Goal.find_by_id(params[:goal_id])
    @tracking = Tracking.find_by_id(params[:id])
  end

  def update
    @goal = Goal.find_by_id(params[:goal_id])
    @tracking = Tracking.find_by_id(params[:id])
    @tracking.update(tracking_params)
    redirect_to category_goal_show_path(@goal.category_id, @goal)
  end


  private

  def tracking_params
    params.require(:tracking).permit(:time, :distance, :unit_of_measurement)
  end

end
