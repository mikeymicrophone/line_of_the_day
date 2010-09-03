class PositionsController < ApplicationController
  def show
    @position = Position.find params[:id]
  end
  
  def index
    @positions = Position.all
  end
  
  def new
    @position = Position.new params[:position]
  end
  
  def create
    @position = Position.create params[:position]
    redirect_to @position
  end
  
  def edit
    @position = Position.find params[:id]
  end
  
  def update
    @position = Position.find params[:id]
    @position.update_attributes params[:position]
    redirect_to @position
  end
  
  def destroy
    @position = Position.find params[:id]
    @position.destroy
    redirect_to positions_path
  end
end