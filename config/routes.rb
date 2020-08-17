Rails.application.routes.draw do
  resources :tables
  resources :select_items
  resources :products
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"

  resources :users, only: [:new, :edit, :create, :update, :destroy ]

  root 'static#welcome'

end