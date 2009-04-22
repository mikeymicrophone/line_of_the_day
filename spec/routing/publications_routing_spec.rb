require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PublicationsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "publications", :action => "index").should == "/publications"
    end
  
    it "maps #new" do
      route_for(:controller => "publications", :action => "new").should == "/publications/new"
    end
  
    it "maps #show" do
      route_for(:controller => "publications", :action => "show", :id => "1").should == "/publications/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "publications", :action => "edit", :id => "1").should == "/publications/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "publications", :action => "create").should == {:path => "/publications", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "publications", :action => "update", :id => "1").should == {:path =>"/publications/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "publications", :action => "destroy", :id => "1").should == {:path =>"/publications/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/publications").should == {:controller => "publications", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/publications/new").should == {:controller => "publications", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/publications").should == {:controller => "publications", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/publications/1").should == {:controller => "publications", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/publications/1/edit").should == {:controller => "publications", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/publications/1").should == {:controller => "publications", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/publications/1").should == {:controller => "publications", :action => "destroy", :id => "1"}
    end
  end
end
