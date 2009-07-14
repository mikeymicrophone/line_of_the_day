class ApproachesController < ApplicationController
  auto_complete_for :line, :phrasing
  auto_complete_for :scene, :name
  auto_complete_for :result, :name
  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_line_phrasing, :auto_complete_for_scene_name, :auto_complete_for_result_name]
  before_filter :require_user
  # GET /approaches
  # GET /approaches.xml
  def index
    if @line = Line.find_by_id(params[:line_id])
      @approaches = @line.approaches
    else
      @approaches = Approach.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @approaches }
    end
  end

  # GET /approaches/1
  # GET /approaches/1.xml
  def show
    @approach = Approach.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @approach }
    end
  end

  # GET /approaches/new
  # GET /approaches/new.xml
  def new
    @approach = Approach.new :line_id => params[:line_id], :scene_id => params[:scene_id], :result_id => params[:result_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @approach }
    end
  end

  # GET /approaches/1/edit
  def edit
    @approach = Approach.find(params[:id])
  end

  # POST /approaches
  # POST /approaches.xml
  def create
    params[:approach][:user] = current_user
    @approach = Approach.new(params[:approach])
    @approach.line ||= Line.find_or_create_by_phrasing(params[:line][:phrasing], :user => current_user)
    @approach.scene ||= Scene.find_or_create_by_name(params[:scene][:name], :user => current_user)
    @approach.result ||= Result.find_or_create_by_name(params[:result][:name], :user => current_user)

    respond_to do |format|
      if @approach.save
        flash[:notice] = 'Approach was successfully created.'
        format.html { redirect_to(@approach) }
        format.xml  { render :xml => @approach, :status => :created, :location => @approach }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @approach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /approaches/1
  # PUT /approaches/1.xml
  def update
    @approach = Approach.find(params[:id])

    respond_to do |format|
      if @approach.update_attributes(params[:approach])
        flash[:notice] = 'Approach was successfully updated.'
        format.html { redirect_to(@approach) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @approach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /approaches/1
  # DELETE /approaches/1.xml
  def destroy
    @approach = Approach.find(params[:id])
    @approach.destroy

    respond_to do |format|
      format.html { redirect_to(approaches_url) }
      format.xml  { head :ok }
    end
  end
end
