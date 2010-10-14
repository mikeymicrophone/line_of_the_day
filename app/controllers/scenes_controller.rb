class ScenesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]

  def index
    @scenes = Scene.sorted(params[:sort]).paginate :page => params[:page], :per_page => params[:per_page]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @scenes }
      format.js { render :layout => false }
    end
  end

  def show
    @scene = Scene.find params[:id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @scene }
    end
  end

  def new
    @scene = Scene.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @scene }
    end
  end

  def edit
    @scene = Scene.find params[:id]
  end

  def create
    @scene = Scene.new params[:scene]

    respond_to do |format|
      if @scene.save
        format.html { redirect_to @scene }
        format.xml  { render :xml => @scene, :status => :created, :location => @scene }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @scene.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @scene = Scene.find(params[:id])

    respond_to do |format|
      if @scene.update_attributes params[:scene]
        format.html { redirect_to @scene }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @scene.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @scene = Scene.find params[:id]
    @scene.destroy

    respond_to do |format|
      format.html { redirect_to scenes_url }
      format.xml  { head :ok }
    end
  end
end
