require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GuidancesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "guidances", :action => "index").should == "/guidances"
    end

    it "maps #new" do
      route_for(:controller => "guidances", :action => "new").should == "/guidances/new"
    end

    it "maps #show" do
      route_for(:controller => "guidances", :action => "show", :id => "1").should == "/guidances/1"
    end

    it "maps #edit" do
      route_for(:controller => "guidances", :action => "edit", :id => "1").should == "/guidances/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "guidances", :action => "create").should == {:path => "/guidances", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "guidances", :action => "update", :id => "1").should == {:path =>"/guidances/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "guidances", :action => "destroy", :id => "1").should == {:path =>"/guidances/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/guidances").should == {:controller => "guidances", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/guidances/new").should == {:controller => "guidances", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/guidances").should == {:controller => "guidances", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/guidances/1").should == {:controller => "guidances", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/guidances/1/edit").should == {:controller => "guidances", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/guidances/1").should == {:controller => "guidances", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/guidances/1").should == {:controller => "guidances", :action => "destroy", :id => "1"}
    end
  end
end
