ActiveAdmin.register AdminUser do
  index do |f|
    column :email
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
