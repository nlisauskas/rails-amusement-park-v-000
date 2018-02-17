Rails.application.routes.draw do

 root to: 'welcome#home'
 get '/users/new', to: 'users#new', as: 'signup'
 get '/signin', to: 'users#login'
 resources :sessions, only: [:create]
 delete '/logout', to: 'sessions#destroy'
 resources :users, except: :new

end
