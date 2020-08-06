Rails.application.routes.draw do
  root to: 'yarukotos#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  
  resources :yarukotos
end