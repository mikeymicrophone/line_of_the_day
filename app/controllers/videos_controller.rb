class VideosController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @videos = Video.paginate :page => params[:page]
  end
  
  def show
    @video = Video.find params[:id]
  end
  
  def new
    @video = Video.new params[:video]
  end
  
  def create
    @video = Video.create params[:video]
    render :action => 'show'
  end
end
