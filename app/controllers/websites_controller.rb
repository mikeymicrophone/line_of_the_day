class WebsitesController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @websites = Website.sorted(params[:sort]).paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @website = Website.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @website }
    end
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