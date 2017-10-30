class GoalsController < ApplicationController
  before_action :get_goal, only: [:new, :show, :delete_tracking]
  before_action :get_category, only: [:new, :create]
  before_action :get_tracking, only: [:delete_tracking]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)
    @goal.time = time_string(@goal.time)
    @category.goals << @goal
    redirect_to user_path(current_user)
  end

  def show
    @category = Category.find_by_id(params[:category_id])
    @tracking = @goal.trackings
  end

  def delete_tracking
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

  def get_goal
    @goal = Goal.find_by_id(params[:id])
  end

  def get_category
    @category = Category.find_by_id(params[:id])
  end

  def get_tracking
    @tracking = Tracking.find_by_id(params[:id])
  end

end
