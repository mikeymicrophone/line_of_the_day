class QuotesController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @quotes = Quote.paginate :page => params[:page], :per_page => params[:per_page]
  end
  
  def show
    @quote = Quote.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @quote }
    end
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