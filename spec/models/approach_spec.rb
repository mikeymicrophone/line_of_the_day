require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Approach do
  before(:each) do
    @valid_attributes = {
      :context => "value for context",
      :line_id => 1,
      :scene_id => 1,
      :hotness => 1,
      :result_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Approach.create!(@valid_attributes)
  end
end
