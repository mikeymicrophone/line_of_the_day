require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Publication do
  before(:each) do
    @valid_attributes = {
      :text => "value for text",
      :line_id => 1,
      :group_id => 1,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Publication.create!(@valid_attributes)
  end
end
