# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".
SaasStarter::Application.routes.draw do
  resources :projects

  namespace :admin do
    match '', to: 'dashboard#index', via: 'get', as: '/'
    resources :plans
  end
  
  # To alter path for certain Devise user actions, add:
  # path_names: {sign_in: 'login', sign_out: 'logout'}
  devise_for :users, path: ''
  
  resources :subscriptions, except: [:new, :edit, :show]
  
  match '/dashboard', to: 'dashboards#index', via: 'get', as: 'dashboards'
    
  # Keep the following 2 lines at the bottom of the class
  # Unless you know what you are doing
  get '/*id', to: 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home' 
end
