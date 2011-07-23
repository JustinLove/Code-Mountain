ActiveAdmin.register Task do
  index do |f|
    column :id
    column :lesson
    column :status
  end
end
