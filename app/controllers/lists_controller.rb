class ListsController < ApplicationController
  def index
    @lists = if params[:user_id]
      if params[:sort] == 'rating'
        User.find(params[:user_id]).lists.public_to(current_user).not_empty.sort_by(&:average_rating).reverse
      elsif params[:sort] == 'recent'
       User.find(params[:user_id]).lists.public_to(current_user).not_empty.sort_by { |l| l.recent_update(current_user) }.reverse
      elsif params[:sort] == 'random'
        User.find(params[:user_id]).lists.randomized.public_to(current_user).not_empty
      else
        User.find(params[:user_id]).lists.public_to(current_user).ordered.not_empty
      end
    else
      if params[:sort] == 'rating'
        List.public_to(current_user).not_empty.sort_by(&:average_rating).reverse
      elsif params[:sort] == 'recent'
        List.public_to(current_user).not_empty.sort_by { |l| l.recent_update(current_user) }.reverse
      elsif params[:sort] == 'random'
        List.randomized.public_to(current_user).not_empty
      else
        List.public_to(current_user).not_empty
      end
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @list = List.find params[:id]
  end
  
  def tag
    @list = List.find params[:id]
    render :layout => false
  end
  
  def new
    @list = List.new params[:list]
  end
  
  def create
    params[:list][:user] = current_user
    @list = List.create params[:list]
    respond_to do |format|
      format.html { redirect_to @list }
      format.js { render :partial => 'new_list', :locals => {:list => @list} }
    end
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
  
  def sort  
    params[:draggable_lists].each_with_index do |id, index|  
      List.update_all(['position=?', index+1], ['id=?', id])  
    end  
    render :nothing => true  
  end
  
  def destroy
    @list = List.find params[:id]
    @list.destroy
    redirect_to lists_path
  end
end