require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApproachesController do
  include Authlogic::TestCase
  before do
    UserSession.create User.make
  end
  
  describe 'create' do
    it 'should find a line by phrasing' do
      @l = Line.make
      post 'create', :approach => Approach.plan, :line => {:phrasing => @l.phrasing}
      controller.instance_variable_get('@line').should == @l
    end
    
    it 'should find a scene by name'
    
    it 'should find a result by description'
  end
end
