Rails.application.routes.draw do
  resources :shipments
  resources :carriers
  resources :customers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
