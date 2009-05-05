require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/edit.html.erb" do
  include MessagesHelper
  
  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :new_record? => false,
      :subject => "value for subject",
      :body => "value for body",
      :reply_id => 1,
      :recipient_id => 1,
      :user_id => 1
    )
  end

  it "renders the edit message form" do
    render
    
    response.should have_tag("form[action=#{message_path(@message)}][method=post]") do
      with_tag('input#message_subject[name=?]', "message[subject]")
      with_tag('textarea#message_body[name=?]', "message[body]")
      with_tag('input#message_reply_id[name=?]', "message[reply_id]")
      with_tag('input#message_recipient_id[name=?]', "message[recipient_id]")
      with_tag('input#message_user_id[name=?]', "message[user_id]")
    end
  end
end


