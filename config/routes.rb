Rails.application.routes.draw do
  root to:'items#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  resources :items,only: [:index,:new,:create]
end
