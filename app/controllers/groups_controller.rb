class GroupsController < ApplicationController
  auto_complete_for :user, :username
  skip_before_filter :verify_authenticity_token, :only => :auto_complete_for_user_username
  before_filter :require_user, :except => [:index, :show]
  def index
    @grouping = Group.open_for_application
    @groups = if params[:user_id]
      User.find(params[:user_id]).cliques
    else
      Group.all
    end.paginate :page => params[:page], :per_page => params[:per_page]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @groups }
      format.js { render :layout => false }
    end
  end

  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @group }
    end
  end

  def new
    @group = Group.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @group }
    end
  end

  def edit
    @group = Group.find params[:id]
  end

  def create
    params[:group][:user] = current_user
    @group = Group.new params[:group]

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
        format.js   { render :partial => @group }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
        format.js   { render :nothing => true }
      end
    end
  end

  def update
    @group = Group.find params[:id]

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def avatar
    @group = Group.find params[:id]
    @avatars = Dir.entries(RAILS_ROOT + '/public/images/avatars').select { |a| a =~ /\.png/}.map { |a| "/images/avatars/#{a}" }
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.xml  { head :ok }
    end
  end
end
