require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/approaches/index.html.erb" do
  include ApproachesHelper
  
  before(:each) do
    assigns[:approaches] = [
      stub_model(Approach,
        :context => "value for context",
        :line_id => 1,
        :scene_id => 1,
        :hotness => 1,
        :result_id => 1
      ),
      stub_model(Approach,
        :context => "value for context",
        :line_id => 1,
        :scene_id => 1,
        :hotness => 1,
        :result_id => 1
      )
    ]
  end

  it "renders a list of approaches" do
    render
    response.should have_tag("tr>td", "value for context".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

