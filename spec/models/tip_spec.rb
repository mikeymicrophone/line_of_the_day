require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tip do
  describe 'sorting' do
    before do
      @low_rated_tip = Tip.make :advice => 'wear hats every day'
      @high_rated_tip = Tip.make :advice => 'be friendly'
    
      @low_rated_tip.ratings.create :opinion => 10
      @low_rated_tip.ratings.create :opinion => 12
      @high_rated_tip.ratings.create :opinion => 40
      @high_rated_tip.ratings.create :opinion => 42
    end
  
    it 'should sort by rating' do
      @tips = Tip.rated
      @tips.first.id.should == @high_rated_tip.id
    end
  end
  
  describe 'scoping' do
    before do
      
    end
    
    it 'should scope to user' do
      
    end
  end
end