SaasStarter::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users
  
  match '/dashboard', to: 'dashboards#index', via: 'get', as: 'dashboards'
    
  # Keep the following 2 lines at the bottom of the class
  # Unless you know what you are doing
  get '/*id', to: 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home' 
end
