module TagsHelper
  def tagger target
    link_to_remote('t', :url => new_tag_path(:tag => {:target_type => target.class.name, :target_id => target.id}), :update => dom_id(target, 'taggable_lists'), :html => {:title => 'tag'}) +
		content_tag(:span, :id => dom_id(target, 'taggable_lists')) do
	  end
  end
  
  def tag_display target
    unless target.tags.empty?
      pluralize(target.tags.count, 'tag') + ': ' +
      target.tags.map do |t|
        div_for t, :class => t.subject_type.downcase do
          link_to truncate(t.subject.name), t.subject, :title => t.subject.name
        end
      end.to_sentence
    end
  end
end