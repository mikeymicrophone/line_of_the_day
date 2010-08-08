class TagsController < ApplicationController
  def index
    @tags = if params[:line_id]
      Line.find(params[:line_id]).tags
    elsif params[:tip_id]
      Tip.find(params[:tip_id]).tags
    elsif params[:exercise_id]
      Exercise.find(params[:exercise_id]).tags
    else 
      Tag.paginate :page => params[:page]
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @tags }
    end
  end
  
  def show
    @tag = Tag.find params[:id]
  end
  
  def new
    @tag = Tag.new params[:tag]
    render :layout => false
  end
  
  def create
    if request.format == Mime::XML
      params[:concept] = params[:tag].delete(:concept)
    else
      params[:tag][:user] = current_user
    end

    @tags = []
    if params[:concept].present?
      params[:concept].split(',').each do |concept|
        c = Concept.find_or_create_by_name concept.strip
        params[:tag][:subject] = c
        @tags << Tag.create(params[:tag])
      end
    else
      @tag = Tag.create params[:tag]
      @tags << @tag
    end
    respond_to do |format|
      format.js { render :partial => 'tags/tag', :collection => @tags }
      format.html { render @tags.first.subject }
      format.xml { render :text => 'tags saved' }
    end
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