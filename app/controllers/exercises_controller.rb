class ExercisesController < ApplicationController
  include ExposedContent
  def index
    @exercises = Exercise.paginate :page => params[:page]
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @exercises }
    end
  end
  
  def show
    @exercise = Exercise.find params[:id]
  end
  
  def new
    @exercise = Exercise.new params[:exercise]
  end
  
  def create
    params[:exercise][:user] = current_user
    @exercise = Exercise.create params[:exercise]
    respond_to do |format|
      format.js { render :partial => 'exercises/exercise', :object => @exercise, :content_type => :html}
      format.html { render :action => 'show' }
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