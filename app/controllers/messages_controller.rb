class MessagesController < ApplicationController
  def index
    @messages = Message.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @messages }
    end
  end

  def show
    @message = Message.find params[:id]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @message }
      format.js { render :partial => @message }
    end
  end

  def new
    @message = Message.new params[:message]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @message }
    end
  end

  def edit
    @message = Message.find params[:id]
  end

  def create
    params[:message][:user] = current_user
    @message = Message.new params[:message]

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @message = Message.find params[:id]

    respond_to do |format|
      if @message.update_attributes params[:message]
        format.html { redirect_to @message }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find params[:id]
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.xml  { head :ok }
    end
  end
end
