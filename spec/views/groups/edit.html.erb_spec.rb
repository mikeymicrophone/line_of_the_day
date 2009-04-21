require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/edit.html.erb" do
  include GroupsHelper
  
  before(:each) do
    assigns[:group] = @group = stub_model(Group,
      :new_record? => false,
      :name => "value for name",
      :user_id => 1,
      :rules => 1
    )
  end

  it "renders the edit group form" do
    render
    
    response.should have_tag("form[action=#{group_path(@group)}][method=post]") do
      with_tag('input#group_name[name=?]', "group[name]")
      with_tag('input#group_user_id[name=?]', "group[user_id]")
      with_tag('input#group_rules[name=?]', "group[rules]")
    end
  end
end


