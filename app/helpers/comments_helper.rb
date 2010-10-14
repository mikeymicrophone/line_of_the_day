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
  
  def comment_section_for obj
    %Q{<div class="#{obj.class.name.underscore}" id="#{dom_id(obj, 'comments')}" style="display:none;">

    			<form action="/comments" class="new_comment" id="new_comment" method="post" onsubmit="new Ajax.Updater('#{dom_id(obj, 'replies')}', '/comments', {asynchronous:true, evalScripts:true, insertion:'bottom', onLoading:function(request){$('#{dom_id(obj, 'comment_text')}').clear(); $('#{dom_id(obj, 'comment_count')}').innerHTML = $('#{dom_id(obj, 'comment_count')}').innerHTML.gsub(/(d+)/, function(match) {return match[1]*1 + 1});}, parameters:Form.serialize(this)}); return false;"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="#{form_authenticity_token}" /></div>
    			  <textarea cols="35" id="#{dom_id(obj, 'comment_text')}" name="comment[text]" rows="4"></textarea>
    			  <input id="comment_target_id" name="comment[target_id]" type="hidden" value="#{obj.id}" />
    			  <input id="comment_target_type" name="comment[target_type]" type="hidden" value="#{obj.class.name}" />
    			  <input src="/images/weigh_in.png?1276641934" type="image" />
    			</form>

    		<div class="line" id="#{dom_id(obj, 'replies')}">
    		</div>
    	</div>}
  end
  
  def link_to_comment_section_for obj
    "<br>" + link_to_remote(pluralize(obj.comments.count, 'comment'), :url => send("#{obj.class.name.underscore}_comments_path", obj), :title => 'comments', :method => :get, :update => dom_id(obj, 'replies'), :complete => visual_effect(:toggle_slide, dom_id(obj, 'comments')), :html => {:id => dom_id(obj, 'comment_count')})
  end
end
