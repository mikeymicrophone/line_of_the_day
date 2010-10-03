class BlogsController < ApplicationController
  def fetch
    @blog = Blog.find params[:id]
    @blog.fetch_posts
    redirect_to blog_posts_path(@blog)
  end
  
  def index
    @blogs = if params[:sort] == 'rating'
      Blog.all.sort_by { |b| b.average_rating }.reverse
    elsif params[:sort] == 'recent'
      Blog.all.sort_by { |b| b.recent_update }.reverse
    else
      Blog.randomized
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @blog = Blog.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @blog }
    end
  end
  
  def new
    @blog = Blog.new params[:blog]
  end
  
  def create
    params[:blog][:user] = current_user
    @blog = Blog.create params[:blog]
    redirect_to @blog
  end
  
  def edit
    @blog = Blog.find params[:id]
  end
  
  def update
    @blog = Blog.find params[:id]
    @blog.update_attributes params[:blog]
    redirect_to @blog
  end
  
  def fetch_all
    Blog.all.each do |b|
      b.fetch_posts
    end
    redirect_to blogs_path
  end
  
  def destroy
    @blog = Blog.find params[:id]
    @blog.destroy
    redirect_to blogs_path
  end
end