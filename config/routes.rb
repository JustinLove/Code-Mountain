CodeMountain::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'pages#landing'
  controller :pages do
    get 'about'
    get 'congrats'
    get 'contact'
    get 'dashboard'
    get 'faq'
    get 'get_help'
    get 'help'
    get 'mobile'
    get 'start'
    get 'tutorial'
  end

  resources :tasks, :only => [:create, :show, :update] do
    member do
      get :tutorial
      get :complete
      get :help
    end
  end

  resources :lessons, :only => [:index]

end
