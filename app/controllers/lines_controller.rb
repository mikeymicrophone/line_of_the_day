class LinesController < ApplicationController
  # GET /lines
  # GET /lines.xml
  def index
    @lines = Line.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lines }
    end
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
