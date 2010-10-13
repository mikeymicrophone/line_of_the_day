class ExercisesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  include ExposedContent
  def index
    @exercises = if params[:sort] == 'recent'
      Exercise.recent
    elsif params[:sort] == 'rating'
      Exercise.rated
    else
      Exercise.randomized
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @exercises }
      format.js { render :layout => false }
    end
  end
  
  def show
    @exercise = Exercise.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @exercise }
    end
  end
  
  def new
    @exercise = Exercise.new params[:exercise]
  end
  
  def create
    params[:exercise] ||= {}
    params[:exercise][:instruction] ||= params[:instruction]
    params[:exercise][:user] = current_user unless request.format == Mime::XML
    @exercise = Exercise.create params[:exercise]
    respond_to do |format|
      format.js { render :partial => 'exercises/exercise', :object => @exercise, :content_type => :html}
      format.html { render :action => 'show' }
      format.xml { render :xml => @exercise, :status => :created, :location => @exercise }
    end
  end
  
  def edit
    @exercise = Exercise.find params[:id]
  end
  
  def update
    @exercise = Exercise.find params[:id]
    @exercise.update_attributes params[:exercise]
    render :action => 'show'
  end
  
  def destroy
    @exercise = Exercise.find params[:id]
    @exercise.destroy
    redirect_to exercises_path
  end
end