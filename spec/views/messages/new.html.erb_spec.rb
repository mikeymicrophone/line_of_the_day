require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/new.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:message] = stub_model(Message,
      :new_record? => true,
      :subject => "value for subject",
      :body => "value for body",
      :reply_id => 1,
      :recipient_id => 1,
      :user_id => 1
    )
  end

  it "renders new message form" do
    render
    
    response.should have_tag("form[action=?][method=post]", messages_path) do
      with_tag("input#message_subject[name=?]", "message[subject]")
      with_tag("textarea#message_body[name=?]", "message[body]")
      with_tag("input#message_reply_id[name=?]", "message[reply_id]")
      with_tag("input#message_recipient_id[name=?]", "message[recipient_id]")
      with_tag("input#message_user_id[name=?]", "message[user_id]")
    end
  end
end


