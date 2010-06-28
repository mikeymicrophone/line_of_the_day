class QuotesController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @quotes = Quote.paginate :page => params[:page]
  end
  
  def show
    @quote = Quote.find params[:id]
  end
  
  def new
    @quote = Quote.new params[:quote]
  end
  
  def create
    params[:quote][:user] = current_user
    @quote = Quote.create params[:quote]
    redirect_to quotes_path
  end
end