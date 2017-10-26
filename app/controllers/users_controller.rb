class UsersController < ApplicationController

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

  def categories

  end

  def show
    @user = current_user
    @categories = @user.categories
  end

  def running

  end

  def swimming

  end

  def biking

  end


end
