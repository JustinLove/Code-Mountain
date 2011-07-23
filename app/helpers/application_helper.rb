module ApplicationHelper
  def formatted_text(s)
    (h s).gsub("\r\n", '<br/>').html_safe
  end
end
