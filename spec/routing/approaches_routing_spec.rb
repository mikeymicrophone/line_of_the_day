require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApproachesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "approaches", :action => "index").should == "/approaches"
    end
  
    it "maps #new" do
      route_for(:controller => "approaches", :action => "new").should == "/approaches/new"
    end
  
    it "maps #show" do
      route_for(:controller => "approaches", :action => "show", :id => "1").should == "/approaches/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "approaches", :action => "edit", :id => "1").should == "/approaches/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "approaches", :action => "create").should == {:path => "/approaches", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "approaches", :action => "update", :id => "1").should == {:path =>"/approaches/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "approaches", :action => "destroy", :id => "1").should == {:path =>"/approaches/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/approaches").should == {:controller => "approaches", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/approaches/new").should == {:controller => "approaches", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/approaches").should == {:controller => "approaches", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/approaches/1").should == {:controller => "approaches", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/approaches/1/edit").should == {:controller => "approaches", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/approaches/1").should == {:controller => "approaches", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/approaches/1").should == {:controller => "approaches", :action => "destroy", :id => "1"}
    end
  end
end
