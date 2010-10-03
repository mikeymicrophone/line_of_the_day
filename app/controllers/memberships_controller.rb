class MembershipsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]

  def index
    @memberships = Membership.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @memberships }
    end
  end

  def show
    @membership = Membership.find params[:id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @membership }
      format.js { render :partial => @membership }
    end
  end

  def new
    @membership = Membership.new params[:membership]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @membership }
    end
  end

  def edit
    @membership = Membership.find params[:id]
  end

  def create
    params[:membership][:user] = User.find_by_username(params[:user][:username]) if params[:user]
    params[:membership][:user] ||= current_user
    @membership = Membership.new params[:membership]

    respond_to do |format|
      if @membership.save
        @membership.group.initiate @membership
        format.html { render :text => 'fresh.' }
        format.xml  { render :xml => @membership, :status => :created, :location => @membership }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @membership = Membership.find params[:id]

    respond_to do |format|
      if @membership.update_attributes params[:membership]
        format.html { redirect_to @membership }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership = Membership.find params[:id]
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to memberships_url }
      format.xml  { head :ok }
    end
  end
end
