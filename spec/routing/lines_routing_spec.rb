require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LinesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "lines", :action => "index").should == "/lines"
    end
  
    it "maps #new" do
      route_for(:controller => "lines", :action => "new").should == "/lines/new"
    end
  
    it "maps #show" do
      route_for(:controller => "lines", :action => "show", :id => "1").should == "/lines/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "lines", :action => "edit", :id => "1").should == "/lines/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "lines", :action => "create").should == {:path => "/lines", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "lines", :action => "update", :id => "1").should == {:path =>"/lines/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "lines", :action => "destroy", :id => "1").should == {:path =>"/lines/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/lines").should == {:controller => "lines", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/lines/new").should == {:controller => "lines", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/lines").should == {:controller => "lines", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/lines/1").should == {:controller => "lines", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/lines/1/edit").should == {:controller => "lines", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/lines/1").should == {:controller => "lines", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/lines/1").should == {:controller => "lines", :action => "destroy", :id => "1"}
    end
  end
end
