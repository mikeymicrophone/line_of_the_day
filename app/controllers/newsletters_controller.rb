class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.paginate :page => params[:page]
  end
  
  def show
    @newsletter = Newsletter.find params[:id]
  end
end