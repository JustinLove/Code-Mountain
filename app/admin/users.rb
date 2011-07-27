ActiveAdmin.register User do
  index do |f|
    column :email do |user| 
      link_to user.email, admin_user_path(user)
    end
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :remember_me
    end
    f.buttons
  end
end
