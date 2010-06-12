class StaticController < ApplicationController
  def about
		render :template => 'shared/about'
  end
end