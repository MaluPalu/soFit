class TrackingsController < ApplicationController

  def new
    @tracking = Tracking.new
    @goal = Goal.find_by_id(params[:id])
  end

  def create
    @goal = Goal.find_by_id(params[:id])
    @tracking = Tracking.create(tracking_params)
    @goal.trackings << @tracking
    redirect_to user_path
  end

  private
  def tracking_params
    params.require(:tracking).permit(:time, :distance, :unit_of_measurement)
  end
end
