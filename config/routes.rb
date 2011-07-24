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
    get 'tutorial'
    get 'contact'
  end

  resources :tasks, :only => [:create, :show, :update] do
    member do
      get :tutorial
    end
  end

  resources :lessons, :only => [:index]

end
