class ArtistsController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @artists = if params[:sort] == 'rating'
      Artist.all.sort_by(&:average_rating).reverse
    elsif params[:sort] == 'random'
      Artist.randomized
    else
      Artist
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @artist = Artist.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @nickname }
    end
  end
  
  def new
    @artist = Artist.new params[:artist]
  end
  
  def create
    params[:artist][:user] = current_user
    @artist = Artist.create params[:artist]
    render :action => 'show'
  end
  
  def edit
    @artist = Artist.find params[:id]
  end
  
  def update
    @artist = Artist.find params[:id]
    @artist.update_attributes params[:artist]
    render :action => 'show'
  end
  
  def destroy
    @artist = Artist.find params[:id]
    @artist.destroy
    redirect_to artists_path
  end
end