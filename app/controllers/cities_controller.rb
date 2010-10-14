class CitiesController < ApplicationController
  def show
    @city = City.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @city }
    end
  end
  
  def index
    @cities = if params[:country_id]
      Country.find(params[:country_id]).cities.sorted(params[:sort])
    elsif params[:state_id]
      State.find(params[:state_id]).cities.sorted(params[:sort])
    else
      City.sorted(params[:sort])
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def new
    @city = City.new params[:city]
  end
  
  def create
    @city = City.create params[:city]
    render :partial => @city
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