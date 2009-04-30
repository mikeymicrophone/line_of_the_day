require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScenesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "scenes", :action => "index").should == "/scenes"
    end
  
    it "maps #new" do
      route_for(:controller => "scenes", :action => "new").should == "/scenes/new"
    end
  
    it "maps #show" do
      route_for(:controller => "scenes", :action => "show", :id => "1").should == "/scenes/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "scenes", :action => "edit", :id => "1").should == "/scenes/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "scenes", :action => "create").should == {:path => "/scenes", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "scenes", :action => "update", :id => "1").should == {:path =>"/scenes/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "scenes", :action => "destroy", :id => "1").should == {:path =>"/scenes/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/scenes").should == {:controller => "scenes", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/scenes/new").should == {:controller => "scenes", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/scenes").should == {:controller => "scenes", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/scenes/1").should == {:controller => "scenes", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/scenes/1/edit").should == {:controller => "scenes", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/scenes/1").should == {:controller => "scenes", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/scenes/1").should == {:controller => "scenes", :action => "destroy", :id => "1"}
    end
  end
end
