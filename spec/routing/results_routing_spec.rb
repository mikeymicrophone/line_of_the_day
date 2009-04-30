require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ResultsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "results", :action => "index").should == "/results"
    end
  
    it "maps #new" do
      route_for(:controller => "results", :action => "new").should == "/results/new"
    end
  
    it "maps #show" do
      route_for(:controller => "results", :action => "show", :id => "1").should == "/results/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "results", :action => "edit", :id => "1").should == "/results/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "results", :action => "create").should == {:path => "/results", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "results", :action => "update", :id => "1").should == {:path =>"/results/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "results", :action => "destroy", :id => "1").should == {:path =>"/results/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/results").should == {:controller => "results", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/results/new").should == {:controller => "results", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/results").should == {:controller => "results", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/results/1").should == {:controller => "results", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/results/1/edit").should == {:controller => "results", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/results/1").should == {:controller => "results", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/results/1").should == {:controller => "results", :action => "destroy", :id => "1"}
    end
  end
end
