class QuestionsController < ApplicationController
  def index
    @questions = Question.randomized.paginate :page => params[:page], :per_page => params[:per_page]

    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end
  
  def show
    @question = Question.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @question }
    end
  end
  
  def new
    @question = Question.new params[:question]
  end
  
  def create
    params[:question][:user] = current_user
    @question = Question.create params[:question]
    respond_to do |format|
      format.js { render :partial => 'questions/question', :object => @question, :content_type => :html }
      format.html { render :action => 'show' }
    end
  end
  
  def edit
    @question = Question.find params[:id]
  end
  
  def update
    @question = Question.find params[:id]
    @question.update_attributes params[:question]
    render :action => 'show'
  end
  
  def destroy
    @question = Question.find params[:id]
    @question.destroy
    redirect_to questions_path
  end
end