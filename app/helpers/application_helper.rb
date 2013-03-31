module ApplicationHelper

  def link_unless_blank( text, url )
    if url.blank? then "-- kein Link --" else link_to(text, url) end
  end
end
