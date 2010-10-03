class LinesController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  skip_before_filter :verify_authenticity_token
  include ExposedContent
  
  def random
    @line = Line.random
    @tip = Tip.random
  end

  def index
    @published_lines = User.find(params[:user_id]).publications.to_group(params[:group_id]).map &:line if params[:user_id] and params[:group_id]
    
    params[:sort] ||= 'random'
    
    @public_lines = if current_user
      @lines = Line.public_to(current_user)
      if params[:sort] == 'rating'
        @lines.sort_by { |l| l.average_rating }.reverse
      elsif params[:sort] == 'recent'
        @lines.recent
      else
        @lines.sort_by { |l| rand }
      end
    else
      @lines = Line.public
      if params[:sort] == 'rating'
        @lines.sort_by { |l| l.average_rating }.reverse
      elsif params[:sort] == 'recent'
        @lines.recent
      else
        @lines.sort_by { |l| rand }
      end      
    end.paginate(:page => params[:page], :per_page => params[:per_page])
    
    @shared_lines = current_user.joined_groups.map { |g| g.lines }.flatten.select { |l| l.user_id != current_user.id }.sort_by { |l| l.created_at } if current_user

    respond_to do |format|
      format.html
      format.xml  { render :xml => @public_lines }
      format.js { render :layout => false }
    end
  end
    
  def mine
    @public_lines = current_user.andand.lines.paginate(:page => params[:page])
    render :action => :index
  end

  def show
    @line = Line.find(params[:id])
    
    if current_user
      redirect_to lines_path unless @line.is_visible_to?(current_user)
    else
      redirect_to lines_path unless @line.public?
      respond_to do |format|
        format.html
        format.xml { render :xml => (@line.to_xml :include => [:comments, :ratings, :tags]) }
        format.js { render :partial => @line }
      end
    end
    
    respond_to do |format|
      format.html
      format.js { render :partial => @line }
    end
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
    params[:line] ||= {}
    params[:line][:phrasing] ||= params[:phrasing]
    params[:line][:user] = current_user
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
    @line = Line.find params[:id]

    respond_to do |format|
      if @line.update_attributes params[:line]
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
    @line = Line.find params[:id]
    @line.destroy

    respond_to do |format|
      format.html { redirect_to lines_url }
      format.xml  { head :ok }
    end
  end
end
