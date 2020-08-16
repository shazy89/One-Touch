Rails.application.routes.draw do
  root 'static#welcome'
  resources :users
end