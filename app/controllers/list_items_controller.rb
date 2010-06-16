class ListItemsController < ApplicationController
  def index
    @list_items = if params[:list_id]
      List.find(params[:list_id]).list_items
    else
      ListItem
    end.paginate :page => params[:page]
  end
  
  def show
    @list_item = ListItem.find params[:id]
  end
  
  def new
    params[:list_item] ||= {}
    params[:list_item][:item_type], params[:list_item][:item_id] = if params[:line_id]
      ['Line', params[:line_id]]
    elsif params[:tip_id]
      ['Tip', params[:tip_id]]
    elsif params[:blog_id]
      ['Blog', params[:blog_id]]
    elsif params[:affirmation_id]
      ['Affirmation', params[:affirmation_id]]
    elsif params[:post_id]
      ['Post', params[:post_id]]
    elsif params[:goal_id]
      ['Goal', params[:goal_id]]
    end
    @list_item = ListItem.new params[:list_item]
  end
  
  def create
    @list_item = ListItem.create params[:list_item]
    redirect_to @list_item.list
  end
  
  def edit
    @list_item = ListItem.find params[:id]
  end
  
  def update
    @list_item = ListItem.find params[:id]
    @list_item.update_attributes params[:list_item]
    redirect_to @list_item
  end
  
  def elevate
    @list_item = ListItem.find params[:id]
    @list_item.move_higher
    redirect_to @list_item.list
  end
  
  def lower
    @list_item = ListItem.find params[:id]
    @list_item.move_lower
    redirect_to @list_item.list    
  end
  
  def destroy
    @list_item = ListItem.find params[:id]
    # do I need to call #remove_from_list
    @list_item.destroy
    redirect_to list_items_path
  end
end