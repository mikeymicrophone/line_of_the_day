class GoalOwnershipsController < ApplicationController
  def create
    params[:goal_ownership][:user] = current_user
    @goal_ownership = GoalOwnership.create params[:goal_ownership]
    redirect_to user_goal_ownerships_path(current_user)
  end
  
  def index
    @goal_ownerships = if params[:user_id]
      User.find(params[:user_id]).goal_ownerships
    else
      GoalOwnership
    end.paginate :page => params[:page]
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @goal_ownerships.to_xml(:methods => [:derived_description, :completion_status, :remaining_days_text]) }
    end
  end
  
  def show
    @goal_ownership = GoalOwnership.find params[:id]
  end
  
  def update
    @goal_ownership = GoalOwnership.find params[:id]
    @goal_ownership.update_attributes params[:goal_ownership]
    redirect_to user_goal_ownerships_path(current_user)
  end
end