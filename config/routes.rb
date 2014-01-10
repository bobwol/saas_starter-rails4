SaasStarter::Application.routes.draw do
  devise_for :users
  
  # Root route is declared in config/initializers/high_voltage.rb
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
