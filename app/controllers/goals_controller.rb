class GoalsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  def index
    @goals = Goal.paginate :page => params[:page]
  end
  
  def show
    @goal = Goal.find params[:id]
  end
  
  def new
    @goal = Goal.new params[:goal]
  end
  
  def create
    @goal = Goal.create params[:goal]
    redirect_to @goal
  end
  
  def edit
    @goal = Goal.find params[:id]
    redirect_to @goal unless current_user == @goal.user
  end
  
  def update
    @goal = Goal.find params[:id]
    @goal.update_attributes params[:goal]
    redirect_to @goal
  end
  
  def destroy
    @goal = Goal.find params[:id]
    @goal.destroy
    redirect_to goals_path
  end
end