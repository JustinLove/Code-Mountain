module ApplicationHelper
  def formatted_text(s)
    bc = BlueCloth.new(s)
    bc.to_html.html_safe
  end

  def help_link(task)
    link_to "I'm Stuck", help_task_path(task), :class => 'help'
  end
end
