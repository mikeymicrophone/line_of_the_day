require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/results/new.html.erb" do
  include ResultsHelper
  
  before(:each) do
    assigns[:result] = stub_model(Result,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new result form" do
    render
    
    response.should have_tag("form[action=?][method=post]", results_path) do
      with_tag("input#result_name[name=?]", "result[name]")
    end
  end
end


