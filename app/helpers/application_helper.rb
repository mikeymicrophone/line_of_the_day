# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin_resources
    %w! approaches comments groups lines memberships publications results scenes users !.map do |resource|
      link_to resource, '/' + resource
    end.join(' ')
  end
  
  def link_to_name what, method = nil
    unless method
      link_to what.name, what rescue nil
    else
      link_to what.send(method), what
    end
  end
end
