require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/new.html.erb" do
  include PublicationsHelper
  
  before(:each) do
    assigns[:publication] = stub_model(Publication,
      :new_record? => true,
      :text => "value for text",
      :line_id => 1,
      :group_id => 1,
      :user_id => 1
    )
  end

  it "renders new publication form" do
    render
    
    response.should have_tag("form[action=?][method=post]", publications_path) do
      with_tag("textarea#publication_text[name=?]", "publication[text]")
      with_tag("input#publication_line_id[name=?]", "publication[line_id]")
      with_tag("input#publication_group_id[name=?]", "publication[group_id]")
      with_tag("input#publication_user_id[name=?]", "publication[user_id]")
    end
  end
end


