class TipsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  
  def index
    @tips = Tip.paginate :page => params[:page]
  end
  
  def show
    @tip = Tip.find params[:id]
  end
  
  def new
    @tip = Tip.new params[:tip]
  end
  
  def create
    params[:tip][:user] = current_user
    @tip = Tip.create params[:tip]
    respond_to do |format|
      format.html { redirect_to @tip }
      format.js { render :partial => @tip }
    end
  end
  
  def edit
    @tip = Tip.find params[:id]
    redirect_to @tip unless current_user == @tip.user
  end
  
  def update
    @tip = Tip.find params[:id]
    @tip.update_attributes params[:tip]
    redirect_to @tip
  end
  
  def destroy
    @tip = Tip.find params[:id]
    @tip.destroy
    redirect_to tips_path
  end
end