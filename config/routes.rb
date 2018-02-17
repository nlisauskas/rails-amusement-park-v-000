Rails.application.routes.draw do

 root to: 'welcome#home'
 get '/users/new', to: 'users#new', as: 'signup'
 get '/signin', to: 'users#login'
 resources :sessions, only: [:create]
 get '/logout', to: 'sessions#destroy'
 resources :users, except: :new
 resources :rides
 resources :attractions
 match '/attractions/:id/ride', to: 'attractions#ride', via: :post, as: :ride_attraction

end
