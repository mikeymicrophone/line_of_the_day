class ProductsController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @products = Product.sorted(params[:sort]).paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @product = Product.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @product }
    end
  end
  
  def new
    @product = Product.new params[:product]
  end
  
  def create
    params[:product][:user] = current_user
    @product = Product.create params[:product]
    render :action => 'show'
  end
  
  def edit
    @product = Product.find params[:id]
  end
  
  def update
    @product = Product.find params[:id]
    @product.update_attributes params[:product]
    render :action => 'show'
  end
  
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end
end