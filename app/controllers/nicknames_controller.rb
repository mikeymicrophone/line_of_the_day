class NicknamesController < ApplicationController
  def index
    @nicknames = if params[:user_id]
      User.find(params[:user_id]).nicknames.randomized
    else
      Nickname.randomized
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @nickname = Nickname.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @nickname }
    end
  end
  
  def new
    @nickname = Nickname.new params[:nickname]
  end
  
  def create
    params[:nickname][:user] = current_user
    @nickname = Nickname.create params[:nickname]
    respond_to do |format|
      format.html { redirect_to @nickname }
      format.js   { render :partial => 'nicknames/nickname', :object => @nickname, :content_type => :html }
    end
  end
  
  def edit
    @nickname = Nickname.find params[:id]
    redirect_to @nickname unless @nickname.user == current_user
  end
  
  def update
    @nickname = Nickname.find params[:id]
    @nickname.update_attributes params[:nickname]
    redirect_to @nickname
  end
  
  def destroy
    @nickname = Nickname.find params[:id]
    @nickname.destroy
    redirect_to nicknames_path
  end
end