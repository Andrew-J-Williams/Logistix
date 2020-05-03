Rails.application.routes.draw do
  get '/' => "sessions#welcome" # We make a 'get' request that goes through our 'sessions' folder to access the 'welcome' file.
  get '/login' => "sessions#new" # Brings the user to the login screen
  post '/login' => "sessions#create" # Takes user information to generate a user session with their info.
  get '/signup' => "users#new" # We don't need a 'post signup' because we already have a route in 'resources :users'
  delete '/logout' => "sessions#destroy" # Logs the user out
  
  resources :shipments
  resources :carriers
  resources :users
  resources :services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
