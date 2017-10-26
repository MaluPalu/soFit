class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    @category = Category.find_by_id(params[:id])
  end

  def create
    @category = Category.find_by_id(params[:id])
    @goal = Goal.create(goal_params)
    @category.goals << @goal
    redirect_to user_path(current_user)
  end

  def show
    @goal = Goal.find_by_id(params[:id])
    if @goal.time != nil
      @goal.time = get_duration_hrs_and_mins(@goal.time)
    else
      @goal.time
    end
    @tracking = @goal.trackings
  end

  def delete_tracking
    @tracking = Tracking.find_by_id(params[:id])
    @tracking.destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :time, :unit_of_measurement, :distance, :deadline)
  end

end
