class RatingsController < ApplicationController
  def index
    @ratings = Rating.paginate :page => params[:page]
  end
  
  def show
    @rating = Rating.find params[:id]
  end
  
  def new
    @rating = Rating.new params[:rating]
  end
  
  def create
    params[:rating][:user] = current_user
    @rating = Rating.find_by_target_type_and_target_id_and_user_id(params[:rating][:target_type], params[:rating][:target_id], current_user.id)
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