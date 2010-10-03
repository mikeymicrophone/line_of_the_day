class ApproachesController < ApplicationController
  auto_complete_for :line, :phrasing
  auto_complete_for :scene, :name
  auto_complete_for :result, :name
  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_line_phrasing, :auto_complete_for_scene_name, :auto_complete_for_result_name]
  before_filter :require_user

  def index
    @approaches = if @line = Line.find_by_id(params[:line_id])
      @line.approaches
    elsif params[:scene_id]
      Scene.find(params[:scene_id]).approaches
    elsif params[:result_id]
      Result.find(params[:result_id]).approaches
    else
      Approach.all
    end.paginate :page => params[:page], :per_page => params[:per_page]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @approaches }
      format.js { render :layout => false }
    end
  end

  def show
    @approach = Approach.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @approach }
      format.js { render :partial => @approach }
    end
  end

  def new
    @approach = Approach.new :line_id => params[:line_id], :scene_id => params[:scene_id], :result_id => params[:result_id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @approach }
    end
  end

  def edit
    @approach = Approach.find params[:id]
    redirect_to @approach unless current_user == @approach.user
  end

  def create
    params[:approach][:user] = current_user
    @approach = Approach.new(params[:approach])
    @approach.line ||= Line.find_or_create_by_phrasing(params[:line][:phrasing], :user => current_user)
    @approach.scene ||= Scene.find_or_create_by_name(params[:scene][:name], :user => current_user)
    @approach.result ||= Result.find_or_create_by_name(params[:result][:name], :user => current_user)

    respond_to do |format|
      if @approach.save
        format.html { redirect_to @approach }
        format.xml  { render :xml => @approach, :status => :created, :location => @approach }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @approach.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @approach = Approach.find(params[:id])

    respond_to do |format|
      if @approach.update_attributes(params[:approach])
        format.html { redirect_to @approach }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @approach.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @approach = Approach.find(params[:id])
    @approach.destroy

    respond_to do |format|
      format.html { redirect_to approaches_url }
      format.xml  { head :ok }
    end
  end
end
