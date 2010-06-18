class CommentsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  def index
    @comments = if params[:membership_id]
      (@membership = Membership.find(params[:membership_id])).shared_thoughts
    elsif params[:line_id]
      (@line = Line.find(params[:line_id])).comments
    else
      Comment.all
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @comments }
    end
  end

  def show
    @comment = Comment.find params[:id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @comment }
    end
  end

  def new
    @comment = Comment.new :line_id => params[:line_id]

    @lines = current_user.visible_lines.map { |l| [l.phrasing[0..100], l.id]}

    respond_to do |format|
      format.html
      format.xml  { render :xml => @comment }
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def create
    params[:comment][:user_id] = current_user.id
    @comment = Comment.new params[:comment]

    respond_to do |format|
      if @comment.save
        format.html { render :partial => @comment }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { if request.xhr?
                        render :nothing => true
                      else
                        @lines = current_user.visible_lines.map { |l| [l.phrasing[0..100], l.id]}
                        render :action => :new
                      end }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.xml  { head :ok }
    end
  end
end
