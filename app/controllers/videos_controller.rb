class VideosController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @videos = Video.randomized.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @video = Video.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @nickname }
    end
  end
  
  def new
    @video = Video.new params[:video]
  end
  
  def create
    @video = Video.create params[:video]
    render :partial => @video
  end
end
