require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/edit.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :username => "value for username",
      :email => "value for email"
    )
  end

  it "renders the edit user form" do
    render
    
    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_username[name=?]', "user[username]")
      with_tag('input#user_email[name=?]', "user[email]")
    end
  end
end


