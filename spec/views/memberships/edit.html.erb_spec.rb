require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/memberships/edit.html.erb" do
  include MembershipsHelper
  
  before(:each) do
    assigns[:membership] = @membership = stub_model(Membership,
      :new_record? => false,
      :group_id => 1,
      :user_id => 1,
      :state => "value for state"
    )
  end

  it "renders the edit membership form" do
    render
    
    response.should have_tag("form[action=#{membership_path(@membership)}][method=post]") do
      with_tag('input#membership_group_id[name=?]', "membership[group_id]")
      with_tag('input#membership_user_id[name=?]', "membership[user_id]")
      with_tag('input#membership_state[name=?]', "membership[state]")
    end
  end
end


