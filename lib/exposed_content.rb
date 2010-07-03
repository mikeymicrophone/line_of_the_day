module ExposedContent
  def inspect_content
    klass = controller_name.classify.constantize
    @content = klass.send(:find, params[:id])
    if @content
      render :xml => @content.to_xml(:methods => [:average_rating, :rating_count, :tag_count, :recent_tags, :comment_count, :recent_comment])
    else
      render :nothing => true
    end
  end
end