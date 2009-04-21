require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/new.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    assigns[:membership] = stub_model(Membership,
      :new_record? => true,
      :group_id => 1,
      :user_id => 1,
      :state => "value for state"
    )
  end

  it "renders new membership form" do
    render
    
    response.should have_tag("form[action=?][method=post]", memberships_path) do
      with_tag("input#membership_group_id[name=?]", "membership[group_id]")
      with_tag("input#membership_user_id[name=?]", "membership[user_id]")
      with_tag("input#membership_state[name=?]", "membership[state]")
    end
  end
end


