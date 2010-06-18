class TipsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  
  def index
    @tips = if params[:user_id]
      if params[:sort] == 'rating'
        User.find(params[:user_id]).tips.sort_by(&:average_rating).reverse
      else
        User.find(params[:user_id]).tips
      end
    else
      if params[:sort] == 'rating'
        Tip.all.sort_by(&:average_rating).reverse
      else
        Tip
      end
    end.paginate :page => params[:page]
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
      format.html { render :text => 'tag created' }
      format.js { render :partial => @tip, :content_type => :html }
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