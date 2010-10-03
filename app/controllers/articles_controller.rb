class ArticlesController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @articles = Article.randomized.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @article = Article.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @article }
    end
  end
  
  def new
    @article = Article.new params[:article]
  end
  
  def create
    params[:article][:user] = current_user
    @article = Article.create params[:article]
    render :partial => @article
  end
end