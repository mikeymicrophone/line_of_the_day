module TagsHelper
  def tagger target
    div_for target, 'tagger', :class => 'tagger' do
      link_to_remote 't', :url => new_tag_path(:tag => {:target_type => target.class.name, :target_id => target.id}), :title => 'tag', :update => dom_id(target, 'tagger') if current_user
    end
  end
  
  def tag_display target
    link_to_remote pluralize(target.tags.count, 'tag'), :url => tags_path(:target_type => target.class.name, :target_id => target.id), :html => {:id => dom_id(target, 'tag_count')}, :update => dom_id(target, 'tags'), :method => :get, :complete => visual_effect(:toggle_slide, dom_id(target, 'tags'))
  end
  
  def display_tag tag
    '<hr>' +
    div_for(tag, :class => tag.subject_type.downcase) do
      link_to_remote tag.subject.name, :url => tag.subject, :title => tag.subject.name, :update => dom_id(tag.target), :position => :after, :method => :get
    end
  end
end