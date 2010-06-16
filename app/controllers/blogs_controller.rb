class BlogsController < ApplicationController
  def fetch
    @blog = Blog.find params[:id]
    @blog.fetch_posts
    redirect_to blog_posts_path(@blog)
  end
  
  def index
    @blogs = Blog.paginate :page => params[:page]
  end
  
  def show
    @blog = Blog.find params[:id]
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
  
  def destroy
    @blog = Blog.find params[:id]
    @blog.destroy
    redirect_to blogs_path
  end
end