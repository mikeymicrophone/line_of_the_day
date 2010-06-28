class BooksController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  def index
    @books = Book.paginate :page => params[:page]
  end
  
  def show
    @book = Book.find params[:id]
  end
  
  def new
    @book = Book.new params[:book]
  end
  
  def create
    params[:book][:user] = current_user
    @book = Book.create params[:book]
    redirect_to books_path
  end
end