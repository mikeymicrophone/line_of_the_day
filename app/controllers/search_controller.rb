class SearchController < ApplicationController
  def index
    @lines = Line.find(:all, :conditions => ["phrasing like ?", "%#{params[:query]}%"])
  end
end