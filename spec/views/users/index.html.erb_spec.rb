require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :username => "value for username",
        :email => "value for email"
      ),
      stub_model(User,
        :username => "value for username",
        :email => "value for email"
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "value for username".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
  end
end

