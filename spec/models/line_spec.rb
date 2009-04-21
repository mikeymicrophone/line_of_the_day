require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Line do
  before(:each) do
    @valid_attributes = {
      :text => "value for text",
      :context => "value for context",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Line.create!(@valid_attributes)
  end
end
