module ApproachesHelper

  def hotness_slider( target )
    type = target.class.name.downcase
    "<div class=\"vote\" id=\"#{target.dom_id('vote')}\">
       <div class=\"track\" id=\"#{target.dom_id('track')}\">
         <div class=\"handle\" id=\"#{target.dom_id('handle')}\"></div>
       </div>
       <div class=\"fill\" id=\"#{target.dom_id('fill')}\"></div>
       <div class=\"endcap_left\"></div>
       <div class=\"endcap_right\"></div>
       <div class=\"current_value\" id=\"#{target.dom_id('current_value')}\"></div>
     </div>
     <script type=\"text/javascript\">hotness_slider('#{type}', #{target.id});</script>"
  end

end
