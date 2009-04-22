require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/show.html.erb" do
  include PublicationsHelper
  before(:each) do
    assigns[:publication] = @publication = stub_model(Publication,
      :text => "value for text",
      :line_id => 1,
      :group_id => 1,
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ text/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

