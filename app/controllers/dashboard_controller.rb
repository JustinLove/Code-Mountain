class DashboardController < ApplicationController
  expose(:next_task) { Lesson.incomplete.first.task! }

  def index
    next_task.save!
  end
end
