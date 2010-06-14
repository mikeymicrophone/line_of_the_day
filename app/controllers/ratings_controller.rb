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
    @rating = Rating.create params[:rating]
    redirect_to @rating
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