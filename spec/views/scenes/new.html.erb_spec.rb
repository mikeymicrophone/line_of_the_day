require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenes/new.html.erb" do
  include ScenesHelper
  
  before(:each) do
    assigns[:scene] = stub_model(Scene,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new scene form" do
    render
    
    response.should have_tag("form[action=?][method=post]", scenes_path) do
      with_tag("input#scene_name[name=?]", "scene[name]")
    end
  end
end


