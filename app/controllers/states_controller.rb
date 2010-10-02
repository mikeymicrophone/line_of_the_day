class StatesController < ApplicationController
  def show
    @state = State.find params[:id]
    
    respond_to do |format|
      format.js { render :partial => @state }
    end
  end
  
  def index
    @states = if params[:country_id]
      Country.find(params[:country_id]).states
    else
      State.randomized
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def new
    @state = State.new params[:state]
  end
  
  def create
    @state = State.create params[:state]
    redirect_to @state
  end
  
  def edit
    @state = State.find params[:id]
  end
  
  def update
    @state = State.find params[:id]
    @state.update_attributes params[:state]
    redirect_to @state
  end
  
  def destroy
    @state = State.find params[:id]
    @state.destroy
    redirect_to states_path
  end
end