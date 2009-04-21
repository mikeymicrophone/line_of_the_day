require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lines/show.html.erb" do
  include LinesHelper
  before(:each) do
    assigns[:line] = @line = stub_model(Line,
      :text => "value for text",
      :context => "value for context",
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ text/)
    response.should have_text(/value\ for\ context/)
    response.should have_text(/1/)
  end
end

