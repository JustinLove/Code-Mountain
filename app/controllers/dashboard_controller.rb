class DashboardController < ApplicationController
  before_filter :authenticate_user!

  expose(:next_task) { Lesson.incomplete(current_user).first.task!(current_user) }

  def index
    next_task.save!
  end
end
