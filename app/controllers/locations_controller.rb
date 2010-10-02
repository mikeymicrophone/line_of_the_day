class LocationsController < ApplicationController
  def show
    @location = Location.find params[:id]
  end
  
  def index
    @locations = Location.all
  end
  
  def new
    @location = Location.new params[:location]
  end
  
  def create
    @location = Location.create params[:location]
    redirect_to @location
  end
  
  def edit
    @location = Location.find params[:id]
  end
  
  def update
    @location = Location.find params[:id]
    @location.update_attributes params[:location]
    redirect_to @location
  end
  
  def destroy
    @location = Location.find params[:id]
    @location.destroy
    redirect_to locations_path
  end
end