module LinesHelper
  def publicize_link line
    if current_user == line.user && current_user
      if line.public?
        link_to_remote 'make private', :url => line_path(line, :line => {:public => false}), :method => :put, :html => {:class => 'publication'}, :update => dom_id(line, 'publicize')
      else
        link_to_remote 'make public', :url => line_path(line, :line => {:public => true}), :method => :put, :html => {:class => 'publication'}, :update => dom_id(line, 'publicize')
      end
    end
  end
end
