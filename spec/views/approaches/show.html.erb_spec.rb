require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/approaches/show.html.erb" do
  include ApproachesHelper
  before(:each) do
    assigns[:approach] = @approach = stub_model(Approach,
      :context => "value for context",
      :line_id => 1,
      :scene_id => 1,
      :hotness => 1,
      :result_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ context/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

