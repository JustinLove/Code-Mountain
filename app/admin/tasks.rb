ActiveAdmin.register Task do
  index do |f|
    column :id, do |task| 
      link_to task.id, admin_task_path(task)
    end
    column :lesson
    column :status
  end

  action_item(:only => :index) do
    link_to "Delete All", delete_all_admin_tasks_path
  end

  collection_action :delete_all do
    Task.destroy_all
    redirect_to admin_tasks_path
  end
end
