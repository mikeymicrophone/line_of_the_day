require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GuidancesController do

  def mock_guidance(stubs={})
    @mock_guidance ||= mock_model(Guidance, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all guidances as @guidances" do
      mock(Guidance).find(:all){[mock_guidance]}
      get :index
      assigns[:guidances].should == [mock_guidance]
    end

    describe "with mime type of xml" do
  
      it "should render all guidances as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        guidances = []
        mock(Guidance).find(:all){guidances}
        mock(guidances).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested guidance as @guidance" do
      mock(Guidance).find("37"){mock_guidance}
      get :show, :id => "37"
      assigns[:guidance].should equal(mock_guidance)
    end
    
    describe "with mime type of xml" do

      it "should render the requested guidance as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Guidance).find("37"){mock_guidance}
        mock(mock_guidance).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new guidance as @guidance" do
      #We need to call new before any mocking
      mock_guidance
      mock(Guidance).new{mock_guidance}
      get :new
      assigns[:guidance].should equal(mock_guidance)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested guidance as @guidance" do
      mock(Guidance).find("37"){mock_guidance}
      get :edit, :id => "37"
      assigns[:guidance].should equal(mock_guidance)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created guidance as @guidance" do
        guidance = mock_guidance(:save => true)
        mock(Guidance).new({'these' => 'params'}){guidance}
        post :create, :guidance => {:these => 'params'}
        assigns(:guidance).should equal(mock_guidance)
      end

      it "should redirect to the created guidance" do
        guidance = mock_guidance(:save => true)
        stub(Guidance).new{guidance}
        post :create, :guidance => {}
        response.should redirect_to(guidance_url(mock_guidance))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved guidance as @guidance" do
        guidance = mock_guidance(:save => false)
        stub(Guidance).new({'these' => 'params'}){guidance}
        post :create, :guidance => {:these => 'params'}
        assigns(:guidance).should equal(mock_guidance)
      end

      it "should re-render the 'new' template" do
        guidance = mock_guidance(:save => false)
        stub(Guidance).new{guidance}
        post :create, :guidance => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested guidance" do
        mock(Guidance).find("37"){mock_guidance}
        mock(mock_guidance).update_attributes({'these' => 'params'})
        put :update, :id => "37", :guidance => {:these => 'params'}
      end

      it "should expose the requested guidance as @guidance" do
        stub(Guidance).find{mock_guidance(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:guidance).should equal(mock_guidance)
      end

      it "should redirect to the guidance" do
        stub(Guidance).find{mock_guidance(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(guidance_url(mock_guidance))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested guidance" do
        mock(Guidance).find("37"){mock_guidance}
        mock(mock_guidance).update_attributes({'these' => 'params'})
        put :update, :id => "37", :guidance => {:these => 'params'}
      end

      it "should expose the guidance as @guidance" do
        stub(Guidance).find{mock_guidance(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:guidance).should equal(mock_guidance)
      end

      it "should re-render the 'edit' template" do
        stub(Guidance).find{mock_guidance(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested guidance" do
      mock(Guidance).find("37"){mock_guidance}
      mock(mock_guidance).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the guidances list" do
      stub(Guidance).find(){mock_guidance(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(guidances_url)
    end

  end

end
