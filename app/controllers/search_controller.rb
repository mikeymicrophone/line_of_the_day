class SearchController < ApplicationController
  def index
    query = "%#{params[:query]}%"
    @lines = Line.find :all, :conditions => ["phrasing like ?", query]
    @tips = Tip.find :all, :conditions => ["advice like ?", query]
    @exercises = Exercise.find :all, :conditions => ["moniker like ? or instruction like ?", query, query]
    @stories = Story.find :all, :conditions => ["name like ? or telling like ?", query, query]
    @posts = Post.find :all, :conditions => ["name like ? or content like ?", query, query]
    @questions = Question.find :all, :conditions => ["name like ?", query]
    @articles = Article.find :all, :conditions => ["title like ? or source like ?", query, query]
    @quotes = Quote.find :all, :conditions => ["text like ?", query]
    @concepts = Concept.find :all, :conditions => ["name like ?", query]
  end
end