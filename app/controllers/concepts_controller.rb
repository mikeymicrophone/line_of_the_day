class ConceptsController < ApplicationController
  def index
    @concepts = Concept.paginate :page => params[:page]
  end
  
  def show
    @concept = Concept.find params[:id]
  end
  
  def new
    @concept = Concept.new params[:concept]
  end
  
  def create
    params[:concept][:user] = current_user
    @concept = Concept.create params[:concept]
    render :action => 'show'
  end
  
  def edit
    @concept = Concept.find params[:id]
  end
  
  def update
    @concept = Concept.find params[:id]
    @concept.update_attributes params[:concept]
    render :action => 'show'
  end
  
  def destroy
    @concept = Concept.find params[:id]
    @concept.destroy
    redirect_to concepts_path
  end
end