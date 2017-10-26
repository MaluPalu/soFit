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

  private

  def goal_params
    params.require(:goal).permit(:name, :time, :unit_of_measurement, :distance, :deadline)
  end

end
