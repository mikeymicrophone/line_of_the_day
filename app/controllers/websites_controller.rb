class WebsitesController < ApplicationController
  def index
    @websites = if params[:sort] == 'rating'
      Website.all.sort_by(&:average_rating).reverse
    elsif params[:sort] == 'random'
      Website.randomized
    else
      Website
    end.paginate :page => params[:page]
  end
  
  def show
    @website = Website.find params[:id]
  end
  
  def new
    @website = Website.new params[:website]
  end
  
  def create
    params[:website][:user] = current_user
    @website = Website.create params[:website]
    render :action => 'show'
  end
  
  def edit
    @website = Website.find params[:id]
  end
  
  def update
    @website = Website.find params[:id]
    @website.update_attributes params[:website]
    render :action => 'show'
  end
  
  def destroy
    @website = Website.find params[:id]
    @website.destroy
    redirect_to websites_path
  end
end