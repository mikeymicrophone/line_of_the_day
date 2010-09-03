class StatesController < ApplicationController
  def show
    @state = State.find params[:id]
  end
  
  def index
    @states = State.all
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