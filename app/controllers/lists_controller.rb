class ListsController < ApplicationController
  def index
    @lists = if params[:user_id]
      User.find(params[:user_id]).lists.ordered
    else
      List
    end.paginate :page => params[:page]
  end
  
  def show
    @list = List.find params[:id]
  end
  
  def new
    @list = List.new params[:list]
  end
  
  def create
    params[:list][:user] = current_user
    @list = List.create params[:list]
    redirect_to @list
  end
  
  def edit
    @list = List.find params[:id]
    redirect_to @list unless @list.user == current_user
  end
  
  def update
    @list = List.find params[:id]
    @list.update_attributes params[:list]
    redirect_to @list
  end
  
  def elevate
    @list = List.find params[:id]
    @list.move_higher
    redirect_to user_lists_path(current_user)
  end
  
  def lower
    @list = List.find params[:id]
    @list.move_lower
    redirect_to user_lists_path(current_user)
  end
  
  def destroy
    @list = List.find params[:id]
    @list.destroy
    redirect_to lists_path
  end
end