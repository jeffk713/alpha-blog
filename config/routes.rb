Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
    
  # to access all articles requests
  resources :articles #, only: [:index, :show, :new, :create, :edit, :update. :destroy] # specify to access only certain actions
end
