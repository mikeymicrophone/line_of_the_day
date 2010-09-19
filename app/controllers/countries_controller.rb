class CountriesController < ApplicationController
  def show
    @country = Country.find params[:id]
  end
  
  def index
    @countries = Country.all
  end
  
  def new
    @country = Country.new params[:country]
  end
  
  def create
    @country = Country.create params[:country]
    redirect_to @country
  end
  
  def edit
    @country = Country.find params[:id]
  end
  
  def update
    @country = Country.find params[:id]
    @country.update_attributes params[:country]
    redirect_to @country
  end
  
  def destroy
    @country = Country.find params[:id]
    @country.destroy
    redirect_to countries_path
  end
end