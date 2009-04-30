require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApproachesController do

  def mock_approach(stubs={})
    @mock_approach ||= mock_model(Approach, stubs)
  end
  
  describe "GET index" do
    it "assigns all approaches as @approaches" do
      Approach.should_receive(:find).with(:all).and_return([mock_approach])
      get :index
      assigns[:approaches].should == [mock_approach]
    end
  end

  describe "GET show" do
    it "assigns the requested approach as @approach" do
      Approach.should_receive(:find).with("37").and_return(mock_approach)
      get :show, :id => "37"
      assigns[:approach].should equal(mock_approach)
    end
  end

  describe "GET new" do
    it "assigns a new approach as @approach" do
      Approach.should_receive(:new).and_return(mock_approach)
      get :new
      assigns[:approach].should equal(mock_approach)
    end
  end

  describe "GET edit" do
    it "assigns the requested approach as @approach" do
      Approach.should_receive(:find).with("37").and_return(mock_approach)
      get :edit, :id => "37"
      assigns[:approach].should equal(mock_approach)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created approach as @approach" do
        Approach.should_receive(:new).with({'these' => 'params'}).and_return(mock_approach(:save => true))
        post :create, :approach => {:these => 'params'}
        assigns[:approach].should equal(mock_approach)
      end

      it "redirects to the created approach" do
        Approach.stub!(:new).and_return(mock_approach(:save => true))
        post :create, :approach => {}
        response.should redirect_to(approach_url(mock_approach))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved approach as @approach" do
        Approach.stub!(:new).with({'these' => 'params'}).and_return(mock_approach(:save => false))
        post :create, :approach => {:these => 'params'}
        assigns[:approach].should equal(mock_approach)
      end

      it "re-renders the 'new' template" do
        Approach.stub!(:new).and_return(mock_approach(:save => false))
        post :create, :approach => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested approach" do
        Approach.should_receive(:find).with("37").and_return(mock_approach)
        mock_approach.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :approach => {:these => 'params'}
      end

      it "assigns the requested approach as @approach" do
        Approach.stub!(:find).and_return(mock_approach(:update_attributes => true))
        put :update, :id => "1"
        assigns[:approach].should equal(mock_approach)
      end

      it "redirects to the approach" do
        Approach.stub!(:find).and_return(mock_approach(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(approach_url(mock_approach))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested approach" do
        Approach.should_receive(:find).with("37").and_return(mock_approach)
        mock_approach.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :approach => {:these => 'params'}
      end

      it "assigns the approach as @approach" do
        Approach.stub!(:find).and_return(mock_approach(:update_attributes => false))
        put :update, :id => "1"
        assigns[:approach].should equal(mock_approach)
      end

      it "re-renders the 'edit' template" do
        Approach.stub!(:find).and_return(mock_approach(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested approach" do
      Approach.should_receive(:find).with("37").and_return(mock_approach)
      mock_approach.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the approaches list" do
      Approach.stub!(:find).and_return(mock_approach(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(approaches_url)
    end
  end

end
