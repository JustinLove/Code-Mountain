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
    if task.complete?
      redirect_to complete_task_path(task)
    else
      redirect_to task_path(task)
    end
  end

  def tutorial
    render :layout => 'navless'
  end
end
