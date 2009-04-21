require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/index.html.erb" do
  include GroupsHelper
  
  before(:each) do
    assigns[:groups] = [
      stub_model(Group,
        :name => "value for name",
        :user_id => 1,
        :rules => 1
      ),
      stub_model(Group,
        :name => "value for name",
        :user_id => 1,
        :rules => 1
      )
    ]
  end

  it "renders a list of groups" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

