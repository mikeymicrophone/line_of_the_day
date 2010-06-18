module TagsHelper
  def tagger target
    link_to_remote('t', :url => new_tag_path(:tag => {:target_type => target.class.name, :target_id => target.id}), :update => dom_id(target, 'taggable_lists'), :html => {:title => 'tag'}) +
		div_for(target, 'taggable_lists') do
	  end
  end
  
  def tag_display target
    unless target.tags.empty?
      pluralize(target.tags.count, 'tag') + ': ' +
      target.tags.map do |t|
        link_to t.subject.name, t.subject
      end.to_sentence
    end
  end
end