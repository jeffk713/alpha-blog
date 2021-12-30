Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
    
  # to access all articles requests
  resources :articles #, only: [:index, :show, :new, :create, :edit, :update. :destroy] # specify to access only certain actions
  
  get 'signup', to: 'users#new'

  resources :users, except: [:new] # since `new` action is used by GET request 'signup'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
