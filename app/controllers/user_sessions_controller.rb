class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def iphone_login
    create
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      respond_to do |format|
        format.html { redirect_back_or_default lines_path }
        format.iphone { render :text => 'login successful' }
      end
    else
      respond_to do |format|
        format.html { render :action => :new }
        format.iphone { render :text => 'login unsuccessful', :status => 401 }
      end
    end
  end
  
  def destroy
    current_user_session.destroy
    redirect_back_or_default root_url
  end
end
