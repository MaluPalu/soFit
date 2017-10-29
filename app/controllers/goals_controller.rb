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
    @category = Category.find_by_id(params[:category_id])
    @goal = Goal.find_by_id(params[:id])
    @tracking = @goal.trackings
  end

  def delete_tracking
    @category = Category.find_by_id(params[:id])
    @goal = Goal.find_by_id(params[:id])
    @tracking = Tracking.find_by_id(params[:id])
    @tracking.destroy
    respond_to do |format|
      format.html { redirect_to category_goal_show_path(@category, @goal) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :time, :unit_of_measurement, :distance, :accumulate, :deadline)
  end

end
