class PagesController < ApplicationController
  layout 'marketing'

  def dashboard
    @next_task = Lesson.first.task!
    @next_task.save!
  end

  def tutorial
    render :layout => 'navless'
  end

  def get_help
    render :layout => 'navless'
  end
end
