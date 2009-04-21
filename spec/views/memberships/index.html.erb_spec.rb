require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/index.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    assigns[:memberships] = [
      stub_model(Membership,
        :group_id => 1,
        :user_id => 1,
        :state => "value for state"
      ),
      stub_model(Membership,
        :group_id => 1,
        :user_id => 1,
        :state => "value for state"
      )
    ]
  end

  it "renders a list of memberships" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
  end
end

