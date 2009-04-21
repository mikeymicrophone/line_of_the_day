require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MembershipsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "memberships", :action => "index").should == "/memberships"
    end
  
    it "maps #new" do
      route_for(:controller => "memberships", :action => "new").should == "/memberships/new"
    end
  
    it "maps #show" do
      route_for(:controller => "memberships", :action => "show", :id => "1").should == "/memberships/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "memberships", :action => "edit", :id => "1").should == "/memberships/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "memberships", :action => "create").should == {:path => "/memberships", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "memberships", :action => "update", :id => "1").should == {:path =>"/memberships/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "memberships", :action => "destroy", :id => "1").should == {:path =>"/memberships/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/memberships").should == {:controller => "memberships", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/memberships/new").should == {:controller => "memberships", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/memberships").should == {:controller => "memberships", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/memberships/1").should == {:controller => "memberships", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/memberships/1/edit").should == {:controller => "memberships", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/memberships/1").should == {:controller => "memberships", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/memberships/1").should == {:controller => "memberships", :action => "destroy", :id => "1"}
    end
  end
end
