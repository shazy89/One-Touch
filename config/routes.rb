Rails.application.routes.draw do
resources :tables 
resources :select_items, only: [:edit, :show, :update, :destroy] 

get 'table/:id/select_items', to: 'tables#clearthetable', as: 'table_select'
post 'select_items', to: 'select_items#select_item', as: 'select'

resources :sessions

root 'static#welcome'

resources :users, only: [:new, :show, :edit, :create, :update, :destroy ] do
resources :products, only: [ :index, :new, :show, :edit, :create, :update, :destroy ]
end

get '/auth/github/callback', to: 'sessions#github'

end




  

  
  



