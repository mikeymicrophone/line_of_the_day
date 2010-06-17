require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Blog do
  it 'should not validate a blog with a duplicate url' do
    Blog.make :url => 'http://sinnsofattraction.blogspot.com'
    lambda { Blog.make :url => 'http://sinnsofattraction.blogspot.com' }.should raise_error
  end

  it 'should not validate a blog with a duplicate feed url' do
    Blog.make :feed_url => 'http://sinnsofattraction.blogspot.com/feed'
    lambda { Blog.make :feed_url => 'http://sinnsofattraction.blogspot.com/feed' }.should raise_error
  end
end