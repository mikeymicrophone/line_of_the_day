module QuotesHelper
  def add_quote target
    link_to 'quote it', new_quote_path(:quote => {:source_type => target.class.name, :source_id => target.id})
  end
end