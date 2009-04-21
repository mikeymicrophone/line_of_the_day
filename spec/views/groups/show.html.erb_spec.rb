require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/show.html.erb" do
  include GroupsHelper
  before(:each) do
    assigns[:group] = @group = stub_model(Group,
      :name => "value for name",
      :user_id => 1,
      :rules => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

