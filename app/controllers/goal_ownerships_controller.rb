class GoalOwnershipsController < ApplicationController
  def create
    @goal_ownership = GoalOwnership.create params[:goal_ownership]
    redirect_to user_goal_ownerships_path(current_user)
  end
  
  def index
    @goal_ownerships = if params[:user_id]
      GoalOwnership.paginate_all_by_user_id(params[:user_id], :page => params[:page])
    else
      GoalOwnership.paginate :page => params[:page]
    end
  end
end