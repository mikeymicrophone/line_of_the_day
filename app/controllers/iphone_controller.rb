class IphoneController < ApplicationController
  def initial
    @lines = Line.all(:limit => 3, :order => Line.db_random)
    @tips = Tip.all(:limit => 3, :order => Tip.db_random)
    @exercises = Exercise.all(:limit => 3, :order => Exercise.db_random)
    @goals = GoalOwnership.all(:limit => 3, :order => Tip.db_random)
    render :xml => {:lines => @lines, :tips => @tips, :exercises => @exercises, :goals => @goals}
  end
end