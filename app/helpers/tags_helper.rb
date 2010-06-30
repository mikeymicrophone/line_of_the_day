module TagsHelper
  def tagger target
    link_to 't', new_tag_path(:tag => {:target_type => target.class.name, :target_id => target.id}), :title => 'tag', :rel => 'shadowbox;height=300;width=300' if current_user
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