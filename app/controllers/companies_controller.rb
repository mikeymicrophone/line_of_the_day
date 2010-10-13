class CompaniesController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @companies = if params[:sort] == 'rating'
      Company.rated
    elsif params[:sort] == 'random'
      Company.randomized
    else
      Company
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @company = Company.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @company }
    end
  end
  
  def new
    @company = Company.new params[:company]
  end
  
  def create
    params[:company][:user] = current_user
    @company = Company.create params[:company]
    
    respond_to do |format|
      format.html { render :action => 'show' }
      format.js { render :partial => 'company' }
    end
  end
  
  def edit
    @company = Company.find params[:id]
  end
  
  def update
    @company = Company.find params[:id]
    @company.update_attributes params[:company]
    render :action => 'show'
  end
  
  def destroy
    @company = Company.find params[:id]
    @company.destroy
    redirect_to companys_path
  end
end