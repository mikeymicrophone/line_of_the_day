class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find params[:id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new params[:user]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = @current_user
  end

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def create
    if verify_recaptcha
      @user = User.new(params[:user])
    end
    if @user.save
      flash[:notice] = 'Account registered! no way man! cool!'
      redirect_back_or_default lines_path
    else
      render :action => :new
    end
  end
  
  def avatar
    @avatars = Dir.entries(RAILS_ROOT + '/public/images/avatars').select { |a| a =~ /\.png/}.map { |a| "/images/avatars/#{a}" }
  end

  def update
    @user = @current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'we got it updated.'
        format.html { redirect_to @user }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.xml  { head :ok }
    end
  end
  
  def identify # for iphone users
    @user = User.find_by_username params[:username]
    render :text => @user.id
  end
end
