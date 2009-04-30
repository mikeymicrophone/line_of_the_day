class MembershipsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  # GET /memberships
  # GET /memberships.xml
  def index
    @memberships = Membership.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.xml
  def show
    @membership = Membership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @membership }
    end
  end

  # GET /memberships/new
  # GET /memberships/new.xml
  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @membership }
    end
  end

  # GET /memberships/1/edit
  def edit
    @membership = Membership.find(params[:id])
  end

  # POST /memberships
  # POST /memberships.xml
  def create
    params[:membership][:user_id] = User.find_by_username(params[:user][:username]).id if params[:user]
    params[:membership][:user_id] ||= current_user.id
    @membership = Membership.new(params[:membership])

    respond_to do |format|
      if @membership.save
        @membership.group.initiate(@membership)
        flash[:notice] = 'Membership was successfully created.'
        format.html { render :text => 'fresh.' }
        format.xml  { render :xml => @membership, :status => :created, :location => @membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.xml
  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        flash[:notice] = 'Membership was successfully updated.'
        format.html { redirect_to(@membership) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.xml
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to(memberships_url) }
      format.xml  { head :ok }
    end
  end
end
