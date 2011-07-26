class TasksController < ApplicationController
  expose(:task)
  expose(:next_task) {task.next}

  def create
    task.save!
    redirect_to task_path(task)
  end

  def show
  end

  def update
    task.save!
    if params[:task][:status] == 'complete'
      task.next.save! #ensure it exists so page can navigate to it
      redirect_to complete_task_path(task)
    else
      redirect_to task_path(task)
    end
  end

  def tutorial
    render :layout => 'navless'
  end

  def help
    render :layout => 'dialog'
  end
end
