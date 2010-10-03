class BooksController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @books = if params[:sort] == 'recent'
      Book.recent
    elsif params[:sort] = 'rating'
      Book.all.sort_by { |l| l.average_rating }.reverse
    else
      Book.randomized
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @book = Book.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @book }
    end
  end
  
  def new
    @book = Book.new params[:book]
  end
  
  def create
    params[:book][:user] = current_user
    @book = Book.create params[:book]
    render :partial => @book
  end
end