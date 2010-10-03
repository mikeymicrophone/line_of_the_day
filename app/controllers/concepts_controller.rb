class ConceptsController < ApplicationController
  def index
    @concepts = Concept.paginate :page => params[:page], :per_page => params[:per_page]
  end
  
  def show
    @concept = Concept.find params[:id]
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @concept }
      format.js { render :partial => @concept }
    end
  end
  
  def applied_tags
    @concept = Concept.find params[:id]
    
    render :partial => 'applied_tag', :collection => @concept.applied_tags.map(&:target)
  end
  
  def new
    @concept = Concept.new params[:concept]
  end
  
  def create
    params[:concept][:user] = current_user unless request.format == Mime::XML
    @concept = Concept.create params[:concept]
    
    respond_to do |format|
      format.html { render :action => 'show' }
      format.xml { render :xml => @concept }
    end
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