class StoriesController < ApplicationController
  auto_complete_for :scene, :name
  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_scene_name]
  
  def index
    @stories = Story.public_to(current_user).sorted(params[:sort]).paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @story = Story.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @story }
    end
  end
  
  def new
    @story = Story.new params[:story]
  end
  
  def create
    params[:story][:user] = current_user
    params[:story][:scene] = Scene.find_or_create_by_name(params[:scene][:name], :user => current_user)
    @story = Story.create params[:story]
    respond_to do |format|
      format.js { render :partial => 'stories/story', :object => @story, :content_type => :html }
      format.html { render :action => 'show' }
    end
  end
  
  def edit
    @story = Story.find params[:id]
    redirect_to @story unless @story.user == current_user
  end
  
  def update
    @story = Story.find params[:id]
    @story.update_attributes params[:story]
    render :action => 'show'
  end
  
  def destroy
    @story = Story.find params[:id]
    @story.destroy
    redirect_to stories_path
  end
end