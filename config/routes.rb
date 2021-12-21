Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  # to access all articles requests
  resources :articles, only: [:show] # specify to access only "show" action
end
