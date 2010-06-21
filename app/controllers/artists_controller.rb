class ArtistsController < ApplicationController
  def index
    @artists = if params[:sort] == 'rating'
      Artist.all.sort_by(&:average_rating).reverse
    elsif params[:sort] == 'random'
      Artist.randomized
    else
      Artist
    end.paginate :page => params[:page]
  end
  
  def show
    @artist = Artist.find params[:id]
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