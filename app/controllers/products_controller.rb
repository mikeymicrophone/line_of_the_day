class ProductsController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @products = if params[:sort] == 'rating'
      Product.all.sort_by(&:average_rating).reverse
    elsif params[:sort] == 'random'
      Product.randomized
    else
      Product
    end.paginate :page => params[:page], :per_page => params[:per_page]
  end
  
  def show
    @product = Product.find params[:id]
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