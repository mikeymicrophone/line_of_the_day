class NeighborhoodsController < ApplicationController
  def show
    @neighborhood = Neighborhood.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @neighborhood }
    end
  end
  
  def index
    @neighborhoods = if params[:state_id]
      State.find(params[:state_id]).neighborhoods.sorted(params[:sort])
    elsif params[:city_id]
      City.find(params[:city_id]).neighborhoods.sorted(params[:sort])
    else
      Neighborhood.sorted(params[:sort])
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def new
    @neighborhood = Neighborhood.new params[:neighborhood]
  end
  
  def create
    @neighborhood = Neighborhood.create params[:neighborhood]
    render :partial => 'neighborhood'
  end
  
  def edit
    @neighborhood = Neighborhood.find params[:id]
  end
  
  def update
    @neighborhood = Neighborhood.find params[:id]
    @neighborhood.update_attributes params[:neighborhood]
    redirect_to @neighborhood
  end
  
  def destroy
    @neighborhood = Neighborhood.find params[:id]
    @neighborhood.destroy
    redirect_to neighborhoods_path
  end
end