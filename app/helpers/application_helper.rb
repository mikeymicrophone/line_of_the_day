# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin_resources
    %w! approaches comments groups lines memberships publications results scenes users !.map do |resource|
      link_to resource, '/' + resource
    end.join(' ')
  end
  
  def link_to_name what, method = nil, opts = {}
    unless method
      link_to what.name, what, opts rescue nil
    else
      link_to what.send(method), what, opts if what
    end
  end
  
  def voting_booth target
    if current_user
      thevote = Rating.find_by_target_type_and_target_id_and_user_id(target.class.name, target.id, current_user.id) || Rating.new(:opinion => 0)
      vote = thevote.opinion
      type = target.class.name.downcase
      "<div class=\"vote\" id=\"#{target.dom_id('vote')}\">
         <div class=\"current_value\" id=\"#{target.dom_id('current_value')}\"></div>
         <div class=\"track\" id=\"#{target.dom_id('track')}\">
           <div class=\"handle\" id=\"#{target.dom_id('handle')}\"></div>
  		   </div>
         <div class=\"fill\" id=\"#{target.dom_id('fill')}\"></div>
  		   <div class=\"endcap_left\"></div>
  		   <div class=\"endcap_right\"></div>
  		 </div>
  		 <script type=\"text/javascript\">vote_slider('#{type}', #{target.id}, #{vote});</script>
  		 <span class='average_rating'>#{target.printed_average_rating}</span>"
     else
       "<span class='average_rating'>#{target.printed_average_rating}</span>"
     end
  end
  
  def add_to_list target
    link_to '+', send("new_#{target.class.name.downcase}_list_item_path", target), :title => 'add to a list' if current_user
  end  
end
