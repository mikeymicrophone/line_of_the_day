class PublicationsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  def index
    @publications = Publication.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @publications }
    end
  end

  def show
    @publication = Publication.find params[:id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @publication }
    end
  end

  def new
    @publication = Publication.new :line_id => params[:line_id]

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @publication }
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def create
    @publications = []
    params[:publication][:user] = current_user
    params[:publication][:group_id].each { |g| @publications << Publication.create(params[:publication].merge(:group_id => g)) }

    respond_to do |format|
      if !@publications.empty?
        format.html { render :partial => 'shared/close_box' }
        format.xml  { render :xml => @publications, :status => :created, :location => @publications }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @publication = Publication.find params[:id]

    respond_to do |format|
      if @publication.update_attributes params[:publication]
        flash[:notice] = 'Publication was successfully updated.'
        format.html { redirect_to @publication }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication = Publication.find params[:id]
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_url }
      format.xml  { head :ok }
    end
  end
end
