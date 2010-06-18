class GuidancesController < ApplicationController
  def index
    @guidances = if params[:user_id]
      if request.url =~ /coaches/
        User.find(params[:user_id]).guidings
      else
        User.find(params[:user_id]).guidances
      end
    else
      Guidance.all
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @guidances }
    end
  end

  def show
    @guidance = Guidance.find params[:id]
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @guidance }
    end
  end

  def new
    @guidance = Guidance.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @guidance }
    end
  end

  def edit
    @guidance = Guidance.find params[:id]
  end

  def create
    @guidance = Guidance.new params[:guidance]

    respond_to do |format|
      if @guidance.save
        flash[:notice] = 'Coaching requested.'
        format.js   { render :text => flash[:notice] }
        format.html { redirect_to @guidance }
        format.xml  { render :xml => @guidance, :status => :created, :location => @guidance }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @guidance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @guidance = Guidance.find params[:id]

    respond_to do |format|
      if @guidance.update_attributes params[:guidance]
        format.html { redirect_to @guidance }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @guidance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @guidance = Guidance.find params[:id]
    @guidance.destroy

    respond_to do |format|
      format.html { redirect_to guidances_url }
      format.xml  { head :ok }
    end
  end
end
