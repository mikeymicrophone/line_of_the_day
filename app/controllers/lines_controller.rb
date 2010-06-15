class LinesController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]

  def index
    @published_lines = User.find(params[:user_id]).publications.to_group(params[:group_id]).map &:line if params[:user_id] and params[:group_id]
    
    @public_lines = if current_user
      Line.public_to(current_user).paginate(:page => params[:page])
    else
      Line.public.paginate(:page => params[:page])
    end
    @shared_lines = current_user.joined_groups.map { |g| g.lines }.flatten.select { |l| l.user_id != current_user.id }.sort_by { |l| l.created_at } if current_user

    if params[:sort].present?
      @public_lines = @public_lines.sort_by { |l| l.average_rating }.reverse.paginate(:page => params[:page])
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @public_lines }
    end
  end
  
  def mine
    @lines = current_user.andand.lines
    render :action => :index
  end

  def show
    @line = Line.find(params[:id])
    
    if current_user
      redirect_to lines_path unless @line.is_visible_to?(current_user)
    else
      redirect_to lines_path unless @line.public?
    end
    
    # respond_to do |format|
    #   format.html
    #   format.xml  { render :xml => @line }
    # end
  end

  def new
    @line = Line.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @line }
    end
  end

  def edit
    @line = Line.find params[:id]
    redirect_to @line unless current_user == @line.user
  end

  def create
    params[:line][:user_id] = current_user.andand.id
    params[:line][:public] = true unless current_user
    @line = Line.new params[:line]

    respond_to do |format|
      if @line.save
        format.js   { render :partial => 'lines/line', :object => @line, :content_type => :html }
        format.html { redirect_to @line }
        format.xml  { render :xml => @line, :status => :created, :location => @line }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @line = Line.find(params[:id])

    respond_to do |format|
      if @line.update_attributes(params[:line])
        format.html { redirect_to @line }
        format.xml  { head :ok }
        format.js   { render :partial => 'publicize_link', :locals => {:line => @line} }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy

    respond_to do |format|
      format.html { redirect_to lines_url }
      format.xml  { head :ok }
    end
  end
end
