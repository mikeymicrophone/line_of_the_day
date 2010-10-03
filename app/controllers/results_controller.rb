class ResultsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  def index
    @results = Result.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @results }
    end
  end

  def show
    @result = Result.find params[:id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @result }
      format.js { render :partial => @result }
    end
  end

  def new
    @result = Result.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @result }
    end
  end

  def edit
    @result = Result.find(params[:id])
  end

  def create
    params[:result][:user] = current_user
    @result = Result.new params[:result]

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result }
        format.xml  { render :xml => @result, :status => :created, :location => @result }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @result.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @result = Result.find params[:id]

    respond_to do |format|
      if @result.update_attributes params[:result]
        format.html { redirect_to @result }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @result.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @result = Result.find params[:id]
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url }
      format.xml  { head :ok }
    end
  end
end
