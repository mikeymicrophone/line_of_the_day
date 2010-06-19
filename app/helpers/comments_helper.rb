module CommentsHelper
  def comment_form target
    # this does not work yet
    if current_user
    	form_remote_for(target.comments.new, :update => 'comments', :position => 'top', :loading => "$('comment_text').clear();") do |f|
    	  f.text_area :text, :size => '35x4'
    	  f.hidden_field :target_id, :value => target.id
    	  f.hidden_field :target_type, :value => target.class.name
    	  image_submit_tag 'weigh_in.png'
    	end
    end
  end
end
