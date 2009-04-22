require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/edit.html.erb" do
  include PublicationsHelper
  
  before(:each) do
    assigns[:publication] = @publication = stub_model(Publication,
      :new_record? => false,
      :text => "value for text",
      :line_id => 1,
      :group_id => 1,
      :user_id => 1
    )
  end

  it "renders the edit publication form" do
    render
    
    response.should have_tag("form[action=#{publication_path(@publication)}][method=post]") do
      with_tag('textarea#publication_text[name=?]', "publication[text]")
      with_tag('input#publication_line_id[name=?]', "publication[line_id]")
      with_tag('input#publication_group_id[name=?]', "publication[group_id]")
      with_tag('input#publication_user_id[name=?]', "publication[user_id]")
    end
  end
end


