require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/show.html.erb" do
  include MembershipsHelper
  before(:each) do
    assigns[:membership] = @membership = stub_model(Membership,
      :group_id => 1,
      :user_id => 1,
      :state => "value for state"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ state/)
  end
end

