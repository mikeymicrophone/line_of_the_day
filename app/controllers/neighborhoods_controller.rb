class NeighborhoodsController < ApplicationController
  def show
    @neighborhood = Neighborhood.find params[:id]
  end
  
  def index
    @neighborhoods = Neighborhood.all.paginate :page => params[:page], :per_page => params[:per_page]
    
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
    redirect_to @neighborhood
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