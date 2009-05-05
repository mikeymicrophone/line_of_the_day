require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/index.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:messages] = [
      stub_model(Message,
        :subject => "value for subject",
        :body => "value for body",
        :reply_id => 1,
        :recipient_id => 1,
        :user_id => 1
      ),
      stub_model(Message,
        :subject => "value for subject",
        :body => "value for body",
        :reply_id => 1,
        :recipient_id => 1,
        :user_id => 1
      )
    ]
  end

  it "renders a list of messages" do
    render
    response.should have_tag("tr>td", "value for subject".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

