module TagsHelper
  def tagger target
    link_to_remote('t', :url => new_tag_path(:tag => {:target_type => target.class.name, :target_id => target.id}), :update => dom_id(target, 'taggable_lists'), :html => {:title => 'tag'}) +
		content_tag(:span, :id => dom_id(target, 'taggable_lists')) do
	  end
  end
  
  def tag_display target
    unless target.tags.empty?
      content_tag(:div, :class => 'tags') do
        pluralize(target.tags.count, 'tag') + ': ' +
        target.tags.map do |t|
          display_tag t
        end.to_sentence
      end
    end
  end
  
  def display_tag tag
    div_for tag, :class => tag.subject_type.downcase do
      link_to truncate(tag.subject.name), tag.subject, :title => tag.subject.name
    end
  end
end