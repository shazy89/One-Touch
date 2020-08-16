Rails.application.routes.draw do
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"
  
  resources :users

  root 'static#welcome'

end