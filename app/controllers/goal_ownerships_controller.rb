class GoalOwnershipsController < ApplicationController
  def create
    @goal_ownership = GoalOwnership.create params[:goal_ownership]
    redirect_to user_goal_ownerships_path(current_user)
  end
  
  def index
    @goal_ownerships = if params[:user_id]
      User.find(params[:user_id]).goal_ownerships
    else
      GoalOwnership
    end.paginate :page => params[:page]
  end
end