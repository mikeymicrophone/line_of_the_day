class CitiesController < ApplicationController
  def show
    @city = City.find params[:id]
  end
  
  def index
    @cities = City.all
  end
  
  def new
    @city = City.new params[:city]
  end
  
  def create
    @city = City.create params[:city]
    redirect_to @city
  end
  
  def edit
    @city = City.find params[:id]
  end
  
  def update
    @city = City.find params[:id]
    @city.update_attributes params[:city]
    redirect_to @city
  end
  
  def destroy
    @city = City.find params[:id]
    @city.destroy
    redirect_to cities_path
  end
end