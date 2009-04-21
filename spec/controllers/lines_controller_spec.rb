require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinesController do

  def mock_line(stubs={})
    @mock_line ||= mock_model(Line, stubs)
  end
  
  describe "GET index" do
    it "assigns all lines as @lines" do
      Line.should_receive(:find).with(:all).and_return([mock_line])
      get :index
      assigns[:lines].should == [mock_line]
    end
  end

  describe "GET show" do
    it "assigns the requested line as @line" do
      Line.should_receive(:find).with("37").and_return(mock_line)
      get :show, :id => "37"
      assigns[:line].should equal(mock_line)
    end
  end

  describe "GET new" do
    it "assigns a new line as @line" do
      Line.should_receive(:new).and_return(mock_line)
      get :new
      assigns[:line].should equal(mock_line)
    end
  end

  describe "GET edit" do
    it "assigns the requested line as @line" do
      Line.should_receive(:find).with("37").and_return(mock_line)
      get :edit, :id => "37"
      assigns[:line].should equal(mock_line)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created line as @line" do
        Line.should_receive(:new).with({'these' => 'params'}).and_return(mock_line(:save => true))
        post :create, :line => {:these => 'params'}
        assigns[:line].should equal(mock_line)
      end

      it "redirects to the created line" do
        Line.stub!(:new).and_return(mock_line(:save => true))
        post :create, :line => {}
        response.should redirect_to(line_url(mock_line))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved line as @line" do
        Line.stub!(:new).with({'these' => 'params'}).and_return(mock_line(:save => false))
        post :create, :line => {:these => 'params'}
        assigns[:line].should equal(mock_line)
      end

      it "re-renders the 'new' template" do
        Line.stub!(:new).and_return(mock_line(:save => false))
        post :create, :line => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested line" do
        Line.should_receive(:find).with("37").and_return(mock_line)
        mock_line.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :line => {:these => 'params'}
      end

      it "assigns the requested line as @line" do
        Line.stub!(:find).and_return(mock_line(:update_attributes => true))
        put :update, :id => "1"
        assigns[:line].should equal(mock_line)
      end

      it "redirects to the line" do
        Line.stub!(:find).and_return(mock_line(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(line_url(mock_line))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested line" do
        Line.should_receive(:find).with("37").and_return(mock_line)
        mock_line.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :line => {:these => 'params'}
      end

      it "assigns the line as @line" do
        Line.stub!(:find).and_return(mock_line(:update_attributes => false))
        put :update, :id => "1"
        assigns[:line].should equal(mock_line)
      end

      it "re-renders the 'edit' template" do
        Line.stub!(:find).and_return(mock_line(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested line" do
      Line.should_receive(:find).with("37").and_return(mock_line)
      mock_line.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the lines list" do
      Line.stub!(:find).and_return(mock_line(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(lines_url)
    end
  end

end
