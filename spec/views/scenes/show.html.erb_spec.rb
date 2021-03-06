require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/scenes/show.html.erb" do
  include ScenesHelper
  before(:each) do
    assigns[:scene] = @scene = stub_model(Scene,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end

