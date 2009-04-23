module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      root_path
    when /the new publication page/
      new_publication_path

    when /the new membership page/
      new_membership_path

    when /the new comment page/
      new_comment_path

    when /the new account page/
      new_user_path

    when /the new posting_a_line page/
      new_posting_a_line_path

    
    # Add more page name => path mappings here
    
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World do |world|
  world.extend NavigationHelpers
  world
end
