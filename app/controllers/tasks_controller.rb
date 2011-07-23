class TasksController < ApplicationController
  expose(:next_task) do
    if params[:previous_task]
      Task.find(params[:previous_task]).next
    else
      Lesson.first.create_task
    end
  end

  expose(:task)

  def create
    redirect_to task_path(next_task)
  end

  def show
  end

  def update
    task.save!
    redirect_to task_path(task.next)
  end
end
