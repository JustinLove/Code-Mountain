module ApplicationHelper
  def formatted_text(s)
    (h s).gsub("\r\n", '<br/>').html_safe
  end

  def help_link(task)
    link_to "I'm Stuck", help_task_path(task), :class => 'help'
  end
end
