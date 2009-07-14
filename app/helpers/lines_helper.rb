module LinesHelper
  def publicize_link line
    if current_user == line.user && current_user
      if line.public?
        link_to 'make private', line_path(line, :line => {:public => false}), :method => :put, :class => 'publication'
      else
        link_to 'make public', line_path(line, :line => {:public => true}), :method => :put, :class => 'publication'
      end
    end
  end
end
