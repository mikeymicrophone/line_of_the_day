require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/messages/show.html.erb" do
  include MessagesHelper
  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :subject => "value for subject",
      :body => "value for body",
      :reply_id => 1,
      :recipient_id => 1,
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ subject/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

