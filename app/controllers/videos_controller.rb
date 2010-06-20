class VideosController < ApplicationController
  def index
  end
  
  def show
    @video = Video.find params[:id]
  end
  
  def new
    @video = Video.new params[:video]
  end
  
  def create
    @video = Video.create params[:video]
  end
end
