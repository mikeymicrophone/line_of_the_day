class RatingsController < ApplicationController
  def index
    @ratings = if ([params[:line_id], params[:tip_id], params[:exercise_id]].include?("(null)"))
      []
    elsif params[:line_id]
      Line.find(params[:line_id]).ratings
    elsif params[:tip_id]
      Tip.find(params[:tip_id]).ratings
    elsif params[:exercise_id]
      Exercise.find(params[:exercise_id]).ratings
    elsif params[:user_id]
      User.find(params[:user_id]).ratings
    else
      Rating
    end.paginate :page => params[:page], :order => 'created_at desc'
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @ratings }
    end
  end
  
  def show
    @rating = Rating.find params[:id]
  end
  
  def new
    @rating = Rating.new params[:rating]
  end
  
  def create
    if request.format == Mime::XML
      @rating = Rating.find_by_target_type_and_target_id_and_user_id(params[:rating][:target_type], params[:rating][:target_id], params[:rating][:user_id])     
    else
      params[:rating][:user] = current_user
      @rating = Rating.find_by_target_type_and_target_id_and_user_id(params[:rating][:target_type], params[:rating][:target_id], current_user.id)      
    end
    if @rating
      @rating.update_attribute :opinion, params[:rating][:opinion]
    else
      @rating = Rating.create params[:rating]
    end
    render :nothing => true
  end
  
  def edit
    @rating = Rating.find params[:id]
    redirect_to @rating unless @rating.user == current_user
  end
  
  def update
    @rating = Rating.find params[:id]
    @rating.update_attributes params[:rating]
    redirect_to @rating
  end
  
  def destroy
    @rating = Rating.find params[:id]
    @rating.destroy
    redirect_to ratings_path
  end
end