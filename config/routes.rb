Rails.application.routes.draw do

 root to: 'welcome#home'
 get '/signup', to: 'users#new', as: 'signup'
 resources :users, except: :new

end
