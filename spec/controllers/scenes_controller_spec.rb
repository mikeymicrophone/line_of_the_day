require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScenesController do

  def mock_scene(stubs={})
    @mock_scene ||= mock_model(Scene, stubs)
  end
  
  describe "GET index" do
    it "assigns all scenes as @scenes" do
      Scene.should_receive(:find).with(:all).and_return([mock_scene])
      get :index
      assigns[:scenes].should == [mock_scene]
    end
  end

  describe "GET show" do
    it "assigns the requested scene as @scene" do
      Scene.should_receive(:find).with("37").and_return(mock_scene)
      get :show, :id => "37"
      assigns[:scene].should equal(mock_scene)
    end
  end

  describe "GET new" do
    it "assigns a new scene as @scene" do
      Scene.should_receive(:new).and_return(mock_scene)
      get :new
      assigns[:scene].should equal(mock_scene)
    end
  end

  describe "GET edit" do
    it "assigns the requested scene as @scene" do
      Scene.should_receive(:find).with("37").and_return(mock_scene)
      get :edit, :id => "37"
      assigns[:scene].should equal(mock_scene)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created scene as @scene" do
        Scene.should_receive(:new).with({'these' => 'params'}).and_return(mock_scene(:save => true))
        post :create, :scene => {:these => 'params'}
        assigns[:scene].should equal(mock_scene)
      end

      it "redirects to the created scene" do
        Scene.stub!(:new).and_return(mock_scene(:save => true))
        post :create, :scene => {}
        response.should redirect_to(scene_url(mock_scene))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved scene as @scene" do
        Scene.stub!(:new).with({'these' => 'params'}).and_return(mock_scene(:save => false))
        post :create, :scene => {:these => 'params'}
        assigns[:scene].should equal(mock_scene)
      end

      it "re-renders the 'new' template" do
        Scene.stub!(:new).and_return(mock_scene(:save => false))
        post :create, :scene => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT udpate" do
    
    describe "with valid params" do
      it "updates the requested scene" do
        Scene.should_receive(:find).with("37").and_return(mock_scene)
        mock_scene.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scene => {:these => 'params'}
      end

      it "assigns the requested scene as @scene" do
        Scene.stub!(:find).and_return(mock_scene(:update_attributes => true))
        put :update, :id => "1"
        assigns[:scene].should equal(mock_scene)
      end

      it "redirects to the scene" do
        Scene.stub!(:find).and_return(mock_scene(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(scene_url(mock_scene))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested scene" do
        Scene.should_receive(:find).with("37").and_return(mock_scene)
        mock_scene.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scene => {:these => 'params'}
      end

      it "assigns the scene as @scene" do
        Scene.stub!(:find).and_return(mock_scene(:update_attributes => false))
        put :update, :id => "1"
        assigns[:scene].should equal(mock_scene)
      end

      it "re-renders the 'edit' template" do
        Scene.stub!(:find).and_return(mock_scene(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested scene" do
      Scene.should_receive(:find).with("37").and_return(mock_scene)
      mock_scene.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the scenes list" do
      Scene.stub!(:find).and_return(mock_scene(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(scenes_url)
    end
  end

end
