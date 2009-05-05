require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Message do
  before(:each) do
    @valid_attributes = {
      :subject => "value for subject",
      :body => "value for body",
      :reply_id => 1,
      :recipient_id => 1,
      :user_id => 1,
      :read_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Message.create!(@valid_attributes)
  end
end
