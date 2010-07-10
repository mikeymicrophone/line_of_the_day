class EditionsController < ApplicationController
  def index
    @editions = Edition.paginate :page => params[:page]
  end
  
  def show
    @edition = Edition.find params[:id]
  end
end