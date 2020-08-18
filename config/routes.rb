Rails.application.routes.draw do
resources :tables 
resources :select_items, only: [:edit, :show, :update] 

resources :products, only: [ :index, :new, :show, :edit, :create, :update, :destroy ]
resources :users, only: [:new, :show, :edit, :create, :update, :destroy ] 

get 'table/:id/select_items', to: 'tables#clearthetable', as: 'table_select'
post 'select_items', to: 'select_items#select_item', as: 'select'

get "/login", to: "sessions#new", as: "login"
post "/login", to: "sessions#create"
get "/logout", to: "sessions#destroy", as: "logout"

root 'static#welcome'
 
end
  
  
  



