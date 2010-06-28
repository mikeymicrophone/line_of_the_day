class ArticlesController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @articles = Article.paginate :page => params[:page]
  end
  
  def show
    @article = Article.find params[:id]
  end
  
  def new
    @article = Article.new params[:article]
  end
  
  def create
    params[:article][:user] = current_user
    @article = Article.create params[:article]
    redirect_to articles_path
  end
end