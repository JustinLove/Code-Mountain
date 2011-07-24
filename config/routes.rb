CodeMountain::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'pages#landing'
  controller :pages do
    get 'landing'
    get 'do_task'
    get 'complete'
    get 'help'
    get 'finish'
    get 'about'
    get 'faq'
    get 'start'
  end

  resources :tasks, :only => [:create, :show, :update]

  resources :lessons, :only => [:index]

end
