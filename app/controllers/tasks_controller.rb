class TasksController < ApplicationController
  expose(:task)

  def create
    task.save!
    redirect_to task_path(task)
  end

  def show
  end

  def update
    task.save!
    redirect_to task_path(task)
  end
end
