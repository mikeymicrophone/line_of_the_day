require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :text => "value for text",
      :line_id => 1,
      :user_id => 1
    )
  end

  it "renders the edit comment form" do
    render
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('textarea#comment_text[name=?]', "comment[text]")
      with_tag('input#comment_line_id[name=?]', "comment[line_id]")
      with_tag('input#comment_user_id[name=?]', "comment[user_id]")
    end
  end
end


