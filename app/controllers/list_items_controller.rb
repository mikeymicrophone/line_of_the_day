class ListItemsController < ApplicationController
  def index
    @list_items = if params[:list_id]
      if params[:sort] == 'rating'
        List.find(params[:list_id]).list_items.rated
      elsif params[:sort] == 'random'
        ListItem.randomized.find_all_by_list_id(params[:list_id])
      else
        List.find(params[:list_id]).list_items
      end
    else
      ListItem
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :partial => 'shared/list_items' }
    end
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
    elsif params[:list_id]
      ['List', params[:list_id]]
    elsif params[:question_id]
      ['Question', params[:question_id]]
    elsif params[:exercise_id]
      ['Exercise', params[:exercise_id]]
    elsif params[:story_id]
      ['Story', params[:story_id]]
    elsif params[:artist_id]
      ['Artist', params[:artist_id]]
    elsif params[:website_id]
      ['Website', params[:website_id]]
    elsif params[:company_id]
      ['Company', params[:company_id]]
    elsif params[:product_id]
      ['Product', params[:product_id]]
    elsif params[:article_id]
      ['Article', params[:article_id]]
    elsif params[:book_id]
      ['Book', params[:book_id]]
    elsif params[:quote_id]
      ['Quote', params[:quote_id]]
    elsif params[:video_id]
      ['Video', params[:video_id]]
    end
    @list_item = ListItem.new params[:list_item]
    render :layout => false
  end
  
  def create
    params[:list_item][:user] = current_user
    params[:list_item][:list_id] ||= params[:list_id]
    @list_item = ListItem.create params[:list_item]
    if @list_item.valid?
      render :partial => 'shared/list_items', :locals => {:list_items => [@list_item], :list => @list_item.list}
    else
      render :nothing => true
    end
  end
  
  def edit
    @list_item = ListItem.find params[:id]
  end
  
  def update
    @list_item = ListItem.find params[:id]
    @list_item.update_attributes params[:list_item]
    redirect_to @list_item.list
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
    @list = @list_item.list
    # do I need to call #remove_from_list
    @list_item.destroy
    redirect_to list_list_items_path(@list)
  end
end