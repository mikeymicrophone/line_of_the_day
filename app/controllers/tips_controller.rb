class TipsController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  skip_before_filter :verify_authenticity_token
  include ExposedContent
  
  def index
    @tips = if params[:user_id]
      User.find(params[:user_id]).tips.sorted params[:sort]
    else
      Tip.sorted params[:sort]
    end.paginate :page => params[:page], :per_page => params[:per_page]
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @tips }
      format.js { render :layout => false }
    end
  end
  
  def show
    @tip = Tip.find params[:id]
    
    respond_to do |format|
      format.html
      format.js { render :partial => @tip}
    end
  end
  
  def new
    @tip = Tip.new params[:tip]
  end
  
  def create
    params[:tip] ||= {}
    params[:tip][:advice] ||= params[:advice]
    params[:tip][:user] = current_user unless request.format == Mime::XML
    @tip = Tip.create params[:tip]
    respond_to do |format|
      format.html { render :text => 'tip created' }
      format.js { render :partial => 'tips/tip', :object => @tip, :content_type => :html }
      format.xml { render :xml => @tip, :status => :created, :location => @tip }
    end
  end
  
  def edit
    @tip = Tip.find params[:id]
    redirect_to @tip unless current_user == @tip.user
  end
  
  def update
    @tip = Tip.find params[:id]
    @tip.update_attributes params[:tip]
    redirect_to @tip
  end
  
  def destroy
    @tip = Tip.find params[:id]
    @tip.destroy
    redirect_to tips_path
  end
end