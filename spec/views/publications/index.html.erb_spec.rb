require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/index.html.erb" do
  include PublicationsHelper
  
  before(:each) do
    assigns[:publications] = [
      stub_model(Publication,
        :text => "value for text",
        :line_id => 1,
        :group_id => 1,
        :user_id => 1
      ),
      stub_model(Publication,
        :text => "value for text",
        :line_id => 1,
        :group_id => 1,
        :user_id => 1
      )
    ]
  end

  it "renders a list of publications" do
    render
    response.should have_tag("tr>td", "value for text".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

