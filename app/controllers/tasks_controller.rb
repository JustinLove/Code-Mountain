class TasksController < ApplicationController
  expose(:next_task) do
    p params
    if params[:previous_task]
      Task.find(params[:previous_task]).next
    else
      Lesson.first.create_task
    end
  end

  def create
    redirect_to tasks_path(next_task)
  end
end
