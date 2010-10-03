class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.paginate :page => params[:page]
  end
  
  def show
    @newsletter = Newsletter.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @newsletter }
    end
  end
end