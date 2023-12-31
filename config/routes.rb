Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  
  resources :items,only: [:index, :new, :create, :show, :edit, :update, :destroy] do
        resources :orders,only: [:index, :create]
  end
end