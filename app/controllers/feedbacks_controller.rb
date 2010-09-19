class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new params[:feedback]
  end
  
  def create
    params[:feedback][:user] = current_user
    @feedback = Feedback.create params[:feedback]
    render :text => 'Thank you for taking the time to share that with us!', :layout => true
  end
  
  def index
    if current_user.andand.admin?
      @feedbacks = Feedback.paginate :page => params[:page]
    else
      @feedbacks = []
    end
  end
end