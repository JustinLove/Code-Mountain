CodeMountain::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'pages#landing'
  controller :pages do
    get 'landing'
    get 'task'
    get 'complete'
    get 'help'
    get 'finish'
  end

end
