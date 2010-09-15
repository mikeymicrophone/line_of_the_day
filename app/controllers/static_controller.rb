class StaticController < ApplicationController
  def triad
    render :layout => false
  end
  
  def about
		render :template => 'shared/about'
  end
  
  def terms
    respond_to do |format|
      format.js { render :template => 'shared/terms', :layout => false }
      format.html { render :template => 'shared/terms'}
    end
  end
  
  def faq
    render :template => 'shared/faq'
  end
end