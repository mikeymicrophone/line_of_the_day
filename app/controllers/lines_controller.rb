class LinesController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  # GET /lines
  # GET /lines.xml
  def index
    @published_lines = User.find(params[:user_id]).publications.to_group(params[:group_id]).map &:line if params[:user_id] and params[:group_id]
    
    @public_lines = Line.public.paginate(:page => params[:page])
    @shared_lines = current_user.groups.map { |g| g.lines }.flatten.select { |l| l.user_id != current_user.id }.sort_by { |l| l.created_at } if current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lines }
    end
  end
  
  def mine
    @lines = current_user.andand.lines
    render :action => :index
  end

  # GET /lines/1
  # GET /lines/1.xml
  def show
    @line = Line.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line }
    end
  end

  # GET /lines/new
  # GET /lines/new.xml
  def new
    @line = Line.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line }
    end
  end

  # GET /lines/1/edit
  def edit
    @line = Line.find(params[:id])
  end

  # POST /lines
  # POST /lines.xml
  def create
    params[:line][:user_id] = current_user.andand.id
    params[:line][:public] = true unless current_user
    @line = Line.new(params[:line])

    respond_to do |format|
      if @line.save
        flash[:notice] = 'Line was successfully created.'
        format.html { redirect_to(@line) }
        format.xml  { render :xml => @line, :status => :created, :location => @line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lines/1
  # PUT /lines/1.xml
  def update
    @line = Line.find(params[:id])

    respond_to do |format|
      if @line.update_attributes(params[:line])
        flash[:notice] = 'Line was successfully updated.'
        format.html { redirect_to(@line) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.xml
  def destroy
    @line = Line.find(params[:id])
    @line.destroy

    respond_to do |format|
      format.html { redirect_to(lines_url) }
      format.xml  { head :ok }
    end
  end
end
