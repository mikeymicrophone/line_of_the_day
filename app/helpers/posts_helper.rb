module PostsHelper
  def post_display post
    div_for post do
      voting_booth(post) + content_tag(:h2, post.name) + 
      div_for(post, 'content') do
        post.content
      end
    end
  end
end