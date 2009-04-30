require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/approaches/edit.html.erb" do
  include ApproachesHelper
  
  before(:each) do
    assigns[:approach] = @approach = stub_model(Approach,
      :new_record? => false,
      :context => "value for context",
      :line_id => 1,
      :scene_id => 1,
      :hotness => 1,
      :result_id => 1
    )
  end

  it "renders the edit approach form" do
    render
    
    response.should have_tag("form[action=#{approach_path(@approach)}][method=post]") do
      with_tag('textarea#approach_context[name=?]', "approach[context]")
      with_tag('input#approach_line_id[name=?]', "approach[line_id]")
      with_tag('input#approach_scene_id[name=?]', "approach[scene_id]")
      with_tag('input#approach_hotness[name=?]', "approach[hotness]")
      with_tag('input#approach_result_id[name=?]', "approach[result_id]")
    end
  end
end


