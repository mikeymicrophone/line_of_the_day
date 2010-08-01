module ExposedContent
  def inspect_content
    klass = controller_name.classify.constantize
    @content = klass.send(:find, params[:id])
    if params[:user_id]
      @content.my_rating = Rating.find_by_user_id_and_target_id_and_target_type(params[:user_id], params[:id], @content.class.name).andand.opinion
    end
    if @content
      render :xml => @content.to_xml(:methods => [:average_rating, :rating_count, :tag_count, :recent_tags, :comment_count, :recent_comment, :my_rating])
    else
      render :nothing => true
    end
  end
end