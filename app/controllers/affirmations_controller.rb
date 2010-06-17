class AffirmationsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  def index
    @affirmations = if params[:user_id]
      User.find(params[:user_id]).affirmations
    else
      Affirmation
    end.paginate :page => params[:page]
  end
  
  def show
    @affirmation = Affirmation.find params[:id]
  end
  
  def new
    @affirmation = Affirmation.new params[:affirmation]
  end
  
  def create
    params[:affirmation][:user] = current_user
    @affirmation = Affirmation.create params[:affirmation]
    respond_to do |format|
      format.html { redirect_to @affirmation }
      format.js   { render :partial => @affirmation, :content_type => :html }
    end
  end
  
  def edit
    @affirmation = Affirmation.find params[:id]
    redirect_to @affirmation unless current_user == @affirmation.user
  end
  
  def update
    @affirmation = Affirmation.find params[:id]
    @affirmation.update_attributes params[:affirmation]
    redirect_to @affirmation
  end
  
  def destroy
    @affirmation = Affirmation.find params[:id]
    redirect_to affirmations_path
  end
end