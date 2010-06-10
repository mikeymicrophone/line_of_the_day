require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinesController do
  include Authlogic::TestCase
  
  describe 'not logged in' do
    describe 'index' do
      it 'should display public lines' do
        controller.integrate_views!
        Line.make :public
        get 'index'
        controller.response.body.should =~ /#{Line.first.phrasing}/
      end
      
      it 'should display a Register link' do
        controller.integrate_views!
        get 'index'
        controller.response.body.should =~ /<a href="\/users\/new">Register!<\/a>/
      end
    end
    
    describe 'show' do
      it 'should display a public line' do
        @line = Line.make :public
        get 'show', :id => @line.id
        controller.should render_template('show')
      end
      
      it 'should not display a non-public line' do
        @line = Line.make
        get 'show', :id => @line.id
        controller.should redirect_to(lines_path)
      end
      
      it 'should not display comment form' do
        controller.integrate_views!
        get 'show', :id => Line.make(:public).id
        controller.response.body.should_not =~ /form action="\/comments"/
      end
    end
  end
  
  describe 'logged in' do
    before do
      activate_authlogic
      @u = User.make
      UserSession.create @u
    end
    
    describe 'index' do
      it 'should display public lines' do
        controller.integrate_views!
        Line.make :public
        get 'index'
        controller.response.body.should =~ /#{Line.first.phrasing}/        
      end
      
      it 'should display my private lines' do
        controller.integrate_views!
        Line.make :user => @u
        get 'index'
        controller.response.body.should =~ /#{Line.first.phrasing}/
      end
      
      it 'should display lines published to a group I am in' do
        controller.integrate_views!
        @l = Line.make
        @g = Group.make
        Membership.make :group => @g, :user => @u
        Publication.make :group => @g, :line => @l
        get 'index'
        controller.response.body.should =~ /#{Line.first.phrasing}/
      end
    end
    
    describe 'show' do
      it 'should show the comment form' do
        controller.integrate_views!
        get 'show', :id => Line.make(:public).id
        controller.response.body.should =~ /form action="\/comments"/        
      end
    end
  end
end
