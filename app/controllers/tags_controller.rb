class TagsController < ApplicationController
  def index
    @tags = Tag.paginate :page => params[:page]
  end
  
  def show
    @tag = Tag.find params[:id]
  end
  
  def new
    @tag = Tag.new params[:tag]
    render :layout => false
  end
  
  def create
    params[:tag][:user] = current_user
    if params[:concept].present?
      params[:concept].split(',').each do |concept|
        c = Concept.find_or_create_by_name concept.strip
        params[:tag][:subject] = c
        Tag.create params[:tag]
      end
    else
      @tag = Tag.create params[:tag]
    end
    render :text => 'tagged'
  end
  
  def edit
    @tag = Tag.find params[:id]
  end
  
  def update
    @tag = Tag.find params[:id]
    @tag.update_attributes params[:tag]
    render :action => 'show'
  end
  
  def destroy
    @tag = Tag.find params[:id]
    @tag.destroy
    redirect_to tags_path
  end
end