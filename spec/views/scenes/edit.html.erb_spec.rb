require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenes/edit.html.erb" do
  include ScenesHelper
  
  before(:each) do
    assigns[:scene] = @scene = stub_model(Scene,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit scene form" do
    render
    
    response.should have_tag("form[action=#{scene_path(@scene)}][method=post]") do
      with_tag('input#scene_name[name=?]', "scene[name]")
    end
  end
end


