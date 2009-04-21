require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lines/index.html.erb" do
  include LinesHelper
  
  before(:each) do
    assigns[:lines] = [
      stub_model(Line,
        :text => "value for text",
        :context => "value for context",
        :user_id => 1
      ),
      stub_model(Line,
        :text => "value for text",
        :context => "value for context",
        :user_id => 1
      )
    ]
  end

  it "renders a list of lines" do
    render
    response.should have_tag("tr>td", "value for text".to_s, 2)
    response.should have_tag("tr>td", "value for context".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

