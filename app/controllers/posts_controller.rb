class PostsController < ApplicationController
  def index
    @posts = if params[:blog_id]
      if params[:sort] == 'rating'
        Blog.find(params[:blog_id]).posts.rated
      else
        Blog.find(params[:blog_id]).posts
      end
    else
      if params[:sort] == 'rating'
        Post.rated
      else
        Post
      end
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @post = Post.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @post }
    end
  end
  
  def new
    @post = Post.new params[:post]
  end
  
  def create
    @post = Post.create params[:post]
    redirect_to @post
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def update
    @post = Post.find params[:id]
    @post.update_attributes params[:post]
    redirect_to @post
  end
  
  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end
end

