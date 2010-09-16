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
  
  def sort_buttons
    link_to(image_tag('top_rated.png'), {:sort => 'rating'}, :class => 'sort borderedbox') +
    link_to(image_tag('recent.png'), {:sort => 'recent'}, :class => 'sort borderedbox') +
    link_to(image_tag('randomize.png'), {:sort => 'random'}, :class => 'sort borderedbox')
  end
  
  def voting_booth target
    if current_user
      thevote = Rating.find_by_target_type_and_target_id_and_user_id(target.class.name, target.id, current_user.id) || Rating.new(:opinion => 0)
      vote = thevote.opinion
      type = target.class.name.underscore
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
    link_to '+', send("new_#{target.class.name.downcase}_list_item_path", target), :title => 'add to a list', :rel => 'shadowbox;height=140;width=200' if current_user
  end
  
  def google_analytics
    %Q!<script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-333706-3']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>!
  end
  
  def will_paginate_unless_random collection, opts = {}
    if params[:sort] == 'random'
      link_to 'refresh', {:sort => params[:sort]}, :class => 'refresh'
    else
      will_paginate collection, opts
    end + 
    content_tag(:div, :class => 'per_page') do
      raw("<span class='per_page_count'>#{params[:per_page] || 25}</span> per page   ") +
      raw(%Q{<input type="range" min="1" max="100" value="#{params[:per_page] || 25}" class='per_page_slider' onchange="update_per_page(this.value)"/>})
    end
  end
end
