class GoalsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  def index
    @goals = Goal.paginate :page => params[:page]
  end
  
  def show
    @goal = Goal.find params[:id]
  end
  
  def new
    params[:goal] ||= {}
    if params[:line_id].present?
      params[:goal][:objective_type] ||= 'Line'
      params[:goal][:objective_id] ||= params[:line_id]
    elsif params[:scene_id].present?
      params[:goal][:objective_type] ||= 'Scene'
      params[:goal][:objective_id] ||= params[:scene_id]
    elsif params[:tip_id].present?
      params[:goal][:objective_type] ||= 'Tip'
      params[:goal][:objective_id] ||= params[:tip_id]
    elsif params[:exercise_id].present?
      params[:goal][:objective_type] ||= 'Exercise'
      params[:goal][:objective_type] ||= params[:tip_id]
    end
    @goal = Goal.new params[:goal]
  end
  
  def create
    params[:goal][:user] = current_user
    @goal = Goal.create params[:goal]
    if params[:goal_ownership] == 'set'
      current_user.goal_ownerships.create :goal => @goal
      @set = true
    end
    render :action => 'show'
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