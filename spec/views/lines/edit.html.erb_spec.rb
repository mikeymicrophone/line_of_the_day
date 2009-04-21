require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lines/edit.html.erb" do
  include LinesHelper
  
  before(:each) do
    assigns[:line] = @line = stub_model(Line,
      :new_record? => false,
      :text => "value for text",
      :context => "value for context",
      :user_id => 1
    )
  end

  it "renders the edit line form" do
    render
    
    response.should have_tag("form[action=#{line_path(@line)}][method=post]") do
      with_tag('textarea#line_text[name=?]', "line[text]")
      with_tag('textarea#line_context[name=?]', "line[context]")
      with_tag('input#line_user_id[name=?]', "line[user_id]")
    end
  end
end


