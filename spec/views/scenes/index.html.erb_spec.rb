require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenes/index.html.erb" do
  include ScenesHelper
  
  before(:each) do
    assigns[:scenes] = [
      stub_model(Scene,
        :name => "value for name"
      ),
      stub_model(Scene,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of scenes" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

