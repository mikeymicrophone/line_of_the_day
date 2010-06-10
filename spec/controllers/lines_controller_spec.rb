require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinesController do
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
    end
  end
  
  describe 'logged in' do
    
  end
end
