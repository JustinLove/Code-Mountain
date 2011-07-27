CodeMountain::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'pages#landing'
  controller :pages do
    get 'about'
    get 'congrats'
    get 'contact'
    post 'create_subscriber'
    get 'dashboard'
    get 'fake_iframe'
    get 'faq'
    get 'get_help'
    get 'get_response'
    get 'help'
    get 'help_confirm'
    get 'mobile'
    get 'start'
    get 'thank_you'
    get 'tutorial'
  end

  match 'real_dashboard' => 'dashboard#index'

  resources :tasks, :only => [:create, :show, :update] do
    member do
      get :tutorial
      get :complete
      get :help
    end
  end

  resources :lessons, :only => [:index]

end
