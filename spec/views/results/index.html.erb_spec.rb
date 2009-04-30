require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/results/index.html.erb" do
  include ResultsHelper
  
  before(:each) do
    assigns[:results] = [
      stub_model(Result,
        :name => "value for name"
      ),
      stub_model(Result,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of results" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

